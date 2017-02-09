#!/usr/bin/perl -wT

use CGI qw(:standard);
use DBI;

print header(), start_html();

my $username = param ('txtUsername');
my $password = param ('txtPassword');

#here is where you would verify the username and password against a table in the database

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI:errstr");

my $sth = $dbh->prepare ("SELECT * from tblusers where login = '$username' and password = '$password'") or die ("Cannot prepare statement.\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;
@array = $sth->fetchrow_array();
my $count = 0;

#get amount of results from array
foreach (@array) {
	$count++;
}

#if no results, user/password combo not found
if($count < 1) {
	print "not found"
}
else {
	print "found"
}

print @array;

$dbh->disconnect();
$sth->finish();

print end_form(), end_html();
