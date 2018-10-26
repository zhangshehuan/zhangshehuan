#!/usr/bin/perl
use strict;
use warnings;
if (@ARGV!=2) {
	die "\tUsage: $0 <my_results> <out>\n";
}
my $my_results=shift;
my $out=shift;
my $expected_results=<<ANSWER;
Chr  Start  End  Ref  Alt  Gene  Transcript  HGVS_C  HGVS_P  Type  VAF
chr1  10412785  10412785  A  G  KIF1B  NM_015074  c.3908A>G  p.Asn1303Ser  SNV  0.03
chr1  43812576  43812576  T  C  MPL  NM_005373  c.1279T>C  p.Tyr427His  SNV  0.06
chr1  11190666  11190666  C  T  MTOR  NM_004958  c.5533G>A  p.Glu1845Lys  SNV  0.07
chr1  115256520  115256521  .  AGGCCAGGCCCGGCACTG  NRAS  NM_002524  c.190_191insCAGTGCCGGGCCTGGCCT  p.Glu63_Tyr64insSerValProGlyLeuAla  INS  0.02
chr10  89717613  89717613  C  A  PTEN  NM_000314  c.638C>A  p.Pro213His  SNV  0.03
chr10  63851816  63851816  C  T  ARID5B  NM_032199  c.2594C>T  p.Ser865Leu  SNV  0.04
chr10  43596168  43596168  G  A  RET  NM_020975  c.335G>A  p.Arg112His  SNV  0.05
chr10  89692837  89692842  TCTTGA  .  PTEN  NM_000314  c.321_326del  p.Leu108_Asp109del  DEL  0.02
chr10  123247618  123247620  GAT  .  FGFR2  NM_000141  c.1871_1873del  p.His624del  DEL  0.03
chr11  108170483  108170487  TCTCT  .  ATM NM_000051  c.5048_5052del  p.Phe1683fs  DEL  0.08
chr11  32417910  32417911  .  ACCGT  WT1  NM_024426  c.1137_1141dup  p.Ser381fs  INS  0.05
chr11  108206582  108206582  A  T  ATM  NM_000051  c.8162A>T  p.Asp2721Val  SNV  0.03
chr11  64573740  64573740  A  G  MEN1  NM_000244  c.1028T>C  p.Leu343Pro  SNV  0.06
chr11  108114803  108114803  C  G  ATM  NM_000051  c.620C>G  p.Ser207Cys  SNV  0.06
chr11  32439126  32439126  T  G  WT1  NM_024426  c.947A>C  p.Lys316Thr  SNV  0.07
chr11  64575435  64575436  .  CTGT  MEN1  NM_000244  c.596_597insACAG  p.Glu200fs  INS  0.05
chr12  6704523  6704523  G  A  CHD4  NM_001273  c.2098C>T  p.Pro700Ser  SNV  0.02
chr12  115109752  115109752  T  A  TBX3  NM_016569  c.2126A>T  p.Lys709Ile  SNV  0.12
chr12  25378591  25378591  C  T  KRAS  NM_033360  c.407G>A  p.Ser136Asn  SNV  0.15
chr13  28897045  28897045  C  T  FLT1  NM_002019  c.2835G>A  p.Met945Ile  SNV  0.09
chr13  28895610  28895610  C  T  FLT1  NM_002019  c.3164G>A  p.Arg1055Lys  SNV  0.1
chr13  48934221  48934221  T  C  RB1  NM_000321  c.676T>C  p.Phe226Leu  SNV  0.1
chr13  28599040  28599040  C  T  FLT3  NM_004119  c.2248G>A  p.Asp750Asn  SNV  0.12
chr13  48937055  48937055  G  A  RB1  NM_000321  c.823G>A  p.Glu275Lys  SNV  0.15
chr13  28608104  28608105  .  AAGCACCTGATCCTAGTACCT  FLT3  NM_004119  c.1841_1861dup  p.Ala620_Phe621ins*ValLeuGlySerGlyAla  INS  0.07
chr14  75514890  75514890  G  T  MLH3  NM_001040108  c.1469C>A  p.Ser490Tyr  SNV  0.25
chr15  67358629  67358629  G  A  SMAD3  NM_005902  c.137G>A  p.Gly46Glu  SNV  0.18
chr15  67457295  67457295  G  T  SMAD3  NM_005902  c.269G>T  p.Arg90Leu  SNV  0.19
chr16  3789661  3789661  C  T  CREBBP  NM_004380  c.4198G>A  p.Glu1400Lys  SNV  0.02
chr16  3828110  3828110  C  T  CREBBP  NM_004380  c.2015G>A  p.Arg672His  SNV  0.05
chr16  2126136  2126136  C  T  TSC2  NM_000548  c.2707C>T  p.Pro903Ser  SNV  0.08
chr17  7574002  7574002  C  T  TP53  NM_000546  c.1025G>A  p.Arg342Gln  SNV  0.03
chr17  29576057  29576057  G  A  NF1  NM_000267  c.4030G>A  p.Glu1344Lys  SNV  0.04
chr17  42327860  42327860  C  T  SLC4A1  NM_000342  c.2702G>A  p.Arg901Gln  SNV  0.04
chr17  29562779  29562779  T  C  NF1  NM_000267  c.3859T>C  p.Phe1287Leu  SNV  0.08
chr17  7577105  7577106  .  GA  TP53  NM_000546  c.831_832dup  p.Pro278fs  INS  0.13
chr18  60985849  60985849  C  G  BCL2  NM_000633  c.51G>C  p.Lys17Asn  SNV  0.07
chr18  48581261  48581261  C  T  SMAD4  NM_005359  c.565C>T  p.Arg189Cys  SNV  0.09
chr19  17943616  17943616  T  A  JAK3  NM_000215  c.2473A>T  p.Ile825Phe  SNV  0.08
chr19  17945517  17945517  T  C  JAK3  NM_000215  c.2213A>G  p.Tyr738Cys  SNV  0.09
chr2  209108166  209108166  T  C  IDH1  NM_005896  c.683A>G  p.Gln228Arg  SNV  0.04
chr2  212566837  212566837  C  A  ERBB4  NM_005235  c.1344G>T  p.Gln448His  SNV  0.05
chr2  29541235  29541235  C  T  ALK  NM_004304  c.1582G>A  p.Ala528Thr  SNV  0.06
chr2  29519891  29519891  C  G  ALK  NM_004304  c.1680G>C  p.Leu560Phe  SNV  0.07
chr2  29445271  29445272  .  CGT  ALK  NM_004304  c.3451_3453dup  p.Thr1151_Leu1152insThr  INS  0.15
chr22  30032780  30032801  GGACTCTGGGGCTCCGAGAAAC  .  NF2  NM_000268  c.155_176del  p.Arg52fs  DEL  0.03
chr12  25380259  25380260  .  TGCACTGTACTCCTC  KRAS  NM_033360  c.184_198dup  p.Ala66_Met67insGluGluTyrSerAla  INS  0.03
chr22  41564513  41564513  G  A  EP300  NM_001429  c.3935G>A  p.Arg1312Gln  SNV  0.05
chr22  22142672  22142672  G  T  MAPK1  NM_002745  c.730C>A  p.Leu244Ile  SNV  0.12
chr22  23523944  23523944  G  A  BCR  NM_004327  c.797G>A  p.Gly266Asp  SNV  0.13
chr22  29695598  29695598  G  A  EWSR1  NM_013986  c.1703G>A  p.Arg568His  SNV  0.04
chr3  37089070  37089072  ACA  .  MLH1  NM_000249  c.1792_1794del  p.Thr598del  DEL  0.05
chr3  178916946  178916948  GAT  .  PIK3CA  NM_006218  c.333_335del  p.Lys111_Ile112delinsAsn  DEL  0.07
chr3  41266107  41266108  TC  AA  CTNNB1  NM_001904  c.104_105delinsAA  p.Ile35Lys  Complex  0.02
chr3  142232476  142232476  C  T  ATR  NM_001184  c.4508G>A  p.Arg1503Gln  SNV  0.04
chr3  47164279  47164279  G  A  SETD2  NM_014159  c.1847C>T  p.Ala616Val  SNV  0.1
chr3  142224006  142224006  C  A  ATR  NM_001184  c.5171G>T  p.Arg1724Met  SNV  0.1
chr12  58144505  58144505  G  A  CDK4  NM_000075  c.566C>T  p.Ser189Phe  SNV  0.13
chr3  187447268  187447268  C  T  BCL6  NM_001130845  c.925G>A  p.Glu309Lys  SNV  0.18
chr4  55589772  55589773  .  N  KIT�����Ʒ֣�  NM_000222  c.1254_1255insN  p.Asp419fs  INS  0.03
chr4  1808930  1808930  G  A  FGFR3  NM_000142  c.2362G>A  p.Val788Met  SNV  0.04
chr4  1805529  1805529  T  G  FGFR3  NM_000142  c.1041T>G  p.Phe347Leu  SNV  0.05
chr4  55152092  55152100  GACATCATG .  PDGFRA  NM_006206  c.2524_2532del  p.Asp842_Met844del DEL  0.06
chr4  106190824  106190824  T  C  TET2  NM_001127208  c.4102T>C  p.Phe1368Leu  SNV  0.11
chr4  106197176  106197176  G  A  TET2  NM_001127208  c.5509G>A  p.Ala1837Thr  SNV  0.14
chr4  68610386  68610386  G  T  GNRHR  NM_000406  c.642C>A  p.Phe214Leu  SNV  0.17
chr4  55131213  55131213  A  T  PDGFRA  NM_006206  c.756A>T  p.Glu252Asp  SNV  0.22
chr4  106180857  106180857  C  .  TET2  NM_001127208  c.3885del  p.Tyr1295fs  DEL  0.1
chr5  112175210  112175211  .  A  APC  NM_000038  c.3919_3920insA  p.Ile1307fs*8  INS  0.06
chr5  149501449  149501449  G  A  PDGFRB  NM_002609  c.2338C>T  p.Pro780Ser  SNV  0.06
chr5  112176362  112176362  C  T  APC  NM_000038  c.5071C>T  p.Pro1691Ser  SNV  0.07
chr5  176517793  176517793  G  A  FGFR4  NM_002011  c.403G>A  p.Asp135Asn  SNV  0.08
chr5  180057075  180057075  C  T  FLT4  NM_182925  c.544G>A  p.Glu182Lys  SNV  0.16
chr6  30862398  30862398  G  A  DDR1  NM_013994  c.1463G>A  p.Arg488Gln  SNV  0.02
chr6  117700258  117700258  C  T  ROS1  NM_002944  c.2561G>A  p.Cys854Tyr  SNV  0.08
chr6  117714445  117714445  C  T  ROS1  NM_002944  c.1204G>A  p.Glu402Lys  SNV  0.15
chr7  140494238  140494238  G  A  BRAF  NM_004333  c.1010C>T  p.Ser337Leu  SNV  0.02
chr7  140453132  140453136  TTTCA  AT  BRAF  NM_004333  c.1799_1803delinsAT  p.Val600_Lys601delinsAsp  Complex  0.05
chr7  55249038  55249038  G  A  EGFR  NM_005228  c.2336G>A  p.Gly779Asp  SNV  0.03
chr7  55259515  55259515  T  G  EGFR  NM_005228  c.2573T>G  p.Leu858Arg  SNV  0.03
chr7  55249092  55249092  G  C  EGFR  NM_005228  c.2390G>C  p.Cys797Ser  SNV  0.05
chr7  55242467  55242481  AATTAAGAGAAGCAA  TTC  EGFR  NM_005228  c.2237_2251delinsTTC  p.Glu746_Thr751delinsValPro  Complex  0.03
chr7  116414980  116414980  A  T  MET  NM_000245  c.3074A>T  p.Gln1025Leu  SNV  0.09
chr8  128753094  128753094  C  A  MYC  NM_002467  c.1255C>A  p.Leu419Met  SNV  0.05
chr8  92982977  92982977  C  T  RUNX1T1  NM_001198679  c.1625G>A  p.Arg542Lys  SNV  0.23
chr9  5070022  5070027  TCACAA  .  JAK2  NM_004972  c.1611_1616del  p.Phe537_Lys539delinsLeu  DEL  0.04
chr9  133760952  133760952  A  G  ABL1  NM_005157  c.3275A>G  p.Asn1092Ser  SNV  0.02
chr9  133760367  133760367  C  A  ABL1  NM_005157  c.2690C>A  p.Pro897His  SNV  0.03
chr9  139391526  139391526  G  A  NOTCH1  NM_017617  c.6665C>T  p.Pro2222Leu  SNV  0.06
chr9  8500790  8500790  C  T  PTPRD  NM_002839  c.2092G>A  p.Glu698Lys  SNV  0.06
chr9  21970966  21970966  C  A  CDKN2A  NM_000077  c.392G>T  p.Arg131Leu  SNV  0.1
chr9  139409811  139409811  G  T  NOTCH1  NM_017617  c.1945C>A  p.Pro649Thr  SNV  0.1
chr9  139396742  139396742  T  C  NOTCH1  NM_017617  c.5366A>G  p.Glu1789Gly  SNV  0.13
chrX  53440075  53440075  T  G  SMC1A  NM_001281463  c.563A>C  p.Gln188Pro  SNV  0.18
chr14  105246490  105246490  C  T  AKT1  NM_001014432  c.110G>A  p.Gly37Asp  SNV  0.03
ANSWER

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