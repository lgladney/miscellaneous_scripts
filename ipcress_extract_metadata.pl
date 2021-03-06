#!/usr/bin/env perl
#Lori Gladney 12-08-2015
#Reformat in-silico PCR products output from ipcress

use strict;
use warnings;

my $file= $ARGV[0] or die "Cannot locate the input file\nUsage: ipcress_extract_metadata.pl <file> \n 
This script outputs PCR product metadata from ipcress in silico PCR program";

#First we open the file containing the data and associate it with file handle FILE
open (FILE, $file) or die "Cannot open the input file '$ARGV[0]'. Please make sure the file is in the current directory.\n";

#We store the the data into the variable @report (associated with <FILE>) , which is where it is read from. 
my @report= <FILE>;

# Close the file - we've read all the data into @report now.
close FILE;	


my @array;
my @metadata;

#Loop through each line in the report, pulling out lines that match. 
foreach (@report) {
		
	
	if (/^\s+Experiment/) {
	
	@array = split (/\s+/, $_);
	 
	push (@metadata, $array[1]);
	push (@metadata, $array[2]); 
	  
      }
    
	if (m/^\s+Matches/) {
	
	@array = split (/\s+/, $_);
	
	push (@metadata, $array[1]);
	push (@metadata, $array[2]);
	push (@metadata, $array[3]);
	
	  }
	  
	if (m/^\>/) {
	
	push (@metadata, $_);
		    
      }
	  				
   }   
   
	print "@metadata";
   
   
 exit;    

