#!/bin/bash

##With this script you are able to convert multiple fastq files into fasta files. It assumes four lines for every sequence and the actual sequence being in the second line.

##USAGE: ./Fastq2Fasta.sh

##the input files directory should include two input fastq files, each specifying a set of reads (left reads/_1 and right reads/_2). The file names have the name of the specific tag you want to apply (e.g. species1, species2, etc.), the set of reads (_1/_2) and the extension .fastq (e.g. species1_1.fastq and species1_2.fastq)
##the input files directory should include a list (fastq_tags.list) with all the file names (without read pair specification and extension). Each name should be in a different line. Don't forget to leave an empty line at the end of the list file

in_dir='/Matteo/my_input_files_directory/' ##you might need to change it every time your run the script
out_dir='/Matteo/my_output_files_directory/' ##you might need to change it every time your run the script

cd $in_dir

while read line; do

sed -n "1~4 s/^@/>/p; 2~4p" ${line}_1.fq > ${out_dir}${line}_1.fasta ##you might need to change the extension of the fastq file (fastq or fq)

sed -n "1~4 s/^@/>/p; 2~4p" ${line}_2.fq > ${out_dir}${line}_2.fasta ##you might need to change the extension of the fastq file (fastq or fq)

done<fastq_names.list ##you might need to change it every time your run the script