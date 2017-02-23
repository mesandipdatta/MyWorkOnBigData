use ENGLISH;
use strict;

# List all files in the directory and read each file line by line.

my $dir = "C:/Users/dattas6/Desktop/Test/JCL/TYPRUN_SCAN_JCL/*";
my @files = glob( $dir );

open (OUTPUT , ">Output4.txt");

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
my $prog;
my $filename;
my $exec;
my $ddname;
my $subst;

# Output Variables
my $jclname;
my $comp3flag;

# Fetch each file in the dir
foreach (@files ){
   #print $_ . "\n";
   open (INPUT, $_);
   my @array1 = <INPUT>;
   $jclname = $_;	
   print "$jclname =================================== \n";
   ProcessFile(@array1) ;
}
print "done";

# Process each line of the file read
sub ProcessFile{   # Loop1              
	my (@dataSent) = @_;
	$prog = '';
	$exec='';
	foreach $line (@dataSent){  	# Loop2
	   $string = $line;
	   
	   my $chkstring = substr($string,5,2);
	   print "$chkstring ================== \n";
	   $subst=0;
	   if ($chkstring ne "//"){
	   	$subst=1;
	   	#next;
	   }
	   
	   # Get the prog name
	   if ($string =~ / PGM=/g){
	     my($first, $rest) = split(/ PGM=/, $string, 2);
	     $string=$rest;
	     ($first, $rest)   = split(/[,\s\/]+/, $string, 2);
	     #$rest=substr($rest,0,8);
	     $first =~ s/\s+$//; # Trailing Space removal
		 $first =~ s/^\s+//; # Leading Space
		 $prog=$first;
	   }	
	   
	   # Get the file name
	   if ($string =~ /DSN=/g){
	   	 # DD Name
	   	 if ($subst==1){
	   	 	$ddname='-------';
	   	 }else{
	   	 	$ddname=substr($string,7,8);
	   	 }
	   	 
	   	 # DSN Name
	   	 my ($first, $rest) = split(/DSN=/, $string, 2);
	     $string=$rest;
	     ($first, $rest) = split(/[,\s]+/, $string,2);
	     $filename=$first;
	     print "$filename \n";
	     print OUTPUT "$jclname|$prog|$ddname|$filename \n";
	   }
    }
    return;	# Loop2 - end of foreach
} # Loop1 - end of sub
