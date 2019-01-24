#!/bin/bash
#SBATCH --job-name=Trim_job
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4000
#SBATCH --partition=regular

cd DATA/
mkdir PE
ln -s /data/p285088/Nasonia/RAW_DATA/PE/* PE/.
cd PE/
for i in *R1*; do mavar=$(echo $i | cut -d "_" -f1); mkdir $mavar;mv $i $mavar ; done
for i in *R2*; do mavar=$(echo $i | cut -d "_" -f1);mv $i $mavar ; done

cd /data/p285088/Nasonia/PROJECT/TRIM/DATA
mkdir SE
ln -s /data/p285088/Nasonia/RAW_DATA/SE/* SE/. #Link raw data into data 
cd SE/
for i in *R1*; do mavar=$(echo $i | cut -d "_" -f1); mkdir $mavar;mv $i $mavar ; done

cd /data/p285088/Nasonia/PROJECT/TRIM/RESULTS/
mkdir PE
mkdir SE

cd /data/p285088/Nasonia/PROJECT/TRIM/CODE/
sbatch trimPE.sh
cd /data/p285088/Nasonia/PROJECT/TRIM/CODE/
sbatch trimSE.sh

