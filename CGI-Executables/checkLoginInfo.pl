#!/usr/bin/perl

use CGI qw(:standard);
use DBI;
use strict;
use warnings;

$query= new CGI;

my $username = param ('txtUsername');
my $password = param ('txtPassword');

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password");
my $sth = $dbh->prepare ("SELECT count(*) from tblusers where login = '$username' and password = '$password'") or die ("Cannot prepare statement.\n");

$sth->execute();

my @array;
my $count = 0;
my $cookie;
@array = $sth->fetchrow_array();

$sth->finish();

#get amount of results from array
foreach (@array) {
	$count++;
}

#if no results, user/password combo not found
if($count < 1) {
    my $cookie = $query->cookie(-name=>"mycookie",
        -value=>'bestcookie=whitechocochip',
        -expires=>'+1m',
        -path=>'/');

	print $query->header(-cookie=>$cookie);
    print $query->start_html('My cookie program');
    print $query->h3('The cookie has been SET!');

}

