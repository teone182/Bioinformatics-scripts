#!/usr/bin/perl

##With this script you are able to validate a fasta file for the presence of non-standard characters (characters different from A, C, G, T and N).
##The fasta file could also be multi-line.

##USAGE: ./Validate_Fasta.pl input.fasta

use warnings;
use strict;

open(IN, $ARGV[0]);

my $SeqAll;

while ( my $line = <IN>) {
    chomp($line);
    if ($line =~ m/^>(.*)$/) {;}
        else { $SeqAll .= $line; }
}

if ($SeqAll !~ m/^[ACGTN]+$/i) { print "Your fasta file cannot be validated: non-standard characters are present!\n";}
    else {print "Your fasta file is valid!\n";}

close(IN);