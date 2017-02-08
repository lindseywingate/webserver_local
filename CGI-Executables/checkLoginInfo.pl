#!/usr/bin/perl -wT

use CGI qw(:standard);
use DBI;

print header(), start_html();

my $username = param ('txtUsername');
my $password = param ('txtPassword');

#here is where you would verify the username and password against a table in the database

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI:errstr");

my $sth = $dbh->prepare ("SELECT login, password from tblusers where login = '$username' and password = '$password'") or die ("Cannot prepare statement.\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;

while (@array = $sth->fetchrow_array() ) {
	printf "%10s %10s %10s %10s", @array;
	print br();
}

$dbh->disconnect();
$sth->finish();

print end_form(), end_html();
