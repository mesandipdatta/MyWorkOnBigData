#=======================================================
# Extract Database Index information from DB2 DDLs
#=======================================================

use ENGLISH;
use strict;
use File::Basename;

# Input Directory containing all the DDL files
my $dir = "C:/Users/dattas6/Desktop/Test/DDL_Extract/*";
my @files = glob( $dir );

# Output file to write Parsing Data
open (OUTFILE , ">C:/Users/dattas6/Desktop/Test/Output_Index_Info.txt");


# Temporary Variables
my $DDLfile;
my $line;
#my @OutputData = qw();
my @tempArray = qw();
my $DDLName;
my $IndexInfo ="" ;
my $tableName;
my $outputData;

# Fetch DDL files in the dir
foreach $DDLfile (@files ){

    # Call sub-routine to parse each DDL file
    ProcessFile($DDLfile) ;
}
print "====== Parsing Done =====";


sub ProcessFile{   # Loop1              
	my (@dataSent) = @_;
	my $filename = $dataSent[0];
	#print "$filename \n";
	my $tempfilename = basename($filename);
	
	# Open the DDL file 
    open(INFILE, $filename) or die("Could not open the file.");
	
	foreach $line (<INFILE>)  {  

=head Regex - 1
		if ($line =~ /\QCREATE INDEX\E/g) {
			@tempArray = split /INDEX/, $line;
			$DDLName = $tempArray[1];
			$DDLName =~ s/\s+$//; # Trailing Space removal
		    $DDLName =~ s/^\s+//; # Leading space removal
			$IndexInfo = "Y"
		}
		if ($line =~ /\QCREATE UNIQUE INDEX\E/g) {
			@tempArray = split /INDEX/, $line;
			$DDLName = $tempArray[1];
			$DDLName =~ s/\s+$//; # Trailing Space removal
		    $DDLName =~ s/^\s+//; # Leading space removal
			$IndexInfo = "Y"
		}
=cut

#=head Regex - 2
		if ($line =~ /CREATE\s[UI][N][ID][QE][UX][E\s]/) {
			@tempArray = split /INDEX/, $line;
			$DDLName = $tempArray[1];
			$DDLName =~ s/\s+$//; # Trailing Space removal
		    $DDLName =~ s/^\s+//; # Leading space removal
			$IndexInfo = "Y"
		}
		
#=cut 

=head Regex - 3
		if (($line =~ /\QCREATE INDEX\E/g) || ($line =~ /\QCREATE UNIQUE INDEX\E/g)) {
			@tempArray = split /INDEX/, $line;
			$DDLName = $tempArray[1];
			$DDLName =~ s/\s+$//; # Trailing Space removal
		    $DDLName =~ s/^\s+//; # Leading space removal
			$IndexInfo = "Y"
		}
=cut

		if ($line =~ /\QON \E/g && $IndexInfo eq "Y"){
			@tempArray = split /ON/, $line;
			$tableName = $tempArray[1];
			$tableName =~ s/\s+$//; # Trailing Space removal
		    $tableName =~ s/^\s+//; # Leading space removal
			$IndexInfo = "N";
			print OUTFILE "$tempfilename,$DDLName,$tableName \n" ;
		}
	}
	
} 
