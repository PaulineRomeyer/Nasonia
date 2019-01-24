# This is a tool to align sequenced data from Nasonia vitripennis strains

## FASTQC_RAW

*Authors: Pauline Romeyer & Kewin Ogink*
*Date: 25-1-2019*
*Purpose: Check .fastq.gz data using the program FastQC.*

## Functioning
This script will run all Single End (SE) and Paired End (PE) data from the Nasonia/RAW_DATA directory through the program FastQC, which will check the quality of the reads.
The output will be located in FASTQC_RAW/RESULTS, as well as in the MULTIQC/DATA folder.
Relevant output data is .html and .zip files of images of the quality of the reads. These allow for manual quality check.
Subsequently the next step, TRIM, will be performed.


Clone me: 
```
git clone https://github.com/paulineromeyer/Nasonia.git ???????????
```

![rug](https://www.rug.nl/_definition/shared/images/logo--en.png)

[Visit Pauline](https://github.com/paulineromeyer) 
[Visit Kewin](https://github.com/kewinogink)
