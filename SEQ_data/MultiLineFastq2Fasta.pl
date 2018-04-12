#!/usr/bin/perl

##With this script you are able to convert a multi-line fastq file into a fasta files. It does NOTs assume that there are 4 lines for each sequence
####+++IMPORTANT+++###
#It assumes you have previously used the script Fix_MultiLine_Fastq_header.sh to modify the header of each sequence# This script assumes 6 lines for every sequence, but you can change it if needed.

##USAGE: ./MultiLineFastq2Fasta.pl input.fastq output.fasta

use warnings;
use strict; 

open(OUT, ">$ARGV[1]");

## 1. create a hash between the read names and the sequences

open(IN, $ARGV[0]);

my %read_sequence;
my $header;

while ( my $line = <IN>) {
    chomp($line);
    if ($line =~ m/^@(.*);[a-zA-Z]+\/[12]$/) { 
        $line =~ s/^@/>/;
        $header = $line; }
            elsif ($line =~ m/^[ACGTN]+$/i) {
            push(@{$read_sequence{$header}}, ($line));
        }
                else {;};
    }
close(IN);

######print sequences as fasta format#######
for (keys %read_sequence) {
    print OUT "$_\n@{$read_sequence{$_}}\n";
}

system("sed -i '/^>/! s/ /\\n/g' output.fasta");####REMEMBER TO CHANGE THE NAME OF THE OUTPUT FILE EVERY TIME YOU RUN THE SCRIPT#####

close(OUT);
