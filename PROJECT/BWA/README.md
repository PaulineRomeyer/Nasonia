# This is a tool to align sequenced data from Nasonia vitripennis strains

## BWA
*Authors: Pauline Romeyer & Kewin Ogink*
*Date: 25-1-2019*
*Purpose: Convert fastq.gz files into sorted .bam and sorted .bai files using BWA and SAMtools*

## Functioning
This script will index the reference transcriptome for BWA and SAMtools.
Subsequently the scripts in BWA/CODE will be will be executed simultaneously.

These scripts will convert the fastq.gz files into sorted .bam and sorted .bai files using BWA and SAMtools. bwasamPE will do so for the Paired End reads; bwasamSE for the Single End reads. These are outputted in BWA/RESULTS.


Clone me: 
```
git clone https://github.com/PaulineRomeyer/Nasonia.git
```

![rug](https://www.rug.nl/_definition/shared/images/logo--en.png)

[Visit Pauline](https://github.com/paulineromeyer) 
[Visit Kewin](https://github.com/kewinogink)
