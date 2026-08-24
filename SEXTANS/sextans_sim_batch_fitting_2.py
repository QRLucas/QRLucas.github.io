import astropy.table as at #These imports seem to be responsible for the bulk of the run-time
import astropy.units as u
from astropy.time import Time
import os

#import matplotlib.pyplot as plt  #Remember to uncomment if you want to plot things
import numpy as np
import thejoker as tj
from glob import glob
import pathlib
from argparse import ArgumentParser

#read_path = "SEXTANS/sim_data_new/sim_xsig_rvall/*.fits" #These lines aren't actually used, but I forgot to take them out before running it.
#sample_files = glob(read_path)

p_file = 'joker-prior-cache/prior_s:50m_P:2-7110_sk:30_sv:100_trend:1.hdf5'

prior = tj.JokerPrior.default(
    P_min= 2 * u.day,
    P_max= 7110 * u.day,
    sigma_K0= 30 * u.km / u.s,
    sigma_v= 100 * u.km / u.s,
    #sigma_v=[100*u.km/u.s, 
    #         0.05*u.km/u.s/u.day],
    #poly_trend=2
)

def run_Joker(file):  #Thanks to a typo (see below in main), none of this actually ran. :[
    foo_path = pathlib.Path(file)  #Just get an index number that we'll use for outputs
    fID = foo_path.parts[-1].split(".")[0]
    ID = fID.split("_")[2] #1 for old method

    out_path = "SEXTANS/output_new/Sextans_sim_wsig_p12-nan_raghavan_P:2-7110_sk:30_sv:100_trend:1_rvall/" #sim_wsig_p12-nan_raghavan_rvall

    if not os.path.exists(out_path):  #File management stuff
        os.makedirs(out_path)
        
    out_file = str(out_path +"sim_" +ID+ "_samples.hdf5")
    
    #if os.path.exists(out_file): #check to see if file exists. Didn't use this as I wanted to overwrite old outputs
    #    return
    
    sim_data = at.Table.read(file) 
    
    col1 = sim_data["MJD"]
    col2 = sim_data["VHELIO"]
    col3 = sim_data["VRELERR"]
    
    col2.unit = u.km/u.s
    col3.unit = u.km/u.s
    
    data = tj.RVData(t=col1, rv = col2, rv_err = col3)

    hash = int(os.environ["SLURM_ARRAY_TASK_ID"])
    rng = np.random.default_rng(seed = hash)
    
    joker = tj.TheJoker(prior, rng=rng)
    
    samples = joker.iterative_rejection_sample(
        data, prior_samples=p_file, n_requested_samples=256, init_batch_size=100_000,return_logprobs=True
    )

    samples.write(out_file, overwrite = True)
    
if __name__ == "__main__": 
    parser = ArgumentParser(description='Run the Joker on sample RV data') #I pass the input file name to the program when I call it
    parser.add_argument('dirs', type=str, nargs='+', help='Spectrum FITS files or list')
    args = parser.parse_args()
    
    run_Joker(args.dirs[0]) 