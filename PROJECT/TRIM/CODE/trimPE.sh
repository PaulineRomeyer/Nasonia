#!/bin/bash
#SBATCH --job-name=Trim_job
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=4000
#SBATCH --partition=regular

module load Trimmomatic/0.36-Java-1.8.0_92 #Load trimmomatic and Java
AdaptorsPE=/data/p285088/Nasonia/PROJECT/TRIM/CODE/TruSeq3-PE.fa

cd /data/p285088/Nasonia/PROJECT/TRIM/DATA/PE #Go to data directory to run the for loop
for i in MB*; do
  cd $i;
  java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.36.jar PE *R1* *R2* ./"$i"_R1_paired.fastq.gz "$i"_R1_unpaired.fastq.gz "$i"_R2_paired.fastq.gz "$i"_R2_unpaired.fastq.gz ILLUMINACLIP:$AdaptorsPE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36; #Run trimmomatic for Paired End sequences
  mv *_paired* /data/p285088/Nasonia/PROJECT/TRIM/RESULTS/PE; #Move the "paired" results to Results because those are the one that have better quality
  cd ..;
done

cd /data/p285088/Nasonia/PROJECT/TRIM/RESULTS/PE;
for i in *R1*; do mavar=$(echo $i | cut -d "_" -f1); mkdir $mavar;mv $i $mavar ; done
for i in *R2*; do mavar=$(echo $i | cut -d "_" -f1);mv $i $mavar ; done
cd ..
#move the RESULTS of TRIM to FASTQC_TRIM DATA
mv ./* /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/DATA/

cd /data/p285088/Nasonia/PROJECT/FASTQC_TRIM/
sbatch master.sh