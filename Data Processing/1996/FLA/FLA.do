cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/FLA"

capture log close
set more off
log using FLA.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains FLA
// $ grep -l 'FLA' *.txt
local fileList "01 CEO.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"14 Buyer.txt" ///
	"15 Assistant Buyer.txt" ///
	"16 Top Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"24 Top Visual.txt" ///
	"37 Top Store Operations.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"44 Third Key.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 


drop _all 

// create the big data file
save FLA.dta, replace emptyok

// for each data file, keep the row that has FLA information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "FLA"
gen fileName = "`fileName'"
if fileName == "44 Third Key.txt" {
	drop comments
	}
append using FLA.dta
save FLA.dta, replace 
}

// load the file after appending all rows
use FLA.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save FLA.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using FLA.csv, comma

exit


