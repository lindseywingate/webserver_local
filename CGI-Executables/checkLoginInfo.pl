#!/usr/bin/perl -wT

use CGI qw(:standard);

print header(), start_html();

my $username = param ('txtUsername');
my $password = param ('txtPassword');

#here is where you would verify the username and password against a table in the database
if ($username eq "admin" && $password eq "password")
{
	print("HIIIII");
}

print end_form(), end_html();
