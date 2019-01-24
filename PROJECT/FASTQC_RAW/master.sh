#!/bin/bash

#SBATCH --job-name=nasonia_fastq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=1-00:00
#SBATCH --mem=4000
#SBATCH --partition=regular

#Authors: Pauline Romeyer & Kewin Ogink
#Date:
#Purpose: Link RNA-seq .fastq.gz files from the DATA_REPOSITORY to 
# DATA of FASTQC_RAW, and copying it to RESULTS of FASTQC_RAW. 
# Then, input these in the program fastqc and output it into RESULTS of FASTQC_RAW,
# and also copying the results to DATA of MULTIQC

#load the software FastQC
module load FastQC/0.11.2

#link the Data repository with raw data to DATA
ln -s -r /data/p285088/Nasonia/RAW_DATA/PE/* DATA/.
ln -s -r /data/p285088/Nasonia/RAW_DATA/SE/* DATA/.
#link the DATA to the RESULTS so the DATA will not be altered
scp DATA/* RESULTS/.

#run fastqc on all .fastq.gz files in the RESULTS folder
fastqc RESULTS/*

# copy the resulting .zip and .html files to the MULTIQC/DATA folder
# CHANGE TO LINK FROM RESULTS TO MULTIQC
scp RESULTS/{*.zip,*.html}  ../MULTIQC/DATA/. 

cd /data/p285088/Nasonia/PROJECT/TRIM/
sbatch master.sh


