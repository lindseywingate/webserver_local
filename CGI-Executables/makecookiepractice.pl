#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Session;
use File::Spec;

print header();

my $username = param ('txtUsername');
my $password = param ('txtPassword');

#here is where you would verify the username and password against a table in the database
if ($username eq "admin" && $password eq "password")
{
	#create cooke on the server with the user information
	#1st argument - dsn info - leave blank (undef)
	#2nd argument - session id, set to undef to create a new session 
	#3rd argument - where should the cookie be store on the server
	my $session = CGI::Session(undef, undef, {Directory=> '/tmp' });
	$session->param('loggedin', 'yes');
	$session->param('username', $username);
	$session->close();
	
	my $cookie = cookie (-name=>'perl260',
						-value => $session->id,
						-expires => '+1m' );
	print redirect (-cookie=>$cookie, -location=>'/cgi-bin/verifyLogin.pl'), start_html(), end_html();
	
}
