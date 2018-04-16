## Bioinformatics-scripts

Collection of bioinformatics scripts dealing with basic Next Generation Sequencing data manipulation.
The scripts run on the command line in a GNU/Linux environment.

# FASTA_files

-FilterFastaByLength_GetAllSeqHigherThanDefLength.pl

With this script you are able to filter fasta sequences by length. You will get all sequences with length equal or higher than the value you define.
Usage: FilterFastaByLength_GetAllSeqHigherThanDefLength.pl input.fasta output.fasta 50

-FilterFastaByLength_GetAllSeqLowerThanDefLength.pl

With this script you are able to filter fasta sequences by length. You will get all sequences with length equal or lower than the value you define.
Usage: FilterFastaByLength_GetAllSeqLowerThanDefLength.pl input.fasta output.fasta 200

-FilterFastaByLength_GetAllSeqWithDefLength.pl

With this script you are able to filter fasta sequences by length. You will get all sequences with a defined length that you specify.
Usage: FilterFastaByLength_GetAllSeqWithDefLength.pl input.fasta output.fasta 500

-Get_Fasta_sequences.pl

With this script you will be able to get any fasta sequence matching a specific string (that you define) in the header.
Usage: Get_Fasta_sequences.pl   input.fasta     match_in_the_sequence_header    output.fasta

-Get_Fasta_sequences_from_List.pl

With this script you will be able to get fasta sequences from a list of headers that you define.
Usage: Get_Fasta_sequences_from_List.pl   input.fasta   list_of_headers   output.fasta

-Get_Fasta_statistics.pl

With this script you will be able to get some statistics of your fasta file: total sequence bp, sequences average length, sequences average length standard deviation, N50 length, N50 value and L50.
Usage: Get_Fasta_statistics.pl input.fasta output_file

-Validate_Fasta.pl

With this script you are able to validate a fasta file for the presence of non-standard characters (characters different from A, C, G, T and N).
Usage: ./Validate_Fasta.pl input.fasta


# SEQ_data

-Extract_Random_ReadSubset_fromFasta.pl

With this script you are able to create a subset of random reads (paired-end) from two starting fasta files.
Usage: Extract_Random_ReadSubset_fromFasta.pl   input_1.fasta   input_2.fasta    output_subset_1.fasta output_subset_1.fasta 1000

-Fastq2Fasta.sh

With this script you are able to convert multiple fastq files into fasta files. It assumes four lines for every sequence and the actual sequence being in the second line.
Usage: ./Fastq2Fasta.sh

-Fix_Fasta_header.sh

With this script you are able to label the header of sequences of multiple fasta files with a specific tag of your choice (for example the name of the species the sequences are generated from).
Usage: ./Fix_Fasta_header.sh

-Fix_Fastq_header.sh

With this script you are able to label the header of sequences of multiple fastq files with a specific tag of your choice (for example the name of the species the sequences are generated from). It assumes that the fastq file has 4 lines characterizing each sequence (header, sequence, id, quality).
Usage: ./Fix_Fastq_header.sh

-Fix_MultiLine_Fastq_header.sh

With this script you are able to label the header of sequences of multiple fastq files with a specific tag of your choice (for example the name of the species the sequences are generated from). It assumes that the fastq file has 6 lines characterizing each sequence (header, 2 sequence, id, 2 quality).
Usage: ./Fix_MultiLine_Fastq_header.sh

-MultiLineFastq2Fasta.pl

With this script you are able to convert a multi-line fastq file into a fasta files. It does NOTs assume that there are 4 lines for each sequence. It assumes you have previously used the script Fix_MultiLine_Fastq_header.sh to modify the header of each sequence.
Usage: ./MultiLineFastq2Fasta.pl input.fastq output.fasta

-Sort_Reads_Fasta.pl
With this script you will be able to sort paired-end reads included in two fasta files.
Usage: Sort_Reads_Fasta.pl   input_1.fasta  input_2.fasta    output_SORTED_1.fasta output_SORTED_2.fasta

