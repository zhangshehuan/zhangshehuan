#!/usr/bin/perl
use strict;
use warnings;
if (@ARGV!=2) {
	die "\tUsage: $0 <my_results> <out>\n";
}
my $my_results=shift;
my $out=shift;
my $expected_results=<< "EOF";
Chrom	Start	End	Ref	Alt	Gene	Type	VAF	CHGVS	PHGVS
chr1	10412757	10412757	T	C	KIF1B	SNV	0.02	c.3880T>C	p.S1294P
chr1	65309780	65309780	G	A	JAK1	SNV	0.02	c.2370C>T	p.G790G
chr1	115256529	115256530	TG	AA	NRAS	Sub	0.03	c.181_182CA>TT	p.Q61L
chr1	162731225	162731225	T	G	DDR2	SNV	0.06	c.1080T>G	p.S360R
chr1	179095570	179095570	G	A	ABL2	SNV	0.03	c.521C>T	p.S174L
chr10	89653839	89653839	A	G	PTEN	SNV	0.03	c.137A>G	p.Y46C
chr10	89711968	89711969	.	G	PTEN	INS	0.03	c.586_587insG	p.H196fs*6
chr10	123258034	123258034	A	C	FGFR2	SNV	0.04	c.1647T>G	p.N549K
chr11	533535	533535	C	T	HRAS	SNV	0.07	c.368G>A	p.R123H
chr11	17112940	17112940	T	C	PIK3C2A	SNV	0.09	c.4819A>G	p.T1607A
chr11	32414249	32414250	.	CAGCTCCCCT	WT1	INS	0.08	c.1097_1098ins10	p.S367fs*23
chr11	64572272	64572272	C	T	MEN1	SNV	0.15	c.1367G>A	p.R456H
chr11	92600168	92600168	C	T	FAT3	SNV	0.04	c.1645C>T	p.R549W
chr11	108117798	108117798	C	A	ATM	SNV	0.22	c.1009C>A	p.R337S
chr11	108170483	108170486	TCTC	.	ATM	DEL	0.06	c.5047_5051delTTCTC	p.F1683fs*7
chr11	108214019	108214019	T	A	ATM	SNV	0.05	c.8339T>A	p.L2780H
chr11	125513686	125513686	G	A	CHEK1	SNV	0.02	c.815-1G>A	p.?
chr12	441055	441055	C	T	KDM5A	SNV	0.03	c.1703G>A	p.R568H
chr12	6709009	6709009	T	C	CHD4	SNV	0.02	c.1412A>G	p.Y471C
chr12	25380276	25380276	T	G	KRAS	SNV	0.13	c.182A>C	p.Q61P
chr12	121431498	121431498	G	A	HNF1A	SNV	0.13	c.702G>A	p.E234E
chr13	28964091	28964091	A	G	FLT1	SNV	0.03	c.1811T>C	p.I604T
chr13	102375190	102375190	C	A	FGF14	SNV	0.03	c.750G>T	p.K250N
chr14	75514890	75514890	G	T	MLH3	SNV	0.19	c.1469C>A	p.S490Y
chr14	105246455	105246455	C	T	AKT1	SNV	0.15	c.145G>A	p.E49K
chr15	89811723	89811723	T	C	FANCI	SNV	0.08	c.849T>C	p.Y283Y
chr15	90631838	90631838	C	G	IDH2	SNV	0.07	c.515G>C	p.R172T
chr15	93510648	93510648	C	.	CHD2	DEL	0.05	c.2094delC	p.R699fs*35
chr16	11348964	11348964	C	T	SOCS1	SNV	0.03	c.372G>A	p.T124T
chr16	67645347	67645348	AA	.	CTCF	DEL	0.03	c.612_613delAA	p.K205fs*24
chr16	89805927	89805927	G	A	FANCA	SNV	0.12	c.3969C>T	p.A1323A
chr17	7577022	7577022	G	A	TP53	SNV	0.06	c.916C>T	p.R306*
chr17	7578423	7578423	C	A	TP53	SNV	0.07	c.507G>T	p.M169I
chr17	11984671	11984671	A	G	MAP2K4	SNV	0.06	c.219-2A>G	p.?
chr17	37880997	37880997	G	TTAT	ERBB2	Sub\\Complex\\delins	0.12	c.2236delGinsTTAT	c.2326G>TTAT
chr17	37881440	37881440	C	T	ERBB2	SNV	0.25	c.2632C>T	p.H878Y
chr18	42530439	42530439	A	C	SETBP1	SNV	0.05	c.1134A>C	p.Q378H
chr18	45396908	45396908	A	C	SMAD2	SNV	0.02	c.264T>G	p.S88R
chr18	48603093	48603094	.	T	SMAD4	INS	0.18	c.1394_1395insT	p.A466fs*28
chr18	48603092	48603093	.	T	SMAD4	INS	0.18	c.1394_1395insT	p.A466fs*28
chr19	36223270	36223270	G	A	MLL4	SNV	0.08	c.5826G>A	p.R1942R
chr2	25457251	25457251	T	C	DNMT3A	SNV	0.04	c.2636A>G	p.N879S
chr2	25468160	25468160	G	.	DNMT3A	DEL	0.05	c.1516_1516delC	p.H506fs*145
chr2	29416770	29416770	T	A	ALK	SNV	0.03	c.4183A>T	p.T1395S
chr2	29420411	29420411	G	T	ALK	SNV	0.16	c.4070C>A	p.P1357H
chr2	29432664	29432664	C	T	ALK	SNV	0.2	c.3824G>A	p.R1275Q
chr2	29443697	29443697	A	G	ALK	SNV	0.07	c.3520T>C	p.F1174L
chr2	209113112	209113112	C	A	IDH1	SNV	0.15	c.395G>T	p.R132H
chr2	212251742	212251742	C	A	ERBB4	SNV	0.05	c.3317G>T	p.C1106F
chr22	30032779	30032800	CGGACTCTGGGGCTCCGAGAAA	.	NF2	DEL	0.08	c.154_175del22	p.R52fs*64
chr22	30050666	30050666	T	A	NF2	SNV	0.12	c.468T>A	p.S156R
chr3	10183532	10183548	ATGCCCCGGAGGGCGGA	.	VHL	DEL	0.12	c.1_17del17	p.M1fs*20
chr3	10183529	10183545	GGAATGCCCCGGAGGGC	.	VHL	DEL	0.12	c.1_17del17	p.M1fs*20
chr3	10183659	10183659	C	T	VHL	SNV	0.05	c.128C>T	p.S43F
chr3	10188269	10188282	CCATCTCTCAATGT	.	VHL	DEL	0.03	c.412_425del14	p.P138fs*1
chr3	10191626	10191630	GCACA	.	VHL	DEL	0.15	c.619_623delGCACA	p.A207fs*>6
chr3	25542806	25542806	C	T	RARB	SNV	0.03	c.440C>T	p.S147F
chr3	41266107	41266107	T	C	CTNNB1	SNV	0.08	c.104T>C	p.I35T
chr3	47163586	47163587	.	G	SETD2	INS	0.02	c.1030_1031insC	p.F344fs*4
chr3	52443861	52443861	G	T	BAP1	SNV	0.25	c.34C>A	p.P12T
chr3	142168302	142168302	T	G	ATR	SNV	0.07	c.7904A>C	p.Q2635P
chr3	185161374	185161374	G	A	MAP3K13	SNV	0.04	c.801G>A	p.M267I
chr3	187447543	187447543	C	T	BCL6	SNV	0.02	c.650G>A	p.R217Q
chr3	192125845	192125845	G	A	FGF12	SNV	0.03	c.168C>T	p.S56S
chr4	55133541	55133541	T	A	PDGFRA	SNV	0.17	c.845T>A	p.V282E
chr4	55155218	55155218	G	T	PDGFRA	SNV	0.12	c.2817G>T	p.K939N
chr4	66356211	66356211	A	G	EPHA5	SNV	0.16	c.1286T>C	p.V429A
chr4	106157446	106157446	G	T	TET2	SNV	0.02	c.2347G>T	p.E783*
chr4	153245453	153245453	G	C	FBXW7	SNV	0.09	c.1738C>G	p.H580D
chr4	153249518	153249519	.	TGTCCCAC	FBXW7	INS	0.04	c.1259_1260insGTGGGACA	p.H420fs*13
chr5	56177964	56177964	G	A	MAP3K1	SNV	0.02	c.2448G>A	p.M816I
chr5	67589147	67589147	A	G	PIK3R1	SNV	0.22	c.1135A>G	p.K379E
chr5	112173983	112173984	CA	.	APC	DEL	0.18	c.2692_2693delCA	p.H898fs*13
chr5	112174579	112174579	G	A	APC	SNV	0.17	c.3288G>A	p.Q1096Q
chr5	112176028	112176029	.	A	APC	INS	0.05	c.4737_4738insA	p.I1580fs*11
chr5	149495442	149495442	C	T	PDGFRB	SNV	0.12	c.3205G>A	p.E1069K
chr5	180045774	180045774	T	C	FLT4	SNV	0.07	c.2997A>G	p.Q999Q
chr6	106552922	106552922	G	T	PRDM1	SNV	0.02	c.779G>T	p.R260L
chr6	117679018	117679018	A	G	ROS1	SNV	0.18	c.3803T>C	p.I1268T
chr6	157522541	157522541	G	A	ARID1B	SNV	0.04	c.4759G>A	p.E1587K
chr6	170844466	170844466	C	G	PSMB1	SNV	0.08	c.568G>C	p.E190Q
chr7	2954933	2954933	G	A	CARD11	SNV	0.08	c.2777C>T	p.P926L
chr7	26224981	26224981	G	A	NFE2L3	SNV	0.05	c.1663G>A	p.V555I
chr7	55219011	55219011	C	T	EGFR	SNV	0.13	c.584C>T	p.P195L
chr7	55241708	55241708	G	C	EGFR	SNV	0.08	c.2156G>C;	p.G719A
chr7	55242427	55242427	C	T	EGFR	SNV	0.18	c.2197C>T	p.P733S
chr7	55249012	55249013	.	GGT	EGFR	INS	0.15	c.2310_2311insGGT	p.D770_N771insG
chr7	55249071	55249071	C	T	EGFR	SNV	0.04	c.2369C>T	p.T790M
chr7	55259514	55259515	TG	GA	EGFR	Sub	0.02	c.2573_2574TG>GA	p.L858R
chr7	55259527	55259527	T	A	EGFR	SNV	0.07	c.2585T>A	p.L862Q
chr7	140453136	140453136	A	T	BRAF	SNV	0.08	c.1799T>A	p.V600E
chr9	5065019	5065019	G	C	JAK2	SNV	0.11	c.1193G>C	p.S398T
chr9	21970934	21970934	G	A	CDKN2A	SNV	0.04	c.424C>T	p.H142Y
chr9	21974728	21974728	C	A	CDKN2A	SNV	0.1	c.99G>T	p.E33D
chr9	36882061	36882061	G	T	PAX5	SNV	0.03	c.952C>A	p.H318N
chr9	133748371	133748371	C	T	ABL1	SNV	0.06	c.1032C>T	p.A344A
chr9	133760367	133760367	C	A	ABL1	SNV	0.11	c.2690C>A	p.P897H
chr9	135777018	135777019	.	T	TSC1	INS	0.04	c.2459_2460insA	p.V821fs*5
chr9	139390791	139390792	.	CC	NOTCH1	INS	0.06	c.7399_7400insGG	p.S2467fs*11
EOF

