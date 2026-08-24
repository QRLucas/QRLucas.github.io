import astropy.table as at #These imports seem to be responsible for the bulk of the run-time
import astropy.units as u
from astropy.time import Time
import os

#import matplotlib.pyplot as plt  #Remember to uncomment if you want to plot things
import numpy as np
import thejoker as tj
#from glob import glob
import pathlib
from argparse import ArgumentParser

all_visits = at.Table.read('apogee-data/allVisit-dr17-synspec_rev1.fits')
gal_members = at.Table.read('CARINA/CARINA_members.fits')

p_file = 'joker-prior-cache/prior_s:50m_P:2-10800_sk:30_sv:100-0.05_trend:2.hdf5'

prior = tj.JokerPrior.default(
    P_min=2 * u.day,
    P_max=10800 * u.day,
    sigma_K0=30 * u.km / u.s,
    #sigma_v=100 * u.km / u.s,
    sigma_v=[100*u.km/u.s, 
             0.05*u.km/u.s/u.day],
    poly_trend=2
)

out_path = "CARINA/output_new/Carina_P:2-10800_sk:30_sv:100-0.05_trend:2_rvall/"

def run_Joker(index): 
    sID = gal_members['APOGEE_ID'][index]
    
    print(sID)
    
    if not os.path.exists(out_path):
        os.makedirs(out_path)
    out_file = str(out_path +sID+ "_samples.hdf5")
    
    #if os.path.exists(out_file): #check to see if file exists. Didn't use this as I wanted to overwrite old outputs
    #    return
    
    visits = all_visits[all_visits['APOGEE_ID']==sID]
    
    visit_mask = np.invert(visits["VHELIO"].mask)
    #vreject_mask = (visits["STARFLAG"] &(2**19)==0)
    
    mask = visit_mask #& vreject_mask
    
    col1 = visits["JD"][mask]
    col2 = visits["VHELIO"][mask]
    col3 = visits["VRELERR"][mask]
    
    col2.unit = u.km/u.s
    col3.unit = u.km/u.s
    
    data = tj.RVData(t=col1, rv = col2, rv_err = col3)

    rng = np.random.default_rng(seed=int(index)) 
    
    joker = tj.TheJoker(prior, rng=rng)
    
    samples = joker.iterative_rejection_sample(
        data, prior_samples=p_file, n_requested_samples=256, init_batch_size=100_000,return_logprobs=True
    )
    
    samples.write(out_file,overwrite=True)
    
if __name__ == "__main__": 
    parser = ArgumentParser(description='Run the Joker on sample RV data') #I pass the input file name to the program when I call it
    parser.add_argument('dirs', type=str, nargs='+', help='Spectrum FITS files or list')
    args = parser.parse_args()
    
    print(args.dirs[0])
    
    run_Joker(int(args.dirs[0]) )