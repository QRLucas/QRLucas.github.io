#A script to generate a prior distribution for the Joker to use. 

import astropy.units as u
import numpy as np
import thejoker as tj

prior = tj.JokerPrior.default( 
    P_min= 2 * u.day,
    P_max= 10800 * u.day,
    sigma_K0=30 * u.km / u.s,
    #sigma_v=100 * u.km / u.s,
    sigma_v=[100*u.km/u.s, 
             0.05*u.km/u.s/u.day],
    poly_trend=2
)

#prior = tj.JokerPrior.default(  #Original params
#    P_min=2 * u.day,
#    P_max=1024 * u.day,
#    sigma_K0=30 * u.km / u.s,
#    sigma_v=[100*u.km/u.s, 
#             0.05*u.km/u.s/u.day],
#    poly_trend=2
#)

rng = np.random.default_rng(seed=42)  # for reproducibility
prior_samples = prior.sample(size=50_000_000, rng=rng, return_logprobs=True)

prior_filename = "joker-prior-cache/prior_s:50m_P:2-10800_sk:30_sv:100-0.05_trend:2.hdf5" 
prior_samples.write(prior_filename, overwrite=True)
