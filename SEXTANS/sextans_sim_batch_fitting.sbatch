#!/bin/bash
#SBATCH --account=priority-davidnidever
#SBATCH --partition=priority
#SBATCH --nodes=1 
#SBATCH --ntasks=70
#SBATCH --cpus-per-task=1
#SBATCH --mem=512G
#SBATCH --time=0-48:00:00
#SBATCH --job-name=sextans-sim-fit-large
#SBATCH --chdir=/home/c22n857/apogee-fitting
#SBATCH --output=err_out/sim-rv-fitting-%j.out
#SBATCH --error=err_out/sim-rv-fitting-%j.err 
#SBATCH --mail-user=quentinlucas804@gmail.com
#SBATCH --mail-type=ALL

date

module load Anaconda3/2023.09-0

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10123429-0134408/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10155207-0133310/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122523-0122257/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10135510-0117039/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10133675-0108018/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10135081-0145124/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10134639-0105145/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10134175-0211244/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10114299-0203505/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10124160-0132514/" &

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10102766-0207108/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122039-0151485/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10140428-0113225/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10140616-0142409/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10124101-0130115/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10131831-0129318/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10133529-0117548/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10135723-0144452/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10133004-0123428/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10103697-0208354/" &

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10131052-0131154/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122701-0130214/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10120529-0137449/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10143584-0054013/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10152648-0125203/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10143395-0117192/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122284-0135361/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10121613-0145482/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122620-0138301/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10132736-0134051/" &

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10144447-0128103/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10143985-0110527/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10143342-0135549/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10150261-0129550/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10143371-0145125/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10125459-0151383/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10124042-0124516/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10123736-0149044/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122295-0152342/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10134548-0156167/" &

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10095007-0132353/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10130762-0135592/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10111717-0200242/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10130068-0151225/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10111188-0148488/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10143705-0129399/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10152878-0114299/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10103984-0220079/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10153545-0131108/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10144343-0135015/" &

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10133094-0152148/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10121582-0124002/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10134122-0206086/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10121623-0144455/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10115131-0135594/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10111222-0155209/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10122791-0148052/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10130429-0134589/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10114967-0217426/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10115110-0154426/" &

python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10140363-0205477/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10120799-0148480/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10114127-0156097/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10094908-0126325/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10152592-0204318/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10133291-0155330/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10145923-0101026/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10140035-0110253/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/AP10095626-0204279/" &
python SEXTANS/sextans_sim_batch_fitting.py "SEXTANS/sextans_sim_data/N_SEXTANS_sim_sig_rvrjt/2M10131874-0131139/" &


wait
date