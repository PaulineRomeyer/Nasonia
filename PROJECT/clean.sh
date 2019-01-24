#!/bin/bash

#Author: Kewin Ogink
#Date: 21/01/2019
#Purpose: Clean the directories
rm slurm-*.out
for dirname in FASTQC_TRIM FASTQC_RAW TRIM BWA MULTIQC; do
	cd $dirname #move to each folder
  rm slurm-*.out
  rm CODE/slurm-*.out
	for dirname in DATA RESULTS; do
		rm -rf $dirname
	done 
	cd ../
done




