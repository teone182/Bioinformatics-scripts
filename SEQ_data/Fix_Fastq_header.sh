#!/bin/bash

##With this script you are able to label the header of sequences of multiple fastq files with a specific tag of your choice (for example the name of the species the sequences are generated from). 
##It assumes that the fastq file has 4 lines characterizing each sequence (header, sequence, id, quality)

##USAGE: ./Fix_Fastq_header.sh

##the input files directory should include two input fastq files, each specifying a set of reads (left reads/_1 and right reads/_2). The file names have the name of the specific tag you want to apply (e.g. species1, species2, etc.), the set of reads (_1/_2) and the extension .fastq (e.g. species1_1.fastq and species1_2.fastq) 
##the input files directory should include a list (fastq_tags.list) with all the file tags you want to apply. Each tag should be in a different line. Don't forget to leave an empty line at the end of the list file  
##the tags of the fastq files (i.e. species1, species2) will be use to correctly define the header of each sequence in the output fasta files. The header will also include the standard paired-end reads definition /1 and /2

in_dir='/Matteo/my_input_files_directory/' ##you might need to change it every time your run the script
out_dir='Matteo/my_output_files_directory/' ##you might need to change it every time your run the script

cd $in_dir

while read line; do

sed "1~4 s/^.*/&\;$line\/1/" ${line}_1.fastq | sed "1~4 s/ /\-/g" > ${out_dir}${line}_1.fastq

sed "1~4 s/^.*/&\;$line\/2/" ${line}_2.fastq | sed "1~4 s/ /\-/g" > ${out_dir}${line}_2.fastq

done<fastq_tags.list ##you might need to change it every time your run the script