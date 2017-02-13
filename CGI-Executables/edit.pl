#!/usr/bin/perl

use DBI;
use CGI qw(:standard);
use DBD::mysql;

print header(), start_html(-title=>"Sample login page", -BGCOLOR=>'ffffff' );

my @param = param();
my $oldclassname = param('oldclassname');
my $classname = param('classname');
my $department = param('department');
my $classnum = param('classnum');
my $grade = param('grade');
my $credits = param('credits');

my $error = "";

$error .= "Please enter the class name.<br/>" if (!$classname);
$error .= "Please enter the department.<br/>" if (!$department);
$error .= "Please enter the class number.<br/>" if (!$classnum);
$error .= "Please enter the grade received.<br />" if (!$grade);
$error .= "Please enter the amount of credits.<br />" if (!$credits);

if ($error) {
	print "$error", a ({-href=>'/cgi-bin/index.pl'}, "back");
}

my $dbh = DBI->connect ("DBI:mysql:database=school;host=localhost", "root", "password") or die ("Couldn't make connection to database: $DBI::errstr");

my $sth = $dbh->prepare ("UPDATE tblclasses SET classname='$classname', department='$department', classnum='$classnum', grade='$grade', credits='$credits' WHERE classname = '$oldclassname';") or die ("Cannot prepare statement: ", $dbh->errstr(), "\n");

$sth->execute() or die ("Cannot execute statement: ", $sth->errstr(), "\n");

print "You were successful in editing your class.";
print end_html();
$dbh->disconnect();
$sth->finish();
