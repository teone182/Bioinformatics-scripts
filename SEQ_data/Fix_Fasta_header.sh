#!/bin/bash

##With this script you are able to label the header of sequences of multiple fasta files with a specific tag of your choice (for example the name of the species the sequences are generated from). 
##USAGE: ./Fix_Fasta_header.sh

##the input files directory should include two input fasta files, each specifying a set of reads (left reads/_1 and right reads/_2). The file names have the name of the specific tag you want to apply (e.g. species1, species2, etc.), the set of reads (_1/_2) and the extension .fasta (e.g. species1_1.fasta and species1_2.fasta) 
##the input files directory should include a list (fasta_tags.list) with all the file tags you want to apply. Each tag should be in a different line. Don't forget to leave an empty line at the end of the list file  
##the tags of the fasta files (i.e. species1, species2) will be use to correctly define the header of each sequence in the output fasta files. The header will also include the standard paired-end reads definition /1 and /2

in_dir='/Matteo/my_input_files_directory/' ##you might need to change it every time your run the script
out_dir='Matteo/my_output_files_directory/' ##you might need to change it every time your run the script

cd $in_dir

while read line; do

sed "s/>.*/&\;$line\/1/" ${line}_1.fasta | sed "/^>/s/ /\-/g" > ${out_dir}${line}_1.fasta


sed "s/>.*/&\;$line\/2/" ${line}_2.fasta | sed "/^>/s/ /\-/g" > ${out_dir}${line}_2.fasta


done<fasta_tags.list ##you might need to change it every time your run the script
