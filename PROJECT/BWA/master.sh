#!/bin/bash
#SBATCH --job-name=BWAmem_job_PE
#SBATCH --time=00:30:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4000
#SBATCH --partition=short

#Authors: Pauline Romeyer & Kewin Ogink
#Date:
#Purpose: 
	# -make SE and PE directories in BWA/DATA 
	# -link RESULTS of TRIM to DATA of BWA
	# -link reference transcriptome to DATA of BWA
	# -index reference transcriptome for BWA and SAMtools

	# -run the scripts for BWA and SAMtools in CODE for both SE and PE

cd DATA/
#Move the data from FASTQC_TRIM where it is not needed anymore
mv /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/DATA/PE /data/p285088/Nasonia/PROJECT/BWA/DATA/PE
mv /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/DATA/SE /data/p285088/Nasonia/PROJECT/BWA/DATA/SE

# link reference transcriptome to DATA of BWA
cp /data/p285088/Nasonia/RAW_DATA/Nvit_2.1_rna.fna.gz ./
gunzip Nvit_2.1_rna.fna.gz #unzip reference genome

# -run the scripts for BWA and SAMtools in CODE for both PE and SE
cd ..
cd CODE/
sbatch bwasamPE.sh
sbatch bwasamSE.sh



