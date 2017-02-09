#!/usr/bin/perl

use CGI qw(:standard);
$query = new CGI;

my $username = param ('txtUsername');
my $password = param ('txtPassword');

#here is where you would verify the username and password against a table in the database
if ($username eq "admin" && $password eq "password")
{
	my $cookie = $query->cookie(-name=>"mycookie",
		-value=>'bestcookie=whitechocochip',
		-expires=>'+1m',
		-path=>'/');

	print $query->header(-cookie=>$cookie);
	print $query->start_html('My cookie program');
	print $query->h3('The cookie has been SET!');
}
else {
	print $query->header();
}
	print $query->end_html;	
