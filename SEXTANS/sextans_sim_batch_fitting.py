import astropy.table as at
import astropy.units as u
from astropy.time import Time
import os

import matplotlib.pyplot as plt
import numpy as np
import thejoker as tj
from glob import glob
import pathlib
from argparse import ArgumentParser

p_file = 'joker-prior-cache/prior_sample_50m_prob_xtrend_smsigv_longp.hdf5'
    
prior = tj.JokerPrior.default(
    P_min=2 * u.day,
    P_max=10240 * u.day,
    sigma_K0=30 * u.km / u.s,
    sigma_v=[100*u.km/u.s, 
             0.05*u.km/u.s/u.day],
    poly_trend=2
)

def run_Joker(file,sID):
    foo_path = pathlib.Path(file)
    fID = foo_path.parts[-1].split(".")[0]
    ID = fID.split("_")[2]

    out_path = "SEXTANS/output_files/sim_samples/batch_sim_binary_longp/"+sID + "/"
    if not os.path.exists(out_path):
        os.makedirs(out_path)
    
    out_file = out_path + "sim_"+ID+"_samples.hdf5"
    
    if os.path.exists(out_file): #check to see if file exists
        return
    
    #print(out_file)
    
    sim_data = at.Table.read(file)
    
    col1 = sim_data["MJD"]
    col2 = sim_data["VHELIO"]
    col3 = sim_data["VRELERR"]
    
    col2.unit = u.km/u.s
    col3.unit = u.km/u.s
    
    data = tj.RVData(t=col1, rv = col2, rv_err = col3)

    rng = np.random.default_rng(seed=42) 
    
    joker = tj.TheJoker(prior, rng=rng)
    
    samples = joker.iterative_rejection_sample(
        data, prior_samples=p_file, n_requested_samples=256, init_batch_size=100_000,return_logprobs=True
    )

    samples.write(out_file, overwrite = True)

if __name__ == "__main__":
    parser = ArgumentParser(description='Run the Joker on sample RV data')
    parser.add_argument('dirs', type=str, nargs='+', help='Spectrum FITS files or list')
    args = parser.parse_args()
    
    print(args.dirs)
    
    for direc in args.dirs:
        sample_files = glob(direc + "*")
        sample_files.sort()
        
        print(direc)
        print(sample_files)
        
        foo_path = pathlib.Path(direc)
        fID = foo_path.parts[-1].split(".")[0]
        sID = fID.split("/")[0]
        
        for file in sample_files:
            run_Joker(file, sID)
