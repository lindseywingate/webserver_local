#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Session;
use File::Spec;
use DBI;

my $username = param ('txtUsername');
my $password = param ('txtPassword');

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password");
my $sth = $dbh->prepare ("SELECT * from tblusers where login = '$username' and password = '$password'");

$sth->execute();

my @array;
my $count=0;
my $cookie;
@array = $sth->fetchrow_array();

foreach(@array) {
	$count++;
}	

#if more than one result comes back, that means the user/password were found
if ($count > 1)
{
	my $session = new CGI::Session(undef, undef, {Directory=>File::Spec->tmpdir()});
	$session->param('loggedin', 'yes');
	$session->param('username', $username);
	$session->close();
	
	my $cookie = cookie (
		-name => 'perl260',
		-value => $session->id,
		-expires=> '+1m' );
	
	print redirect (-cookie=>$cookie, -location=>'/cgi-bin/index.pl'), start_html(), end_html();

}
else {
	print header(), start_html("Oops");
	print "Your username or password is incorrect.", br;
	print "Try logging in again ", a ( {-href=>'/cgi-bin/login.pl'}, "here"), br;
	print end_html();	
}
