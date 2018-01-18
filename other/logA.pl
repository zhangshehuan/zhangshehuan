#!/usr/bin/perl
#56.45246667 49.19133333 36.612      72.57873333 156.1782    30.19426667 76.96846667 60.95306667 189.4374    2.625266667 98.36006667 0.699266667 5.6654

#63.76173333 51.84793333 39.22266667 73.70113333 158.3126667 32.11413333 84.87066667 62.49906667 187.8745333 2.734133333 98.0956     0.758       5.985266667

use strict;
use warnings;
foreach my $A (@ARGV) {
	my $logA=log($A);
	$logA=sprintf ("%0.3f",$logA);
	print "\t$logA";
}
print "\n";