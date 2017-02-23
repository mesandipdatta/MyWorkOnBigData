# Generate Template Cobol prog . A copybook structure needs to be changed for every template
# prog generated. 
# The copybook is the input for this prog

use ENGLISH;
use strict;
use File::Basename;

# Input Directory containing all the copybook files
my $dir = "C:/Users/dattas6/Desktop/Test/delete/*";
my @files = glob( $dir );


# Working Variables
my $fileBaseName; # Full filename along with dirname
my $tempfilename; # Filenamewith extn
my $filenameNoExtn; #Filename No extn
my $progname ;


# Output cobol prog dir
my $outputDir = "C:/Users/dattas6/Desktop/Test/deleteOutput/";

# Fetch each copybook file in the dir
foreach $fileBaseName (@files ){
    #print "$fileBaseName\n";
    $tempfilename = basename($fileBaseName);
    $tempfilename =~ s/.cpy//g ;  # Remove ".cpy" from filename"
    $filenameNoExtn = $tempfilename;
    
    # Call sub-routine to generate template prog for each copybook
    ProcessFile($filenameNoExtn) ;
}
print "====== Done =====";

# Process each line of the file read
sub ProcessFile{   # Loop1              
	my (@dataSent) = @_;
	my $copybookname = $dataSent[0];
	print "$copybookname \n";
	
# Form Cobol prog name 
    $progname = substr($copybookname,0,4);	
	
	print "$progname\n";

	my $outfilename = "$outputDir$copybookname.cbl";
	#print "$outfilename \n";
	open (OUTPUT , ">$outfilename");
	
	# Start the Cobol template prog
	print OUTPUT "       IDENTIFICATION DIVISION.\n";
	print OUTPUT "       PROGRAM-ID.$copybookname.\n";
	print OUTPUT "       AUTHOR.  EMC.\n";
	print OUTPUT "       ENVIRONMENT DIVISION.\n";
	print OUTPUT "       INPUT-OUTPUT SECTION.\n";
	print OUTPUT "       FILE-CONTROL.\n";
	print OUTPUT "       \n";
	print OUTPUT "       DATA DIVISION.\n";
	print OUTPUT "       FILE SECTION.\n";
	print OUTPUT "       \n";
	print OUTPUT "       WORKING-STORAGE SECTION. \n";
		
	print OUTPUT "       COPY $copybookname.\n";
	print OUTPUT "       PROCEDURE DIVISION. \n";
	print OUTPUT "           STOP RUN.\n";
#	print OUTPUT "$copybookname";
} 
