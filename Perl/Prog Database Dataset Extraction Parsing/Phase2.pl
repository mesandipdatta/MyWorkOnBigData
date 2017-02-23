#=========== File Open , Read process ======
open (INPUT2, "Phase1ExceltoText.txt");
my @array2 = <INPUT2>;
close (INPUT2);

open (OUTPUT2 , ">Phase2Output.txt");


#======= Variables Section
my $temptop2 = "";
my @recarray2 =qw();
my $dbrec2 = "";
my $count2=0;
my $toprint2 ="";

# Loop -L1 Starts
foreach $line (@array2){

	$string2 = $line;
	
# Store Top Level prog 	
	if ($string2 =~ /(PROG:)/) {
		$string2 =~ s/\Q(IDMS)\E//g ;
		$string2 =~ s/\Q(SQL)\E//g ;
		$temptop2=$string2;
		$temptop2 =~ s/\s+$//;
	}
	
	if ($string2 =~ /(SUMMARY:)/) {   # IDMS  or SQL SUMMARY Segment extract - If - Loop2 starts
		@recarray2 = split /,/, $string2;
		
		foreach $dbrec2 (@recarray2){
			$count2 = $count2 +1;
			$dbrec2 =~ s/\s+$//; # Trailing Space removal
			$temptop2 =~ s/PROG: //g ;
			$toprint2 = "$temptop2,$dbrec2\n";
			print OUTPUT2 "$toprint2" ;
		}	
	} # If - Loop2 ends

=notneeded	
	if ($string2 =~ /(Already Processed)/g) {   # "(Already Processed)" tagged stmt extract  - IfLoop3 starts
		unless ($string2 =~ /(PROG:)/) {
			$string2 =~ s/\Q(Already Processed)\E//g ;
			$string2 =~ s/\s+$//;
			$temptop2 =~ s/PROG: //g ;
			$toprint2 = "$temptop2,$string2\n";
			print OUTPUT2 "$toprint2" ;
		}
	} # IfLoop3 ends
=cut
	
} # Loop L1 ends

print "=========Phase2 Done==========\n";

exit;