#!/usr/bin/perl

###With this script you will be able to sort paired-end reads included in two fasta files. This might be necessary as upstream formatting process involving more files

##usage: Sort_Reads_Fasta.pl   input_1.fasta  input_2.fasta    File_SORTED_1.fasta(output) File_SORTED_2.fasta(output) 
####!!!!Remember to change the name of the output files at the end every time you run the script!!!!#####

use warnings;
use strict; 


open(OUT_1, ">$ARGV[2]");
open(OUT_2, ">$ARGV[3]");

## 1. create a hash between the read names and the sequences in the first fasta (left reads, _1 reads)##
## create a list of random headers to be used to pick random reads####
open(IN_1, $ARGV[0]);

my %read_sequence_1;
my $read_name_1;

while (my $line_1 = <IN_1>) {
    chomp($line_1);
    if ($line_1 =~ m/^>(.*)$/) { $read_name_1 = $line_1; }
    else {
        chomp($line_1);
        push(@{$read_sequence_1{$read_name_1}}, ($line_1));
    }
}
close(IN_1);

## 2. create a hash between the read names and the sequences in the second fasta (right reads, _2 reads)##
open(IN_2, $ARGV[1]);

my %read_sequence_2;
my $read_name_2;
while (my $line_2 = <IN_2>) {
    chomp($line_2);
    if ($line_2 =~ m/^>(.*)$/) { $read_name_2 = $line_2; }
    else {
        chomp($line_2);
        push(@{$read_sequence_2{$read_name_2}}, ($line_2));
    }
}
close(IN_2);

#####3. Sort the hash and print out the fasta file (left reads)######
for my $name1 (sort keys %read_sequence_1) {
       print OUT_1 "$name1\n@{$read_sequence_1{$name1}}\n"; 
}

#####4. Sort the hash and print out the fasta files (right reads)######
for my $name2 (sort keys %read_sequence_2) {
       print OUT_2 "$name2\n@{$read_sequence_2{$name2}}\n";
}

close(OUT_1);
close(OUT_2);
####remember to change the name of the files#####
system("sed -i '/^>/! s/ /\\n/g' File_SORTED_1.fasta");
system("sed -i '/^>/! s/ /\\n/g' File_SORTED_2.fasta");

