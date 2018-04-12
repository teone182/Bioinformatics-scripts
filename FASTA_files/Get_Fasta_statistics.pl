#!/usr/bin/perl

##With this script you will be able to get some statistics of your fasta file: total sequence bp, sequences average length, sequences average length standard deviation, N50 length, N50 value, L50

#######usage: Get_Fasta_statistics.pl input.fasta output_file

use warnings;
use strict;

open(OUT, ">$ARGV[1]");

open(IN_FASTA, $ARGV[0]);

my $contig_name;
my %contigs_sequence;
my @seq_length;

while (my $line = <IN_FASTA>) {
    chomp($line);
    if ($line =~ m/^>(.*)$/) { $contig_name = $line; }
    else {
        chomp($line);
        $contigs_sequence{$contig_name} .= $line
    }
}

close IN_FASTA;

foreach my $key (keys %contigs_sequence) {
    push(@seq_length, length $contigs_sequence{$key});
}

### Total length, average, standard deviation####
my $Fasta_sum = &sum(@seq_length);
my $Fasta_ave = &average(@seq_length);
my $Fasta_std = &stdev(@seq_length);


####N50 length and value, L50####
my @seq_length_sorted = sort {$b <=> $a} @seq_length;
my $N50_length; 
my $L50_value;
foreach my $value(@seq_length_sorted){
     $N50_length+=$value;
     $L50_value++;
      if($N50_length >= ($Fasta_sum/2)){
         print OUT "FASTA_BP_SUM\tFASTA_AVERAGE\tFASTA_STANDARD_DEVIATION\tFASTA_N50_LENGTH\tFASTA_N50_VALUE\tFASTA_L50_VALUE\n$Fasta_sum\t$Fasta_ave\t$Fasta_std\t$N50_length\t$value\t$L50_value";
         last; 
     }
}



sub sum {
    my @array = @_;
    my $sum;
    foreach (@array) {
        $sum += $_;
    }
return $sum;
}


sub average {
    my @array = @_;
    my $sum; 
    foreach (@array) {
        $sum += $_;
    }
return $sum/@array;
}


sub stdev{
    my @array = @_;
    my $average = &average(@array);
    my $sqtotal = 0;
    foreach(@array) {
        $sqtotal += ($average-$_) ** 2;
        }
    my $std = ($sqtotal / (@array-1)) ** 0.5;
    return $std;
}


