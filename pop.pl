#!/usr/bin/perl

use strict;
use warnings;

my $i = 1;

while($i < 20000){
	my $comm1 = sprintf("rm test/img/f0/%03d.tif", $i);
	my $comm2 = sprintf("rm test/mask/f0/%03d.png", $i);

	system($comm1);
	system($comm2);
	$i++;
}
