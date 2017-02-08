#!/usr/bin/perl -wT

use CGI qw(:standard);
use CGI::Session;
use File::Spec;

#get the client-side cookie, the link to the server cookie
my $sessionID = cookie ('perl260');

my $session = new CGI::Session (undef, $sessionID,  {Directory=>File::Spec->tmpdir() } );
if ($session->param ('loggedin'))
{
   #and let's get 60 more seconds of "logged in" time
   my $cookie = cookie (-name=>'perl260',
                        -value => $session->id,
                        -expires => '+1m' );
   print header(-cookie=>$cookie), start_html ("Everything looks good so far...");
   my $username = $session->param('username');
   print "Hello $username";
   print end_html();

}
else
{
   print header(), start_html("Oops");
   print "You don't haver permission to run this page", br;
   print "Try logging in ", a ( {-href=>'/cgi-bin/getLoginInfo.pl'}, "here"), br;
   print end_html();
}

