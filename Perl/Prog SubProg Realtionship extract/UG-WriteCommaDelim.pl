#!/usr/bin/perl

#=============================================================================================
#   This is Phase 1
#=============================================================================================

#=========== File Open , Read process ======
open (INPUT1, "OutProgDatabase.txt");
my @array1 = <INPUT1>;
close (INPUT1);

open (OUTPUT1 , ">Output1.txt");

#======= Variables Section
my $temptop = "";
my @recarray ;
my $dbrec = "";
my $count=0;
my $toprint ="";

# Loop 1 Starts
foreach $line (@array1){
 
	$string1 = $line;

# Store Top Level prog 

=c
	if ($string1 =~ /(PROG:)/) {
		$temptop=$string1;
		$temptop =~ s/\s+$//;
	}
=cut
	
	if ($string1 !~ /(SUMMARY:)/) {
		$temptop=$string1;
		$temptop =~ s/\s+$//;
	}
	
	if ($string1 =~ /(SUMMARY:)/g) {   # IDMS  or SQL SUMMARY Segment extract - IfLoop1 starts
		@recarray = split /,/, $string1;
		
		foreach $dbrec (@recarray){
			$count = $count +1;
			$dbrec =~ s/\s+$//; # Trailing Space removal
			$toprint = "$temptop,$dbrec\n";
			print OUTPUT1 "$toprint" ;
		}	
	} # IfLoop1 ends

=c	
	if ($string1 =~ /(Already Processed)/g) {   # "(Already Processed)" tagged stmt extract  - IfLoop2 starts
		$string1 =~ s/\s+$//;
		$toprint = "$temptop,$string1\n";
		print OUTPUT1 "$toprint" ;
	} # IfLoop2 ends
=cut
	
} # Loop 1 ends

print "=========Phase1 Done==========\n";

#==============================================================================
#   This is Phase 2 
#===============================================================================

#=========== File Open , Read process ======
open (INPUT2, "OutProgSubprog.txt");
my @array2 = <INPUT2>;
close (INPUT2);

open (OUTPUT2 , ">Output2.txt");


#======= Variables Section
my $temptop2 = "";
my @recarray2 ;
my $dbrec2 = "";
my $count2=0;
my $toprint2 ="";

# Loop -L1 Starts
foreach $line (@array2){
	
	$string2 = $line;
# Store Top Level prog 	
	if ($string2 =~ /(PROG:)/) {
		$temptop2=$string2;
		$temptop2 =~ s/\s+$//;
	}
	
	if ($string2 =~ /(SUMMARY:)/) {   # IDMS  or SQL SUMMARY Segment extract - If - Loop2 starts
		@recarray2 = split /,/, $string2;
		
		foreach $dbrec2 (@recarray2){
			$count2 = $count2 +1;
			$dbrec2 =~ s/\s+$//; # Trailing Space removal
			$toprint2 = "$temptop2,$dbrec2\n";
			print OUTPUT2 "$toprint2" ;
		}	
	} # If - Loop2 ends
	
	if ($string2 =~ /(Already Processed)/g) {   # "(Already Processed)" tagged stmt extract  - IfLoop3 starts
		$string2 =~ s/\s+$//;
		$toprint2 = "$temptop2,$string2\n";
		print OUTPUT2 "$toprint2" ;
	} # IfLoop3 ends
	
} # Loop L1 ends

print "=========Phase2 Done==========\n";

exit;