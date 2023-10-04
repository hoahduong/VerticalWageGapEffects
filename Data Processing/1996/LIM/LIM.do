cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/LIM"

capture log close
set more off
log using LIM.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains LIM
// $ grep -l 'LIM' *.txt
local fileList "01 CEO.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 

drop _all 

// create the big data file
save LIM.dta, replace emptyok

// for each data file, keep the row that has LIM information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "LIM"
gen fileName = "`fileName'"
append using LIM.dta
save LIM.dta, replace 
}

// load the file after appending all rows
use LIM.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save LIM.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using LIM.csv, comma

exit


