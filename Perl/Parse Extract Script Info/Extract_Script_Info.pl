#=======================================================
# Extract Script information from UG Scripts
#=======================================================

#===== File Section 
open (INPUT2, "fileseekoutput.txt");
my @array2 = <INPUT2>;
close (INPUT2);

#open (OUTPUT2 , ">Script_Info_Output.txt");


#===== Temporary 
my $scriptName = "N";
my $line;
my $outputScriptName ;

# Loop -L1 Starts
foreach $line (@array2){

	$string2 = $line;	
	if ($string2 =~ /Script Number/i) {           
		$scriptName = "Y";
		next;
	}
	if ($scriptName eq "Y") {
		$outputScriptName = $string2;
	}

	if ($scriptName eq "Y") {
		print $outputScriptName;
		#Reset
		$scriptName = "N";
	}
	
	#print OUTPUT2 "$outputScriptName,$dataset\n";
	
} # Loop L1 ends

print "========= Data Extraction Complete ========\n";
exit;