#!/usr/bin/perl

use DBI;
use CGI qw(:standard);
use DBD::mysql;

print header(), start_html(-title=>"Sample login page", -BGCOLOR=>'ffffff');

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI::errstr");

my $sth = $dbh->prepare (q { SELECT * FROM tblclasses} ) or die ("Cannot prepare statement: ", $dbh->errstr(), "\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;
my $count=0;
print br();
print "
<h3>You were successful in editing your class.</h3>
";
$dbh->disconnect();
$sth->finish();
