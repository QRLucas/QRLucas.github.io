#!/bin/bash
##SBATCH --account=priority-davidnidever
#SBATCH --partition=unsafe
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=2
#SBATCH --mem=64G
#SBATCH --time=0-40:00:00
#SBATCH --job-name=sextans-sim-fit-small
#SBATCH --chdir=/home/c22n857/apogee-fitting
#SBATCH --output=err_out/sim-fitting-small-%j.out
#SBATCH --error=err_out/sim-fitting-small-%j.err 
#SBATCH --mail-user=quentinlucas804@gmail.com
#SBATCH --mail-type=NONE

module load Anaconda3/2023.09-0
python -u SEXTANS/sextans_sim_fitting.py err_out/sim-fitting-small-%j.out