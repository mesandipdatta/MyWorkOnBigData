#!/usr/bin/perl

use Spreadsheet::WriteExcel;
use Switch 'Perl6';

#=========== Input Text File ======
open (FILE, "intermed.txt");
my @array1 = <FILE>;
close (FILE);

# ====== Output Excel file ==============
# Create a new Excel file
my $FileName = "output.xls";
my $workbook = Spreadsheet::WriteExcel->new($FileName);

# Add a worksheet
my $worksheet = $workbook->add_worksheet('CBL-IDMS-DB2');

# Change width for only first column
#$worksheet->set_column(0,0,100);

#================= Start Writing 

my $row = 0;
my $column=0;
my $progname="";

foreach $line (@array1){
	$string1 = $line;

=put	
	# String block in the input file "======="
	if ($string1 =~ /^=/g) {
		$row = $row + 1;
		$column = 0;
	}
			
	if ($string1 =~ /IDMS SUMMARY:/g) {   
		$column = $column + 1;
		if ($string1 =~ /IDMS/g) {
		    $worksheet->write($row,$column, "SQL");
		    $column = $column + 1;
		    $db2name = substr $string1, 14, 130;
			$worksheet->write($row,$column, $db2name);
		}
	}
	else{          
		@progname[0] = substr $string1 , 6, 9;
		print "$progname[0] \n";
#		my ($row, $column, $progname) = @_;
#	    $worksheet->write($row,$column,$progname[0]);
	}
	
}
=cut

given ($string1) {
	when (/^=/) {    # "=" <- first line before every program details
		$column = 0;
		print "======== case 1\n"
	    }
	when (/IDMS SUMMARY:/) {   # IDMS details for each program
		if ($string1 =~ /IDMS/g) {
			$row = $row +1;
			$column = 0;
			$worksheet -> write($row,$column,$progname);
			$column = $column +1;
			$worksheet->write($row,$column, "IDMS");
		    $column = $column + 1;
		    $idmsname = substr $string1, 14, 130;
		    $worksheet->write($row,$column, $idmsname);
			}	
		 print "======== case 2\n" ;  
		}
	when (/SQL SUMMARY:/) {   # DB2 details for each program
		if ($string1 =~ /SQL/g) {
			$row = $row +1;
			$column = 0;
			$worksheet -> write($row,$column,$progname);
			$column = $column +1;
		    $worksheet->write($row,$column, "DB2");
		    $column = $column + 1;
		    $sqlname = substr $string1, 14, 130;
			$worksheet->write($row,$column, $sqlname);	
		    }	
		print "======== case 3\n" ;  
		}
	default {
		print "======== case 4\n";  # Program name
		$progname = substr $string1 , 6, 14;		
		$progname =~ /^(.*)\./;
		my $frontPart = $1;
		# Store the progname
		$progname = $1;
		print "$progname \n";
		}
} # end of 'given' block

} # end of 'for' loop
exit;

