#!/usr/bin/perl
use strict;

open(STDERR, ">&STDOUT");

######### VIC ADDED #####################
use Cwd qw(abs_path);
use lib abs_path("../share/perl_lib/EucaTest_staging/lib");
use EucaTest;


my $local = EucaTest->new({ host=> "local" });
my @machines = $local->get_machines("clc");
my $CLC = $machines[0];
my $headnode = $CLC->{'ip'};
my $remote = EucaTest->new();
#### Constants
my $LDAP_TEST_TAR = "ldaptest.tar.gz";

### COPY OVER LDAP RELATED 
$local->sys("scp -o StrictHostKeyChecking=no $LDAP_TEST_TAR root\@$headnode:");
### UNTAR BUNDLE ON REMOTE HOST
$remote->sys("tar zxvf $LDAP_TEST_TAR");

## INSTALL LDAP UTILS 
if( $CLC->{'distro'} =~ /centos/i || $CLC->{'distro'} =~ /rhel/i ){
	$remote->sys("yum install -y openldap-clients");
}else{
	$remote->sys("apt-get install -y ldap-utils");
}

### CHECK THAT I CAN RUN A LDAP COMMAND
