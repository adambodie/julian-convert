#!/usr/bin/perl
use warnings;
use strict;
use Tkx;
#juliantodate.plx


my $month;
my $year;
my $day;
my $julian;
my $jul;
my $yearjul;
my $date;

my $wid = Tkx::widget->new(".");
$wid->g_wm_title("Julian to Date Converter");
$wid->g_grid_columnconfigure(0, -weight => 1);
$wid->g_grid_rowconfigure(0, -weight => 1);
my $labelframe = $wid->new_ttk__labelframe(-text => "Date to Julian Converter");
$labelframe->g_grid(-column => 0, -row => 0, -sticky => "nwes");
my $labelframe2 = $wid->new_ttk__labelframe(-text => "Julian to Date Converter");
$labelframe2->g_grid(-column => 1, -row => 0, -sticky => "nwes");

Tkx::font_create("AppHighlightFont", -family=> "Arial", -size => 16, -weight => "bold");

#Row 1 - Start Labels
my $monthlabels = $labelframe->new_ttk__label(-text => "Month")->g_grid(-column => 0, -row => 1);
my $daylabels = $labelframe->new_ttk__label(-text => "Day")->g_grid( -column => 1, -row => 1);
my $yearlabels = $labelframe->new_ttk__label(-text => "Year")->g_grid(-column => 2, -row => 1);
my $julianlabels = $labelframe2->new_ttk__label(-text => "Julian")->g_grid(-column => 0, -row => 1);
my $yearjulianlabels = $labelframe2->new_ttk__label(-text =>"Year")->g_grid(-column => 1, -row => 1);


#Row 2 - Start Entries
my $monthentry = $labelframe->new_ttk__entry(-width => 14, -justify => "center", -textvariable => \$month);
$monthentry->g_grid(-column => 0, -row => 2, -sticky => "we");
my $dayentry = $labelframe->new_ttk__entry(-width => 14, -justify => "center", -textvariable => \$day);
$dayentry->g_grid(-column => 1, -row => 2, -sticky => "we");
my $yearentry = $labelframe->new_ttk__entry(-width => 14, -justify => "center", -textvariable => \$year);
$yearentry->g_grid(-column => 2, -row => 2, -sticky => "we");
my $julianentry = $labelframe2->new_ttk__entry(-width => 21, -justify => "center", -textvariable => \$jul);
$julianentry->g_grid(-column => 0, -row => 2, -sticky => "w");
my $yearjulianentry = $labelframe2->new_ttk__entry(-width => 21, -justify => "center", -textvariable => \$yearjul);
$yearjulianentry->g_grid(-column => 1, -row => 2, -sticky => "w");


#Row 3 - End Labels
my $julianlabele = $labelframe->new_ttk__label(-text => "Julian")->g_grid( -column => 1, -row => 3);
my $datelabele = $labelframe2->new_ttk__label(-text => "Date")->g_grid(-column => 0, -row => 3, -columnspan => 2);

#Row 4 - End Entries
my $julianentrye = $labelframe -> new_ttk__entry(-width => 10, -justify => "center", -textvariable => \$julian);
$julianentrye->g_grid(-column => 1, -row => 4, -sticky => "we");
my $dateentrye = $labelframe2->new_ttk__entry(-width => 20, -justify => "center",  -textvariable => \$date);
$dateentrye->g_grid(-column => 0, -row => 4, -columnspan => 2);

#Row 5 - Buttons
my $calcbutton = $labelframe->new_ttk__button(-text => "Calculate", -command => sub {dateJulian();});
$calcbutton->g_grid(-column => 1, -row => 5);
my $calcbutton2 = $labelframe2->new_ttk__button(-text => "Calculate", -command => sub {julianDate();});
$calcbutton2->g_grid(-column => 0, -row => 5, -columnspan => 2);

foreach (Tkx::SplitList($labelframe->g_winfo_children)) {
    Tkx::grid_configure($_, -padx => 5, -pady => 5);
}
foreach (Tkx::SplitList($labelframe2->g_winfo_children)) {
    Tkx::grid_configure($_, -padx => 5, -pady => 5);
}

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
#!/usr/bin/perl
use warnings;
use strict;
use Tkx;
#juliantodate.plx


