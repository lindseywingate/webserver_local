#!/usr/bin/perl -wT
use DBI;
use CGI qw(:standard);
use DBD::mysql;

print header(), start_html(-title=>"Sample login page", -BGCOLOR=>'ffffff' );

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI::errstr");

my $sth = $dbh->prepare (q { SELECT * FROM tblclasses} ) or die ("Cannot prepare statement: ", $dbh->errstr(), "\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;

print "ID Name Department Grade Credits\n\n";
print br();
while (@array = $sth->fetchrow_array() ) 
{
   printf "%2d %-10s %2s %2s %2d\n", @array;
   print br();
}

$dbh->disconnect();
$sth->finish();
