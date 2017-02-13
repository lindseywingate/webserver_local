#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Session;
use File::Spec;

my $sessionID = cookie('perl260');
my $session = new CGI::Session(undef, $sessionID, {Directory=>File::Spec->tmpdir()});
#print $query->h3("The cookie is $query->cookie('mycookie') and it's value is $query->cookie{'value'}->value");

if($session->param('loggedin')) {
	my $cookie = cookie (-name=>'perl260',
                         -value => $session->id,
                         -expires => '+1m' );
    print header(-cookie=>$cookie), start_html ();
    my $username = $session->param('username');

	print " 
	<link rel='stylesheet' type='text/css' href='../css/index.css'>
	<title>Course System</title>
	</head>
	<body>
	<h1><u>Campus Connection</u></h1>
	<form action='search.pl' method='post' name='search'>
		<h4>Search for a Class by Name or Department</h4>
		<input type='text' name='search'>
		<input type='submit' id='general_button' value='Search'>
		<input type='reset' value='Clear'>
	</form>
	<br>
	<hr>

	<form method='post' action='edit.pl'>
		<h4>Edit an Existing Class by Name</h4>
		<tr>
			Current Class Name
			<input type='text' name='classname'>
		</tr>
		<br><br>
		<b>New Class Information</b> <br>
		<tr>
			Class Name
			<input type='text' name='classname'>
			ex: Perl
		</tr>
		<br>
		<tr>
			Department
			<input type='text' name='department'>
			ex: Computer Science
		</tr>
		<br>
		<tr>
			Class Number
			<input type='text' name='classnum'>
			ex: 260 
		</tr>
		<br>
		<tr>
			Grade Received
			<input type='text' name='grade'>
			ex: A
		</tr>
		<br>
		<tr>
			Credits Received
			<input type='text' name='credits'>
			ex: 3
		</tr>
		<br>
		<input type='submit' id='general_button' value='Edit'>
		<input type='submit' id='red_button' value='Clear Entries'>
	</form>
	<br>
	<hr>

	<form method='post' action='addclass.pl'>
		<h4>Add a Class</h4>
		<tr>
			Class Name
			<input type='text' name='classname'>
			ex: Perl
		</tr>
		<br>
		<tr>
			Department
			<input type='text' name='department'>
			ex: Computer Science
		</tr>
		<br>
		<tr>
			Class Number
			<input type='text' name='classnum'>
			ex: 260 
		</tr>
		<br>
		<tr>
			Grade Received
			<input type='text' name='grade'>
			ex: A
		</tr>
		<br>
		<tr>
			Credits Received
			<input type='text' name='credits'>
			ex: 3
		</tr>
		<br>
		<input type='submit' id='general_button' value='Add'>
		<input type='submit' id='red_button' value='Clear Entries'>
	</form>
	<br><br>

	<form method='get' action='transcript.pl'>
		<button type='submit' id='general_button'>View my Transcript</button>
	</form>
	<br>
	</body>
	";
	print end_html();
}
else {
	print header(), start_html("Error");
	print "Your session has ended due to inactivity or never even began due to an incorrect password or username. Login again ", a({-href=>'/cgi-bin/login.pl'}), "here", br;
	print end_html();
}
