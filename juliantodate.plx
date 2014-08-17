#!/usr/bin/perl
use warnings;
use strict;
#juliantodate.plx

use Tkx;
my $month;
my $day;
my $year;
my $julian;
my $jul;
my $yearjul;
my $date;

Tkx::wm_title(".", "Date to Julian Converter");
Tkx::ttk__frame(".c",  -padding => "3 3 12 12");
Tkx::grid( ".c", -column => 0, -row => 0, -sticky => "nwes");
Tkx::grid_columnconfigure( ".", 0, -weight => 1); 
Tkx::grid_rowconfigure(".", 0, -weight => 1);
Tkx::ttk__separator(".c.sep", -orient => 'vertical');
Tkx::grid(".c.sep", -column => 4, -rowspan => 5, -sticky => "ns");

#Row 2 - Date to Julian
Tkx::ttk__entry(".c.month", -width => 14, -textvariable => \$month);
Tkx::grid(".c.month", -column => 0, -row => 2, -sticky => "we");
Tkx::ttk__entry(".c.day", -width => 7, -textvariable => \$day);
Tkx::grid(".c.day", -column => 1, -row => 2, -sticky => "we");
Tkx::ttk__entry(".c.year", -width => 7, -textvariable => \$year);
Tkx::grid(".c.year", -column => 2, -row => 2, -sticky => "we");

#Row 4
Tkx::ttk__entry(".c.julian", -width => 10, -textvariable => \$julian);
Tkx::grid(".c.julian", -column => 0, -columnspan => 3, -row => 4, -sticky => "we");
Tkx::ttk__entry(".c.date", -width => 30, -textvariable => \$date);
Tkx::grid(".c.date", -column => 5, -columnspan => 2, -row => 4, -sticky => "w");

#Row 5
Tkx::ttk__button(".c.djcalc", -text => "Calculate", -command => sub {dateJulian();});
Tkx::grid(".c.djcalc", -column => 1, -row => 5, -sticky => "w");
Tkx::ttk__button(".c.jdcalc", -text => "Calculate", -command => sub {julianDate();});
Tkx::grid(".c.jdcalc", -column => 5, -row => 5, -sticky => "w");

#Row 2 - Julian to Date
Tkx::ttk__entry(".c.jul", -width => 20, -textvariable => \$jul);
Tkx::grid(".c.jul", -column => 5, -row => 2, -sticky => "w");
Tkx::ttk__entry(".c.yearjul", -width => 7, -textvariable => \$yearjul);
Tkx::grid(".c.yearjul", -column => 6, -row => 2, -sticky => "w");

#Row 0
Tkx::grid( Tkx::ttk__label(".c.dtojbl", -text => "Date to Julian Converter"), -column => 0, -row => 0, -columnspan => 4);
Tkx::grid( Tkx::ttk__label(".c.jtodbl", -text => "Julian to Date Converter"), -column => 4, -row => 0, -columnspan => 4);

#Row 1
Tkx::grid( Tkx::ttk__label(".c.molbl", -text => "Month"), -column => 0, -row => 1, -sticky => "w");
Tkx::grid( Tkx::ttk__label(".c.dalbl", -text => "Day"), -column => 1, -row => 1, -sticky => "w");
Tkx::grid( Tkx::ttk__label(".c.yrlbl", -text => "Year"), -column => 2, -row => 1, -sticky => "w");
Tkx::grid( Tkx::ttk__label(".c.jdlbl", -text => "Julian"), -column => 5, -row => 1, -sticky => "w");
Tkx::grid( Tkx::ttk__label(".c.yrjlbl", -text => "Year"), -column => 6, -row => 1, -sticky => "w");

Tkx::grid( Tkx::ttk__label(".c.djlbl", -text => "Julian"), -column => 0, -columnspan => 2, -row => 3, -sticky => "w");
Tkx::grid( Tkx::ttk__label(".c.datelbl", -text => "Date"), -column => 5, -row => 3, -sticky => "w");

foreach (Tkx::SplitList(Tkx::winfo_children(".c"))) {
    Tkx::grid_configure($_, -padx => 5, -pady => 5);
}
Tkx::focus(".c.month");
#Tkx::bind(".", "<Return>", sub {calculate();});

