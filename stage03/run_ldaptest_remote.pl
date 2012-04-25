#!/usr/bin/perl
use strict;

open(STDERR, ">&STDOUT");

######### VIC ADDED #####################
use Cwd qw(abs_path);
use lib abs_path("../share/perl_lib/EucaTest_staging/lib");
use EucaTest;

my $clc_session = EucaTest->new({ timeout => 999 });
my @machines = $clc_session->get_machines("clc");
my $CLC = $machines[0];
my $heaadnode = $CLC->{'ip'};

#### Constants
my $LDAP_TEST = "ldaptest";
my $EUARE_TEST_TAR = "euaretest.tar.gz";
my $remote_cmd = "cd /root/$LDAP_TEST;";
$remote_cmd .= "./ldaptest.pl \"" . $clc_session->get_eucadir() . "\"" . " " . $CLC->{'arch'} ;

$clc_session->sys($remote_cmd);
if ($? != 0) {
  $clc_session->fail("ldap test failed remotely");
}
