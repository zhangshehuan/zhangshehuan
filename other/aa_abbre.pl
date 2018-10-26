#!/usr/bin/perl
use strict;
use warnings;

my %aa_abbre = (
	'Gly'=>'G', #�ʰ���
	'Ala'=>'A', #������
	'Val'=>'V', #�Ӱ���
	'Leu'=>'L', #������
	'Ile'=>'I', #��������
	'Phe'=>'F', #��������
	'Trp'=>'W', #ɫ����
	'Tyr'=>'Y', #�Ұ���
	'Asp'=>'D', #�춬����
	'Asn'=>'N', #�춬����
	'Glu'=>'E', #�Ȱ���
	'Lys'=>'K', #������
	'Gln'=>'Q', #�Ȱ�����
	'Met'=>'M', #������
	'Ser'=>'S', #˿����
	'Thr'=>'T', #�հ���
	'Cys'=>'C', #���װ���
	'Pro'=>'P', #������
	'His'=>'H', #�鰱��
	'Arg'=>'R', #������
	'K'=>'Lys',
	'L'=>'Leu',
	'E'=>'Glu',
	'Q'=>'Gln',
	'H'=>'His',
	'N'=>'Asn',
	'S'=>'Ser',
	'R'=>'Arg',
	'A'=>'Ala',
	'W'=>'Trp',
	'C'=>'Cys',
	'G'=>'Gly',
	'D'=>'Asp',
	'F'=>'Phe',
	'Y'=>'Tyr',
	'M'=>'Met',
	'V'=>'Val',
	'T'=>'Thr',
	'P'=>'Pro',
	'I'=>'Ile',
);

