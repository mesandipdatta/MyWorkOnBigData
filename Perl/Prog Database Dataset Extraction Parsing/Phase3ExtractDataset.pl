#=========== File Open , Read process ======
open (INPUT2, "TSADATASET.txt");
my @array2 = <INPUT2>;
close (INPUT2);

open (OUTPUT2 , ">Phase3OutputProgDataset.txt");


#======= Variables Section
my $temptop2 = "";
my $dataset="";
my $toprint2 ="";

# Loop -L1 Starts
foreach $line (@array2){

	$string2 = $line;	
# Store Top Level prog 	
	if ($string2 =~ /(D: )/i) {
		$temptop2=substr($string2,3);
		$temptop2 =~ s/\s+$//; # Trailing Space Removal
		$temptop2 =~ s/^\s+//;
#		print "$temptop2\n";
#		print "=====================\n";
	}
	
	if ($string2 =~ /(DATASET)/) {   # Dataset info segment
			if ($string2 =~ /(FCT)/){
				$dataset = substr($string2,15);
			}
			else {
				$dataset = substr($string2,15);
			}
			$dataset =~ s/\s+$//; # Trailing Space removal
			$dataset =~ s/^\s+//; # Leading Space
#			print "$temptop2,$dataset\n";
			print OUTPUT2 "$temptop2,$dataset\n";		
	} 
} # Loop L1 ends

print "=========Phase2 Done==========\n";

exit;