sub dateJulian {
	my $feb;
	my $d31 = 31;
	my $d30 = 30;
	if ($year % 4 == 0) {
		$feb = 29;
	} else {
		$feb = 28;
	}
	if ($day == 0) {
		Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
	}
	if (ucfirst($month) eq "January") {
		if ($day <= $d31) {
			$julian = abs($day) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "February") {
		if ($day <= $feb) {
			$julian = int(abs($day) + $d31) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "March") {
		if ($day <= $d31) {
			$julian = int(abs($day) + $feb + $d31) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "April") {
		if ($day <= $d30) {
			$julian = int(abs($day) + $feb + (2 * $d31)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "May") {
		if ($day <= $d31) {
			$julian = int(abs($day) + $feb + (2 * $d31) + $d30) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "June") {
		if ($day <= $d30) {
			$julian = int(abs($day) + $feb + (3 * $d31) + $d30) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "July") {
		if ($day <= $d31) {
			$julian = int(abs($day) + $feb + (3 * $d31) + (2 *$d30)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "August") {
		if ($day <= $d31) {
			$julian = int(abs($day) + $feb + (4 * $d31) + (2 *$d30)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "September") {
		if ($day <= $d30) {
			$julian = int(abs($day) + $feb + (5 * $d31) + (2 *$d30)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "October") {
		if ($day <= $d31) {
			$julian = int(abs($day) + $feb + (5 * $d31) + (3 *$d30)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "November") {
		if ($day <= $d30) {
			$julian = int(abs($day) + $feb + (6 * $d31) + (3 *$d30)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} elsif (ucfirst($month)  eq "December") {
		if ($day <= $d31) {
			$julian = int(abs($day) + $feb + (6 * $d31) + (4 *$d30)) || '';
		} else {
			Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
		}
	} else {
			Tkx::tk___messageBox(-message => "Enter a valid month. Please Try Again.", -title => "Error");
	}
}

sub julianDate {
	my $feb;
	my $d31 = 31;
	my $d30 = 30;
	my $newjul;
	if ($yearjul % 4 == 0) {
		$feb = 29;
	} else {
		$feb = 28;
	}
	if ($jul == 0) {
		Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
	}
	if ($jul <= $d31) {
		$date = "January $jul , $yearjul";	
	} elsif ($jul <= ($d31 + $feb)) {
		$newjul = $jul - $d31;
		$date = "February $newjul , $yearjul";
	} elsif ($jul <= ((2 * $d31) + $feb)) {
		$newjul = $jul - $d31 - $feb;
		$date = "March $newjul , $yearjul";
	} elsif ($jul <= ((2 * $d31) + $d30 + $feb)) {
		$newjul = $jul - (2 * $d31) - $feb;
		$date = "April $newjul , $yearjul";
	} elsif ($jul <= ((3 * $d31) + $d30 + $feb)) {
		$newjul = $jul - (2 * $d31) - $d30 - $feb;
		$date = "May $newjul , $yearjul";
	} elsif ($jul <= ((3 * $d31) + (2 * $d30) + $feb)) {
		$newjul = $jul - (3 * $d31) - $d30 - $feb;
		$date = "June $newjul , $yearjul";
	} elsif ($jul <= ((4 * $d31) + (2 * $d30) + $feb)) {
		$newjul = $jul - (3 * $d31) - (2 * $d30) - $feb;
		$date = "July $newjul , $yearjul";
	} elsif ($jul <= ((5 * $d31) + (2 * $d30) + $feb)) {
		$newjul = $jul - (4 * $d31) - (2 * $d30) - $feb;
		$date = "August $newjul , $yearjul";
	} elsif ($jul <= ((5 * $d31) + (3 * $d30) + $feb)) {
		$newjul = $jul - (5 * $d31) - (2 * $d30) - $feb;
		$date = "September $newjul , $yearjul";
	} elsif ($jul <= ((6 * $d31) + (3 * $d30) + $feb)) {
		$newjul = $jul - (5 * $d31) - (3 * $d30) - $feb;
		$date = "October $newjul , $yearjul";
	} elsif ($jul <= ((6 * $d31) + (4 * $d30) + $feb)) {
		$newjul = $jul - (6 * $d31) - (3 * $d30) - $feb;
		$date = "November $newjul , $yearjul";
	} elsif ($jul <= ((7 * $d31) + (4 * $d30) + $feb)) {
		$newjul = $jul - (6 * $d31) - (4 * $d30) - $feb;
		$date = "December $newjul , $yearjul";
	} else {
		Tkx::tk___messageBox(-message => "Not a valid date. Please Try Again.", -title => "Error");
	}
}
Tkx::MainLoop();
