# This is a tool to align sequenced data from Nasonia vitripennis strains

*Authors: Pauline Romeyer & Kewin Ogink*
*Date: 25-1-2019*
*Purpose: Align sequenced data from Nasonia vitripennis strains.*

Input are fastq.gz sequence and reference files. Output are multiple files: fastqc images, trimmed fastq.gz files, sorted .bam and sorted .bai files and a Multiqc report. 

We made use of transcriptomic data, but any .fastq.gz data can be used, as long as an accompanying reference sequence is provided.

## How to use
* Run the master.sh script in Nasonia/PROJECT/ to start analysis.

* Sequence data should be divided in Nasonia/RAW_DATA in either PE (Paired End reads) or SE (Single End reads). Reference sequence should be in Nasonia/RAW_DATA. 

* Available software is loaded through the command line "module load [name software]" These should be present on the users pc or remote computer. Modules used are: FastQC, Trimmomatic, BWA, SAMtools #############MULTIQC??###########

* ALL .master.sh and .sh files in /CODE need to be checked for having the correct path. 

* To start fresh use the clean script (deletes all DATA & RESULTS folders, as well as any slurm-files).

* Resulting files will be IN MULTIQC?? ######################

* Note: For some reason, trimmomatic SE doesn't want to run the sub sampled toy files provided, but the script works for normal fastq.gz files.

* Note: This program makes use of the Peregrine HPC cluster of the University of Groningen. Hence, it is not designed to work without using this cluster.

**WARNING Run in computer cluster if data > 1GB WARNING**

## Consecutive steps executed:

1. FASTQC_RAW
2. TRIM
3. FASTQC_TRIM
4. BWA
5. MULTIQC

See respective README's for more detailed information of each step.


Clone me: 
```
git clone https://github.com/PaulineRomeyer/Nasonia.git
```

![rug](https://www.rug.nl/_definition/shared/images/logo--en.png)

[Visit Pauline](https://github.com/paulineromeyer) 
[Visit Kewin](https://github.com/kewinogink)
