#!/usr/bin/perl

##With this script you are able to filter fasta sequences by length. You will get all sequences with a defined length that you specify##

##usage: FilterFastaByLength_GetAllSeqWithDefLength.pl input.fasta output.fasta 100($defined_length) 

use warnings;
use strict;

open(IN, $ARGV[0]);
open(OUT, ">$ARGV[1]");
my $defined_length = $ARGV[2];

######create a hash with the fasta headers and the sequences######
my %contigs_sequence;
my $contig_name;
while (my $line = <IN>) {
    chomp($line);
    if ($line =~ m/^>(.*)$/) { $contig_name = $line; }
    else {
        chomp($line);
        $contigs_sequence{$contig_name} .= $line;
    }
}

close IN;


## 2. Extract only the contigs with length equal to $defined_length###

foreach my $key (keys %contigs_sequence) {
    my $seq_length = length $contigs_sequence{$key};
    if ($seq_length = $defined_length) {
        print OUT "$key\n$contigs_sequence{$key}\n";
    }
}

close OUT;