my $month;
my $year;
my $day;
my $julian;
my $jul;
my $yearjul;
my $date;

my $wid = Tkx::widget->new(".");
$wid->g_wm_title("Julian to Date Converter");
$wid->g_grid_columnconfigure(0, -weight => 1);
$wid->g_grid_rowconfigure(0, -weight => 1);
my $labelframe = $wid->new_ttk__labelframe(-text => "Date to Julian Converter");
$labelframe->g_grid(-column => 0, -row => 0, -sticky => "nwes");
my $labelframe2 = $wid->new_ttk__labelframe(-text => "Julian to Date Converter");
$labelframe2->g_grid(-column => 1, -row => 0, -sticky => "nwes");

Tkx::font_create("AppHighlightFont", -family=> "Arial", -size => 16, -weight => "bold");

#Row 1 - Start Labels
my $monthlabels = $labelframe->new_ttk__label(-text => "Month")->g_grid(-column => 0, -row => 1);
my $daylabels = $labelframe->new_ttk__label(-text => "Day")->g_grid( -column => 1, -row => 1);
my $yearlabels = $labelframe->new_ttk__label(-text => "Year")->g_grid(-column => 2, -row => 1);
my $julianlabels = $labelframe2->new_ttk__label(-text => "Julian")->g_grid(-column => 0, -row => 1);
my $yearjulianlabels = $labelframe2->new_ttk__label(-text =>"Year")->g_grid(-column => 1, -row => 1);


#Row 2 - Start Entries
my $monthentry = $labelframe->new_ttk__entry(-width => 14, -justify => "center", -textvariable => \$month);
$monthentry->g_grid(-column => 0, -row => 2, -sticky => "we");
my $dayentry = $labelframe->new_ttk__entry(-width => 14, -justify => "center", -textvariable => \$day);
$dayentry->g_grid(-column => 1, -row => 2, -sticky => "we");
my $yearentry = $labelframe->new_ttk__entry(-width => 14, -justify => "center", -textvariable => \$year);
$yearentry->g_grid(-column => 2, -row => 2, -sticky => "we");
my $julianentry = $labelframe2->new_ttk__entry(-width => 21, -justify => "center", -textvariable => \$jul);
$julianentry->g_grid(-column => 0, -row => 2, -sticky => "w");
my $yearjulianentry = $labelframe2->new_ttk__entry(-width => 21, -justify => "center", -textvariable => \$yearjul);
$yearjulianentry->g_grid(-column => 1, -row => 2, -sticky => "w");


#Row 3 - End Labels
my $julianlabele = $labelframe->new_ttk__label(-text => "Julian")->g_grid( -column => 1, -row => 3);
my $datelabele = $labelframe2->new_ttk__label(-text => "Date")->g_grid(-column => 0, -row => 3, -columnspan => 2);

#Row 4 - End Entries
my $julianentrye = $labelframe -> new_ttk__entry(-width => 10, -justify => "center", -textvariable => \$julian);
$julianentrye->g_grid(-column => 1, -row => 4, -sticky => "we");
my $dateentrye = $labelframe2->new_ttk__entry(-width => 20, -justify => "center",  -textvariable => \$date);
$dateentrye->g_grid(-column => 0, -row => 4, -columnspan => 2);

#Row 5 - Buttons
my $calcbutton = $labelframe->new_ttk__button(-text => "Calculate", -command => sub {dateJulian();});
$calcbutton->g_grid(-column => 1, -row => 5);
my $calcbutton2 = $labelframe2->new_ttk__button(-text => "Calculate", -command => sub {julianDate();});
$calcbutton2->g_grid(-column => 0, -row => 5, -columnspan => 2);

foreach (Tkx::SplitList($labelframe->g_winfo_children)) {
    Tkx::grid_configure($_, -padx => 5, -pady => 5);
}
foreach (Tkx::SplitList($labelframe2->g_winfo_children)) {
    Tkx::grid_configure($_, -padx => 5, -pady => 5);
}

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
