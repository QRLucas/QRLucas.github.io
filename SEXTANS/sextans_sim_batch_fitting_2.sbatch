#!/bin/bash
##SBATCH --account=priority-davidnidever
#SBATCH --partition=unsafe
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=2
#SBATCH --mem=20G  
#SBATCH --time=0-6:00:00
#SBATCH --job-name=sextans-sim-array
#SBATCH --chdir=/home/c22n857/apogee-fitting
#SBATCH --output=err_out/array_example_%j.out
#SBATCH --error=err_out/array_example_%j.err
#SBATCH --mail-user=quentinlucas804@gmail.com
#SBATCH --mail-type=NONE
#

date

# default values, for handling the array stuff. I'm gonna be honest, I don't really understand
# how this works, as I couldn't find an applicable tutorial and just copied and modified some examples.

F_PATH="SEXTANS/sim_data_new/sim_wsig_p12-nan_raghavan_rvall"
F_NAME="rv_sim_"
F_EXT=".fits"
F_PATH_NAME=${F_PATH}/${F_NAME}${SLURM_ARRAY_TASK_ID}${F_EXT}

echo ${F_PATH_NAME}


module load Anaconda3/2023.09-0

python -u SEXTANS/sextans_sim_batch_fitting_2.py ${F_PATH_NAME} err_out/array_example_%j.out

date
