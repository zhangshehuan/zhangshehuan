#!/usr/bin/perl

#*********************************************************************************
# FileName: namelis2fq.pl
# Creator: Zhang Shehuan <zhangshehuan@celloud.cn>
# Create Time: 2017-6-6
# Description: This code is to get fq records based on thn input read name list
#              and the input parent fq files.
# CopyRight: Copyright (c) CelLoud, All rights reserved.
# Revision: V1.0.0
#*********************************************************************************

use strict;
use warnings;

my $usage=<<USAGE;
	Usage: perl $0 <input_name> <input_fq1> <input_fq2> <output>
USAGE

if (@ARGV!=4) {
	die $usage;
}
my $namefile=$ARGV[0];
my $fq1=$ARGV[1];
my $fq2=$ARGV[2];
my $out=$ARGV[3];

my (%hash,$name,$mark,$line,$seq,$plus,$qual);
open IN, $namefile || die "Can't open $namefile: $!\n";
while ($line=<IN>) {
	#E00509:81:HF7YCALXX:8:1221:24677:10662  1
	#E00509:81:HF7YCALXX:8:1110:3813:42376   0
	chomp $line;
	($name,$mark)=(split/\s+/,$line)[0,1];
	if ($mark==0) {
		$hash{$name}=1;
	}
}
close IN;

open OUT,">$out.R1.fq" || die "Can't write $out.R1.fq: $!\n";
open IN, $fq1 || die "Can't open $fq1: $!\n";
while ($line=<IN>) {
	#@E00509:81:HF7YCALXX:7:1101:20659:1836 1:N:0:CACCTG
	#TNGTTTAAGATGAGTCATCTTTGTGGGTTTTCATTTTAAATTTTCTTTCTCTAGGTGAAGCTGTACTTCACAAAAACAGTAGAGGAGCCGTCAAATCCAGAGGCTAGCAGTTCAACTTCTGTAACACCAGATGTTAGTGACAATGAACCT
	#+
	#A#AAAFAJJ<FJFA-FFFJJFJJJJJJ<FJJ<JFJJJ<F-<FJJAJJJJ-7F-FFJJFFJJJJJJJJJJJJJJJJF-J<FJJJJF-AFJJFJJJFJJJJJFJFFJJJ7JJJJAJAJJJJJJJJAAJFFFJAFFJJJJFFAJ7A<FJJ---
	if ($line=~/^@/) {
		chomp $line;
		$name=(split/\s+/,$line)[0];
		$name=~s/^@//;
		if (exists $hash{$name}) {
			$seq=<IN>;
			chomp $seq;
			$plus=<IN>;
			chomp $plus;
			$qual=<IN>;
			chomp $qual;
			print OUT "$line\n$seq\n$plus\n$qual\n";
		}
	}
}
close IN;
close OUT;

open OUT,">$out.R2.fq" || die "Can't write $out.R2.fq: $!\n";
open IN, $fq2 || die "Can't open $fq2: $!\n";
while ($line=<IN>) {
	#@E00509:81:HF7YCALXX:7:1101:20659:1836 2:N:0:CACCTG
	#TGGTGTCAGAATATCTATAATGATCAGGTTCATTGTCACTAATATCTGGTGTTACAGAAGTTGAGCTGCTAGCCTCTGGATTTGACGGCTCCTCTACTGTTTTTGTGAAGTACAGCTTCACCTAGAGAAAGAAAATTTAAAATGAAAACC
	#+
	#AAFFFJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJAJJJJ7-<FJJJJJJFJJJFJJ7FJJJ--<FJAAJJJJJJFJJJFJJJFJJJJFJJJJJFJJJJJJJJJJJJAJ-77<A<FJFFFJJAFFJFJJJ<F<FJF<<AF-<A-AAFF7
	if ($line=~/^@/) {
		chomp $line;
		$name=(split/\s+/,$line)[0];
		$name=~s/^@//;
		if (exists $hash{$name}) {
			$seq=<IN>;
			chomp $seq;
			$plus=<IN>;
			chomp $plus;
			$qual=<IN>;
			chomp $qual;
			print OUT "$line\n$seq\n$plus\n$qual\n";
		}
	}
}
close IN;
close OUT;
