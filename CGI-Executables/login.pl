#!/usr/bin/perl

use CGI qw(:standard);

print header(), start_html(-title=>"Login", -BGCOLOR=>'black', -TEXT=>'#ffffff' );

print start_form (-method=>'post', -action=>'/cgi-bin/checklogin.pl');

print "<h2><u><center>Welcome to Campus Connection</u></h2>";

print "<center>Username<br>", textfield (-name=>'txtUsername'), br, br;

print "Password<br>", password_field (-name=>'txtPassword'), br, br;

print submit( -name=>'cmdLogin', value=>'Login');

print end_form(), end_html();

