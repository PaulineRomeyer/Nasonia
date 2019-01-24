#!/bin/bash
#SBATCH --job-name=Trim_job
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=4000
#SBATCH --partition=regular

module load Trimmomatic/0.36-Java-1.8.0_92 #Load trimmomatic and Java
AdaptorsSE=/data/p285088/Nasonia/PROJECT/TRIM/CODE/TruSeq3-SE.fa

cd /data/p285088/Nasonia/PROJECT/TRIM/DATA/SE #Go to data directory to run the for loop
for i in MB*; do
  cd $i;
  java -jar $EBROOTTIMMOMATIC/trimmomatic-0.36.jar SE *R1* ./"$i"_paired_R1.fastq.gz ILLUMINACLIP:$AdaptorsSE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOWS:4:15 MINLEN:36; #Run trimmomatic for Paired End sequences
  mv *_paired* /data/p285088/Nasonia/PROJECT/TRIM/RESULTS/SE; #Move the "paired" results to Results because those are the one that have better quality
  cd ..;
done

cd /data/p285088/Nasonia/PROJECT/TRIM/RESULTS/SE;
for i in *R1*; do mavar=$(echo $i | cut -d "_" -f1); mkdir $mavar;mv $i $mavar ; done

