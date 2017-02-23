use ENGLISH;
use strict;

# List all files in the directory and read each file line by line.

my $dir = "C:/Users/dattas6/Desktop/Test/cpy/*";
my @files = glob( $dir );

open (OUTPUT , ">Output2.txt");

# Working Variables
my $linedata;
my $line;
my $string;
my $FDflag=0;
my @fdarray = qw();
my $trimstring;
my $writeready = 0 ;
my $count=0;
my $chkstring;

# Output Variables
my $copybookname;
my $comp3flag;

print OUTPUT "CopyBookName,Comp3Flag \n"; 

# Fetch each file in the dir
foreach (@files ){
   #print $_ . "\n";
   open (INPUT, $_);
   my @array1 = <INPUT>;
   $copybookname = $_;	
   ProcessFile(@array1) ;
}
print "done";

# Process each line of the file read
sub ProcessFile{   # Loop1              
	my (@dataSent) = @_;
	foreach $line (@dataSent){  	# Loop2
	   $string = $line;
	   $comp3flag="No";
	   if ($string =~ / COMP/g){
	   	#print "$string \n";
	     if ((substr($string,6,1)) = '') { 
	  	    $comp3flag="COMP3";
	  	    print OUTPUT "$copybookname,$comp3flag \n";
	        return;
	     }	
	   }	
    }	# Loop2 - end of foreach
} # Loop1 - end of sub
