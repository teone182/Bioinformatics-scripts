#!/usr/bin/perl

###With this script you will be able to get any fasta sequence matching a specific string (that you define) in the header.

##use: Get_Fasta_sequences.pl   input.fasta     match_in_the_sequence_header    output.fasta
####!!!!Remember to change the name of the output files at the end every time you run the script!!!!#####


use warnings;
use strict; 

open(OUT, ">$ARGV[2]");
my $match_contig = $ARGV[1]; 


## 1. create a hash between the contig names and the sequences##
open(IN, $ARGV[0]);

my %contigs_sequence;
my $contig_name;
while (my $line = <IN>) {
    chomp($line);
    if ($line =~ m/^>(.*)$/) { $contig_name = $line; }
    else {
        chomp($line);
        push(@{$contigs_sequence{$contig_name}}, ($line));
    }
}


close IN;


## 2. Extract only the contigs with the match I set###
for (grep /$match_contig/, keys %contigs_sequence) {
print OUT "$_\n@{$contigs_sequence{$_}}\n";
}

close OUT;

system("sed -i '/^>/! s/ /\\n/g' output.fasta"); 
