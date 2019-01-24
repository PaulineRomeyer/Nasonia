#!/bin/bash

#SBATCH --job-name=nasonia_master
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=1-00:00
#SBATCH --mem=4000
#SBATCH --partition=regular

# Author: Pauline Romeyer & Kewin Ogink
# Date: 
# Purpose: Run the Nasonia project


for dirname in FASTQC_RAW FASTQC_TRIM TRIM BWA; do
	cd $dirname #move to folder
	for dirname in DATA RESULTS; do
		mkdir $dirname #make folders DATA and RESULTS in each step-folder
	done
  cd ../ #go back on folder
done
cd FASTQC_RAW/
sbatch master.sh #execute the master.sh in each step-folder. should be in job submission format.