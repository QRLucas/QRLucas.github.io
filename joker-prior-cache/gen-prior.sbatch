#!/bin/bash
#SBATCH --account=priority-davidnidever
#SBATCH --partition=priority
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=4
#SBATCH --mem=512G
#SBATCH --time=0-24:00:00
#SBATCH --job-name=joker-prior 
#SBATCH --chdir=/home/c22n857/apogee-fitting
#SBATCH --output=err_out/prior-gen-%j.out
#SBATCH --error=err_out/prior-gen-%j.err 
#SBATCH --mail-user=quentinlucas804@gmail.com
#SBATCH --mail-type=NONE

module load Anaconda3/2023.09-0
python $HOME/apogee-fitting/joker-prior-cache/gen-prior.py