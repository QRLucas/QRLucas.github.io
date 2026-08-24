#!/bin/bash
##SBATCH --account=priority-davidnidever
#SBATCH --partition=unsafe
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=2
#SBATCH --mem=20G  
#SBATCH --time=0-6:00:00
#SBATCH --job-name=sextans-real-array
#SBATCH --chdir=/home/c22n857/apogee-fitting
#SBATCH --output=err_out/carina_array_%j.out
#SBATCH --error=err_out/carina_array_%j.err
#SBATCH --mail-user=quentinlucas804@gmail.com
#SBATCH --mail-type=NONE
#

date

F_PATH="CARINA/sim_data_new/sim_xsig_rvall"
F_NAME="rv_sim_"
F_EXT=".fits"
F_PATH_NAME=${F_PATH}/${F_NAME}${SLURM_ARRAY_TASK_ID}${F_EXT}


module load Anaconda3/2023.09-0

python -u CARINA/carina_fitting_2.py ${SLURM_ARRAY_TASK_ID} err_out/array_example_%j.out

date
