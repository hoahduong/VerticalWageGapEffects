cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataPos"

capture log close
set more off
log using CombineData.log, replace

version 15

// use the grep command to get the list of all dta files
// $ grep -l '' *.dta

drop _all

local fileList "AME.dta"	///
	"BAK.dta"	///
	"BIL.dta"	
	
drop _all 

// create the big data file
save allData.dta, replace emptyok

///use "AME.dta"
///append using allData.dta
//save allData.dta, replace

// for each data file, append to the big data file
foreach fileName in "`fileList'" {
use "`fileName'",  clear // names
append using allData.dta
save allData.dta, replace 
}
