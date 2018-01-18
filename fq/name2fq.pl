#!/usr/bin/perl

#*********************************************************************************
# FileName: name2fq_seq.pl
# Creator: Zhang Shehuan <zhangshehuan@celloud.cn>
# Create Time: 2017-6-9
# Description: This code is to get fq record based on the given name and  the input 
#              parent fq file.
# CopyRight: Copyright (c) CelLoud, All rights reserved.
# Revision: V1.0.0
#*********************************************************************************

use strict;
use warnings;

if (@ARGV!=3) {
	die "Usage: perl $0 <in_fqfile> <in_fqname> <out_fq>\n"
}
my $in=$ARGV[0];
my $name=$ARGV[1];
my $out=$ARGV[2];
$name=~s/^@//;
open (IN, "$in") or die "Can not open $in\n";
open (OUT, ">$out") or die "Can not open $out\n";
my $n=1;
my ($line,$seq,$plus,$qual);
while ($line=<IN>) {
#@M04030:17:000000000-AU86A:1:1101:12696:1847_1
#AACTCCTACGGAAGGCAGCAGTGATAAACCTTTAGCAATAAACCAAAGTTTAACTAAGCCATACTAACCCCAGGGTTGGTCAATTTCGTGCCAGCCACCGCGGTCACACGATTAACCCAAGTCAATAGAAACCGGCATAAAGAGTGTTTTAGATCAATTCCCCTCAATAAAGCTAAAATTCACGTGAGTTGTAAAAAACTCCAGTTGATACAAAATAAACTACGAAAGTGGCTTTAATGCATCT
#+
#AAAFFFFCGC?GE?2AEFGHHFHGHHGHHHHHHHHHHHHHGHHHEHEHHHHFHHHGBFHGHHGHHGHHHHGGGGF2?@EEHHGHHHHHHEGGHEFGHHHEEGGA/EFFH?EGHGGHHHGEHHHHFHFDFHHGA<@CGDFHBFGGFHFGFFGCGGGBGHHHHHHGG.GHHHBDHHHGFHGHHHGFGEEGHGFFF0C:0BGGEFFGGFGBCBFF09.BF0;BF0/9E.AA/9/A.FBB99B//;BF
	chomp $line;
	if ($n%4==1) {
		if ($line!~/^@/) {
			print "line:$n,error!!!\n";
			exit;
		}else{
			my $temp=(split/\s+/,$line)[0];
			$temp=~s/^@//;
			if ($temp=~/$name/) {
				$seq=<IN>;
				chomp $seq;
				$plus=<IN>;
				chomp $plus;
				$qual=<IN>;
				chomp $qual;
				print OUT "$line\n$seq\n$plus\n$qual\n";
				last;
			}
		}
	}
	$n++;
}
close IN;
close OUT;
