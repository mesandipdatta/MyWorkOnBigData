#=========== File Open , Read process ======

# input file is here - 
# C:\Users\dattas6\Desktop\Sandip\Sandip\EMC - Projects & Clients\Unified\Deliverable - 27 - All Bundle - File IDMS DB2 - Online Batch\Files
=head
XO011.CBL
(XOP.CIC.MAR.EOSCCR)
(XOP.CIC.MAR.EOSCCR)

=cut


open (INPUT2, "fileseekoutput.txt");
my @array2 = <INPUT2>;
close (INPUT2);

open (OUTPUT2 , ">Script_Info_Output.txt");


#======= Variables Section
my $temptop2 = "";
my $dataset  = "";
my $toprint2 = "";

# Loop -L1 Starts
foreach $line (@array2){

	$string2 = $line;	
	
	# Extract prog\cpy name 	
	if ($string2 =~ /.[C][BP][LY]/i) {            # ".CBL or .CPY" syntax"
		# Split based on Regex
		# @recarray2 = split /.[C][BP][LY]/, $string2;  
        # $temptop2 = $recarray2[0];		
		$temptop2 = $string2;	
		$temptop2 =~ s/\s+$//; # Trailing Space Removal
		$temptop2 =~ s/^\s+//; # Leading Space Removal
#		print "===================================\n";
	}
	else {
		$dataset = $string2 ;
		
		if ($dataset =~ /^\s+/ ){   # Skip empty lines
			next;	
		}
		
		$dataset =~ s/\s+$//; # Trailing Space removal
		$dataset =~ s/\(//;   # Set Leading Bracket to Space e.g (WRP.DAY.MAR.DCSCVN2C
 		$dataset =~ s/\)//;   # Set Trailing Bracket to Space e.g. WRP.DAY.MAR.DCSCVN2C)
		$dataset =~ s/\'//g;   # Set ' to Space e.g. (XOHDRX2')
				
#		print "$temptop2,$dataset\n";
		print OUTPUT2 "$temptop2,$dataset\n";
	}
	
} # Loop L1 ends

print "=========Phase2 Done==========\n";

exit;