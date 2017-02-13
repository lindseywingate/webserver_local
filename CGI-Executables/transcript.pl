#!/usr/bin/perl
use DBI;
use CGI qw(:standard);
use DBD::mysql;

print header(), start_html(-title=>"Sample login page", -BGCOLOR=>'ffffff' );

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI::errstr");

my $sth = $dbh->prepare (q { SELECT * FROM tblclasses} ) or die ("Cannot prepare statement: ", $dbh->errstr(), "\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

my @array;
my $count=0;
print "<h1>Transcript</h1>";
print "
<table>
	<tr><td><b>Name</td> <td><b>Department</td> <td><b>Class Code</td><td><b>Grade</td> <td><b>Credits</td> <td><b>ID</td></tr>";
my $credits=0;
my $totalcredits = 0;
my $totalclasses = 0;
my $tempGPA = 0;
my $attempted = 0;
my $totalpassed = 0;
while (@array = $sth->fetchrow_array() ) 
{
	my $temp=0;
	print "
	<tr><td>@array[0]</td>";
	print "<td>@array[1]</td>";
	print "<td>@array[2]</td>";
	print "<td>@array[3]</td>";
	if(@array[3] eq "A") {
		$credits = @array[4];
		$temp = $credits * 4;	
		$totalcredits = $totalcredits + $credits;
		$attempted = $attempted + @array[4];	
		$totalpassed = $totalpassed + @array[4];
	}
	if(@array[3] eq "B") {
		$credits = @array[4];
		$temp = $credits * 3;
		$totalcredits = $totalcredits + $credits;
		$attempted = $attempted + @array[4];
		$totalpassed = $totalpassed + @array[4];
	}
	if( @array[3] eq "C") {
		$credits = @array[4];
		$temp = $credits * 2;
		$totalcredits = $totalcredits + $credits;
		$attempted = $attempted + @array[4];
		$totalpassed = $totalpassed + @array[4];
	}
	if(@array[3] eq "D") {
		$credits = @array[4];
		$temp = $credits;
		$totalcredits = $totalcredits + $credits;
		$attempted = $attempted + @array[4];
		$totalpassed = $totalpassed + @array[4];
	}
	if(@array[3] eq "F") {
		$credits = 0;
		$temp = 0;
		$totalcredits = $totalcredits + @array[4];
		$attempted = $attempted + @array[4];
	}
	if(@array[3] eq "S") {
		$attempted = $attempted + @array[4];
		$totalpassed = $totalpassed + @array[4]; 
	}
	if(@array[3] eq "U") {
		$attempted = $attempted + @array[4];
	}	
	print "<td>@array[4]</td>";
	print "<td>@array[5]</td>";
	print "</tr>
	";
	$tempGPA = $tempGPA + $temp;	
	$totalclasses = $totalclasses + 1;
}
print "</table>";
print "<h4>Total Attempted Credits: $totalcredits </h4>";
print "<h4>Total Passed Credits: $totalpassed </h4>";
my $GPA = $tempGPA/$totalcredits;
printf "<h4>GPA: %.3f</h4>", $GPA;
print "<link rel='stylesheet' type='text/css' href='css/transcript.css'>";

$dbh->disconnect();
$sth->finish();
