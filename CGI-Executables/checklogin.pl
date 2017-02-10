#!/usr/bin/perl

use CGI qw(:standard);
$query = new CGI;
use DBI;

my $username = param ('txtUsername');
my $password = param ('txtPassword');

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password");
my $sth = $dbh->prepare ("SELECT count(*) from tblusers where login = '$username' and password = '$password'");

$sth->execute();

my @array;
my $count=0;
my $cookie;
@array = $sth->fetchrow_array();

foreach(@array) {
	$count++;
}	

#here is where you would verify the username and password against a table in the database
if ($count > 0)
{
	my $cookie = $query->cookie(-name=>"mycookie",
		-value=>'bestcookie=whitechocochip',
		-expires=>'+1m',
		-path=>'/');

	print redirect (-cookie=>$cookie, -location=>'/index.html.en'), start_html(), end_html();

#	print $query->header(-cookie=>$cookie);
#	print $query->start_html('My cookie program');
#	print $query->h3('The cookie has been SET!');
}
else {
	print $query->header();
}
	print $query->end_html;	

