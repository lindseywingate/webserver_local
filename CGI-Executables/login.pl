#!/usr/bin/perl -wT

use CGI qw(:standard);

print header(), start_html(-title=>"Sample login page", -BGCOLOR=>'ffffff' );

print start_form (-method=>'post', -action=>'/cgi-bin/checkLoginInfo.pl');

print "Welcome to Campus Connection - the simple way", br, br;

print "Username", textfield (-name=>'txtUsername'), br, br;

print "Password", password_field (-name=>'txtPassword'), br, br;

print submit( -name=>'cmdLogin', value=>'Login');

print end_form(), end_html();

