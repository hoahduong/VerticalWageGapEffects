cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/JRI"

capture log close
set more off
log using JRI.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains JRI
// $ grep -l 'JRI' *.txt
local fileList "01 CEO.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"14 Buyer.txt" ///
	"16 Top Planner.txt" ///
	"17 Sr Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"37 Top Store Operations.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 

drop _all 

// create the big data file
save JRI.dta, replace emptyok

// for each data file, keep the row that has JRI information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "JRI"
gen fileName = "`fileName'"
append using JRI.dta
save JRI.dta, replace 
}

// load the file after appending all rows
use JRI.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save JRI.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using JRI.csv, comma

exit


