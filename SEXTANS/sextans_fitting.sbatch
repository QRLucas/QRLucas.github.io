#!/bin/bash
#SBATCH --account=priority-davidnidever
#SBATCH --partition=priority
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --time=0-20:00:00
#SBATCH --job-name=sextans-fitting-real
#SBATCH --chdir=/home/c22n857/apogee-fitting
#SBATCH --output=err_out/sextans-fitting-%j.out
#SBATCH --error=err_out/sextans-fitting-%j.err 
#SBATCH --mail-user=quentinlucas804@gmail.com
#SBATCH --mail-type=NONE

module load Anaconda3/2023.09-0

python SEXTANS/sextans_fitting.py