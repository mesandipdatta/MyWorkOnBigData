#!/usr/bin/perl


#=========== File Open , Read process ======
open (FILE,"TSA.txt");
my @array1 = <FILE>;
my @array2 = @array1;
close (FILE);

#=================================================================================
#       This is Phase 1 - Building Prog\Link\Module\Xctl & Database relationship
#=================================================================================

open (OUTFILE1 , ">OutProgDatabase.txt");

#========== variables
my $progname="" ;
my $justwritten =0;
my @temparray1 = qw();
my $summarypushed=0;
my $previsprog=0;

# ========== Search format - "(SQL)" , (IDMS) ==================	

# Loop1
foreach $line (@array1){
    
	$string1 = $line;
	$string1 =~ s/\s+$//; # Trailing Space removal
	$string1 =~ s/^\s+//; # Leading Spaces
#========================== 
# Clean-up the string data
#==========================
# Remove dot(.) at the beginning of string. We first replace it with @ as dot(.) is perl key parm.	
	$string1 =~ tr/./@/;
    $string1 =~ s/^@+//;
    $string1 =~ tr/@/./;
    
# Remove certain keywords
	$string1 =~ s/LINK: //g ;
	$string1 =~ s/MODULE: //g ;
	$string1 =~ s/PROG: //g ;
	$string1 =~ s/XCTL: //g ;
	$string1 =~ s/CALL: //g ;
	$string1 =~ s/\Q(SQL)\E//g ;
	$string1 =~ s/\Q(IDMS)\E//g ;
	$string1 =~ s/\Q(Update)\E//g ;
	$string1 =~ s/\Q(Already Processed)\E//g ;
	$string1 =~ s/\Q(Missing)\E//g ;
	$string1 =~ s/\Q(Call Loop)\E//g ;
	$string1 =~ s/\Q(Excluded)\E//g ;

#==============================
# Main Logic and Start Writing        	
#==============================
	if ($string1 =~ /(SUMMARY:)/g) {
		
#		$string1 =~ s/IDMS SUMMARY://g ;
#		$string1 =~ s/SQL SUMMARY://g ;
		
		$string1="$string1,";
		push (@temparray1,$string1);
		$summarypushed=1;
	} 
	else{
		if (($summarypushed == 1) && ($previsprog == 1)){
			print OUTFILE1 "@temparray1 \n";
#			print OUTFILE1 "=========================\n";
#			print "@temparray1 \n";
#        	print "=========================\n";
			$summarypushed =0;
			@temparray1=qw();
			$previsprog=0;
		}
		if ($previsprog==1){
			@temparray1=qw();
		}
		$string1 =~ s/\s+$//; # Trailing Space removal
		$string1 =~ s/^\s+//; # Leading Spaces
		
		$string1 =~ s/\Q[\d]\E//g ;
		
		$progname = "$string1|";
		push (@temparray1,$progname);
		$previsprog=1;		
	}
	
} #end of Loop1

print "==== Extraction of Prog - Database Summary ===== \n";

#===================================================================================================================#
#            This is Phase 2 - Building Top-Level prog and its sublevels - Direct database , Sub Prog & sub-Database 
#===================================================================================================================#

open (OUTFILE2 , ">OutProgSubprog.txt");
my $string2 ="";
my $toplevelind=0;
my $datawritten=0;

foreach $line (@array2){   # Loop2
	$string2 = $line;
	
#Remove Initial dots(.)	
	$string2 =~ tr/./@/;
    $string2 =~ s/^@+//;
    $string2 =~ tr/@/./;

# Remove certain keywords (set to spaces)
#	$string2 =~ s/\Q(IDMS)\E//g ;
#	$string2 =~ s/\Q(SQL)\E//g ;
	$string2 =~ s/\Q(Update)\E//g ;
	
	$string2 =~ s/LINK: //g ;
	$string2 =~ s/MODULE: //g ;
	$string2 =~ s/MAP: //g ;
	$string2 =~ s/XCTL: //g ;

# Check if a Top-level prog		
	if ($string2 =~ /(PROG:)/) {
		$toplevelind=1;
	}

# If Entire sets for one Top level prog is written , draw a line	
	if ($toplevelind == 1 && $datawritten==1){
#		print OUTFILE2 "============================================\n";
		$toplevelind=0;
		$datawritten=0;
	}
	
	if ($string2 =~ /(PROG:)/) {      # Write if Top Level Prog
		print OUTFILE2 "$string2" ;
		$datawritten=1;
	}
	
	if ($string2 =~ /(SUMMARY:)/g) {   # Write if IDMS  or SQL SUMMARY Data
		print OUTFILE2 "$string2" ;
		$datawritten=1;
	} 
	
	if ($string2 =~ /(Already Processed)/g) {  # Write Already Processed info 
		$string2 =~ s/\Q(Already Processed)\E//g ;
		$string2 =~ s/\Q(IDMS)\E//g ;
		$string2 =~ s/\Q(SQL)\E//g ;
		$string2 =~ s/LINK: //g ;
		$string2 =~ s/MODULE: //g ;
		$string2 =~ s/MAP: //g ;
		$string2 =~ s/XCTL: //g ;
		print OUTFILE2 "$string2" ;
		$datawritten=1;
	} 
	 	
	
} #End of Loop2

print "==== Extraction of Prog - Sub prog Summary ===== \n";

exit;







