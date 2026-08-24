import astropy.table as at
import astropy.units as u
from astropy.time import Time
import tables
import os
import matplotlib.pyplot as plt
import numpy as np
import thejoker as tj

all_visits = at.Table.read('apogee-data/allVisit-dr17-synspec_rev1.fits')
gal_members = at.Table.read('SEXTANS/SEXTANS_members.fits')

p_file = 'joker-prior-cache/prior_s:50m_P:12-7110_sk:30_sv:100_trend:1.hdf5'

prior = tj.JokerPrior.default(
    P_min=12 * u.day,
    P_max=7110 * u.day,
    sigma_K0=30 * u.km / u.s,
    sigma_v=100 * u.km / u.s,
    #sigma_v=[100*u.km/u.s, 
    #         0.05*u.km/u.s/u.day],
    #poly_trend=2
)

out_path = "SEXTANS/output_new/Sextans_P:12-7110_sk:30_sv:100_trend:1_rvall/"

if not os.path.exists(out_path):
    os.makedirs(out_path)

for star in gal_members:
    sID = star['APOGEE_ID']
    
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

    rng = np.random.default_rng(seed=42) 
    
    joker = tj.TheJoker(prior, rng=rng)
    
    samples = joker.iterative_rejection_sample(
        data, prior_samples=p_file, n_requested_samples=256, init_batch_size=100_000,return_logprobs=True
    )
    
    out_file = str(out_path +sID+ "_samples.hdf5")
    
    samples.write(out_file)

    #im_path = "sextans_outputs/plots/"+sID +"_models.png"
    #plt.figure(figsize=(8,5))
    #_ = tj.plot_rv_curves(samples, data=data)
    #plt.title(sID)
    #plt.savefig(im_path)
    
    #plt.close()