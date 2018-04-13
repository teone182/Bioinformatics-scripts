#!/usr/bin/perl

###With this script you will be able to get fasta sequences from a list of headers that you define.

##use: Get_Fasta_sequences_from_List.pl   input.fasta   list_of_headers   output.fasta

####In the list file the headers should be in different lines (remember to leave an empty line at the end of the file) and they should include the symbol >
####!!!!Remember to change the name of the output file at the end every time you run the script!!!!#####


use warnings;
use strict; 

open(OUT, ">$ARGV[2]");
open(IN_FASTA, $ARGV[0]);
open(IN_LIST, $ARGV[1]);

##1. Create an array with the header names to be extracted
my @headers;

while (my $line = <IN_LIST>) {
    chomp($line);
    push(@headers, $line);
}

close IN_LIST; 

## 2. Create a hash between the header and the sequence##


my %header_sequence;
my $name;
while (my $line = <IN_FASTA>) {
    chomp($line);
    if ($line =~ m/^>(.*)$/) { $name = $line; }
    else {
        chomp($line);
        push(@{$header_sequence{$name}}, ($line));
    }
}

close IN_FASTA;


## 3. Extract the list of random reads you created from the first file###
for (@headers) {
   if(exists $header_sequence{$_}) { 
       print OUT "$_\n@{$header_sequence{$_}}\n"; 
    }
}

close OUT;

####remember to change the name of the file every time you run the script#####
system("sed -i '/^>/! s/ /\\n/g' output.fasta"); 
