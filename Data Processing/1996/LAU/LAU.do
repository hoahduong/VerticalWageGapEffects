cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/LAU"

capture log close
set more off
log using LAU.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains LAU
// $ grep -l 'LAU' *.txt
local fileList "01 CEO.txt" ///
	"02 General Counsel.txt" ///
	"03 Top Real Estate.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"06 Regional Store Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"21 Product Coordinator.txt" ///
	"23 Art Department.txt" ///
	"25 Regional Visual.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"37 Top Store Operations.txt" ///
	"40 District Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"44 Third Key.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 


drop _all 

// create the big data file
save LAU.dta, replace emptyok

// for each data file, keep the row that has LAU information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "LAU"
gen fileName = "`fileName'"
if fileName == "44 Third Key.txt" {
	drop comments
	}
append using LAU.dta
save LAU.dta, replace 
}

// load the file after appending all rows
use LAU.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save LAU.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using LAU.csv, comma

exit