my (%expected_hash,%my_hash);
my @arr=split/\n/,$expected_results;
foreach my $i (@arr) {
	chomp $i;
	my ($chr,$start,$end,$ref,$alt)=(split /\s+/,$i)[0,1,2,3,4];
	my $pos_info="$chr\t$start\t$end";
	my $base_info="$ref\t$alt";
	$expected_hash{$pos_info}=$base_info;
}
open IN, "$my_results" or die "Can't open '$my_results': $!\n";
open OUT,">","$out" or die "Can't open '$out': $!\n";
while (my $line=<IN>) {
	chomp $line;
	my ($chr,$start,$end,$ref,$alt)=(split /\t/,$line)[0,1,2,3,4];
	if ($ref eq "-") {
		$ref=".";
	}
	if ($alt eq "-") {
		$alt=".";
	}
	my $pos_info="$chr\t$start\t$end";
	my $base_info="$ref\t$alt";
	if (exists $expected_hash{$pos_info}) {
		if ($expected_hash{$pos_info} eq $base_info) {
			delete $expected_hash{$pos_info};
			next;
		}else {
			print OUT "pos eq base ne: $line\n";
		}
	}else {
		print OUT "false positive: $line\n";
	}
}
print OUT "\n";
while (my($key,$value)=each %expected_hash) {
	print OUT "false negative: $key\t$value\n";
}
close OUT;
close IN;
