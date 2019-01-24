#!/bin/bash
#SBATCH --job-name=nasonia_fastq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=1-00:00
#SBATCH --mem=4000
#SBATCH --partition=regular

#Authors: Pauline Romeyer & Kewin Ogink
#Date:
#Purpose: Import RNA-seq .fastq.gz files from the RESULTS of TRIM,
# input them in the program fastqc and output the data to RESULTS of FASTQC_TRIM
# and also copying it to DATA of MULTIQC

#load the software FastQC
module load FastQC/0.11.2

cd /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/DATA/PE/
#run fastqc on all .fastq.gz files in the Data folder PE and move the results to the Results folder
for i in MB*; do
  cd $i;
  fastqc *MB*;
  mv {*.zip,*.html} /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/RESULTS/
  cd ../
done

cd /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/DATA/SE/

#run fastqc on all .fastq.gz files in the Data folder and move the results to the Results
for i in MB*; do
  cd $i;
  fastqc *MB*;
  mv {*.zip,*.html} /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/RESULTS/
  cd ../
done 

cd /data/p285088/Nasonia/PROJECT/BWA/
sbatch master.sh
