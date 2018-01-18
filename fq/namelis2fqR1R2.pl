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

my (%hash,$name,$mark);
open IN, $namefile || die "Can't open $namefile: $!\n";
while (my $line=<IN>) {
	#MN00129:11:000H23NKW:1:11102:12260:1118
	#MN00129:11:000H23NKW:1:23110:21160:20218
	chomp $line;
	$name=$line;
	$hash{$name}=1;
}
close IN;

open OUT,">$out.R1.fq" || die "Can't write $out.R1.fq: $!\n";
open OUT2,">$out.R2.fq" || die "Can't write $out.R2.fq: $!\n";
open IN, $fq1 || die "Can't open $fq1: $!\n";
open IN2, $fq2 || die "Can't open $fq2: $!\n";
my ($seq,$plus,$qual,$seq2,$plus2,$qual2);
while (my $line=<IN>) {
	#@MN00129:11:000H23NKW:1:11102:16153:1054 1:N:0:8
	#TNGTTTAAGATGAGTCATCTTTGTGGGTTTTCATTTTAAATTTTCTTTCTCTAGGTGAAGCTGTACTTCACAAAAACAGTAGAGGAGCCGTCAAATCCAGAGGCTAGCAGTTCAACTTCTGTAACACCAGATGTTAGTGACAATGAACCT
	#+
	#A#AAAFAJJ<FJFA-FFFJJFJJJJJJ<FJJ<JFJJJ<F-<FJJAJJJJ-7F-FFJJFFJJJJJJJJJJJJJJJJF-J<FJJJJF-AFJJFJJJFJJJJJFJFFJJJ7JJJJAJAJJJJJJJJAAJFFFJAFFJJJJFFAJ7A<FJJ---
	chomp (my $line2=<IN2>);
	if ($line=~/^@(.*) / and $line2=~/^@(.*) /) {
		chomp $line;
		$name=$1;
		if (exists $hash{$name}) {
			chomp ($seq=<IN>);
			chomp ($plus=<IN>);
			chomp ($qual=<IN>);
			print OUT "$line\n$seq\n$plus\n$qual\n";
			chomp ($seq2=<IN2>);
			chomp ($plus2=<IN2>);
			chomp ($qual2=<IN2>);
			print OUT2 "$line2\n$seq2\n$plus2\n$qual2\n";
		}
	}
}
close IN;
close IN2;
close OUT;
close OUT2;

=cut
while ($line=<IN>) {
	#@MN00129:11:000H23NKW:1:11102:16153:1054 2:N:0:8
	#TGGTGTCAGAATATCTATAATGATCAGGTTCATTGTCACTAATATCTGGTGTTACAGAAGTTGAGCTGCTAGCCTCTGGATTTGACGGCTCCTCTACTGTTTTTGTGAAGTACAGCTTCACCTAGAGAAAGAAAATTTAAAATGAAAACC
	#+
	#AAFFFJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJAJJJJ7-<FJJJJJJFJJJFJJ7FJJJ--<FJAAJJJJJJFJJJFJJJFJJJJFJJJJJFJJJJJJJJJJJJAJ-77<A<FJFFFJJAFFJFJJJ<F<FJF<<AF-<A-AAFF7
	if ($hash{$name}==2) {
		chomp $line;
		if (exists $hash{$line}) {
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
