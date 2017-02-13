#!/usr/bin/perl -wT
use DBI;
use CGI qw(:standard);
use DBD::mysql;

print header(), start_html(-title=>"Sample login page", -BGCOLOR=>'ffffff' );

my @param = param();
my $search = param('search');

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI::errstr");

my $sth = $dbh->prepare ("SELECT * FROM tblclasses where classname like '$search' or department like '$search';") or die ("Cannot prepare statement: ", $dbh->errstr(), "\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;
my $count=0;
print "
<link rel='stylesheet' type='text/css' href='css/transcript.css'>
<h2>Class Search Results</h2>
<table>";
print "<tr><td><b>Name</td> <td><b>Department</td> <td><b>Class Code</td><td><b>Grade</td> <td><b>Credits</td> <td><b>ID</td></tr>";
while (@array = $sth->fetchrow_array() ) 
{
    print "
    <tr><td>@array[0]</td>";
    print "<td>@array[1]</td>";
    print "<td>@array[2]</td>";
    print "<td>@array[3]</td>";
    print "<td>@array[4]</td>";
    print "<td>@array[5]</td>";
    print "</tr>
    ";
}
print "</table>";
$dbh->disconnect();
$sth->finish();

