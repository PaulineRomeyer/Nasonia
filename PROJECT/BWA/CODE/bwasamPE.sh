#!/bin/bash
#SBATCH --job-name=BWAmem_job_PE
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4000
#SBATCH --partition=short

#Authors: Pauline Romeyer & Kewin Ogink
#Date:
#Purpose: Use BWA and SAMtools to map all PAIRED end sequences to the reference genome

cd /data/p285088/Nasonia/PROJECT/BWA/DATA

# Loading BWA
module load BWA/0.7.17-foss-2018a

# Loading SAMtools
module load SAMtools/1.7-foss-2018a


# Indexing the reference transcriptome for BWA
bwa index Nvit_2.1_rna.fna

# Indexing the reference transcriptome for SAMtools
samtools faidx Nvit_2.1_rna.fna

cd PE/
ref=/data/p285088/Nasonia/PROJECT/BWA/DATA/Nvit_2.1_rna.fna
ref_fai=/data/p285088/Nasonia/PROJECT/DATA/Nvit_2.1_rna.fna.fai

 
for dir in MB*; do 
	cd $dir # move to each folder
	bwa mem -M -R '@RG\tID:sample_$dir\tLB:sample_$dir\tPL:ILLUMINA\tPM:HISEQ\tSM:sample_$dir' $ref *R1* *R2* > "$dir"_PE.bwa.sam; #perform bwa mem on PAIRED ends --> .sam
	samtools view -b *_PE.bwa.sam > "$dir"_PE.bwa.bam; # sam --> bam
	samtools sort *_PE.bwa.bam > "$dir"_PE.bwa.sorted.bam; #bam --> sorted.bam
	samtools index *_PE.bwa.sorted.bam; #sorted.bam --> indexed bam
  mv *_PE.bwa.sorted.bam /data/p285088/Nasonia/PROJECT/BWA/RESULTS/;
  mv *_PE.bwa.sorted.bam.bai /data/p285088/Nasonia/PROJECT/BWA/RESULTS/;
		cd ..
done

