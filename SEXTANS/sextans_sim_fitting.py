print("Hello world")

import astropy.table as at
import astropy.units as u
from astropy.time import Time
import os

import matplotlib.pyplot as plt
import numpy as np
import thejoker as tj
from glob import glob
import pathlib

read_path = "SEXTANS/sim_data_new/sim_xsig_rvall/*.fits" #print(sum(threshold1))
sample_files = glob(read_path)
print(sample_files)

p_file = 'joker-prior-cache/prior_s:50m_P:2-1024_sk:30_sv:100-0.05_trend:2.hdf5'

prior = tj.JokerPrior.default(
    P_min= 2 * u.day,
    P_max= 1024 * u.day,
    sigma_K0= 30 * u.km / u.s,
    #sigma_v= 100 * u.km / u.s,
    sigma_v=[100*u.km/u.s, 
             0.05*u.km/u.s/u.day],
    poly_trend=2
)

out_path = "SEXTANS/output_new/Sextans_sim_xsig_P:2-1024_sk:30_sv:100-0.05_trend:2_rvall/"

if not os.path.exists(out_path):
    os.makedirs(out_path)

for file in sample_files:
    foo_path = pathlib.Path(file)
    fID = foo_path.parts[-1].split(".")[0]
    ID = fID.split("_")[2] #1 for old method
    #ID = foo_path.parts[-2].split(".")[0]  #For test only, use other method of doing multiple stars

    out_file = str(out_path +"sim_" +ID+ "_samples.hdf5")
    im_path = "SEXTANS/output_files/sim_plots/"+ID +"_models.png"
    
    out_lib = pathlib.Path(out_file)
    if out_lib.exists():
        continue
    
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

    samples.write(out_file, overwrite=True)
