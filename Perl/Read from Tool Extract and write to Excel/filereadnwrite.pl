#!/usr/bin/perl

#=============================================================================================
# This routine will read the TSA output file and look for syntax (SQL) , (IDMS), (SQL SUMMARY)
# (IDMS SUMMARY) and strip out the line into another file
# However while doing so if a line contains (ALREADY PROCESSED) , then it will be skipped
#=============================================================================================

#=========== File Open , Read process ======
open (FILE, "TSA.txt");
my @array1 = <FILE>;
close (FILE);

open (OUTFILE , ">intermed.txt");

# ========== Search format - "(SQL)" , (IDMS) ==================	

foreach $line (@array1){
    
	$string1 = $line;

# dot(.) causes issues while striping out . So first changing it to "@" for ease to remove leading dots.
    $string1 =~ tr/./@/;
    $string1 =~ s/^@+//;
    $string1 =~ tr/@/./;
    
	if ($string1 =~ /\Q(SQL)\E/g) {
		unless ($string1 =~ /\Q(Already Processed)\E/g){
			print OUTFILE "==============================================\n";
			print OUTFILE $string1;
		}
	}
	elsif($string1 =~ /\Q(IDMS)\E/g) {
		unless ($string1 =~ /\Q(Already Processed)\E/g){
			print OUTFILE "==============================================\n";
			print OUTFILE $string1;
		}
	}
	
	if ($string1 =~ /(SQL SUMMARY:)/g) {
		print OUTFILE $string1;
	} 
	
	if ($string1 =~ /(IDMS SUMMARY:)/g) {
		print OUTFILE $string1;
	}
}

print "I am done ";

exit;