cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/EDI"

capture log close
set more off
log using EDI.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains EDI
// $ grep -l 'EDI' *.txt
local fileList "01 CEO.txt" ///
	"02 General Counsel.txt" ///
	"03 Top Real Estate.txt" ///
	"04 Regional Real Estate.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"30 Top Human Resources.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"33 Regional Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"35 DC Manager.txt" ///
	"36 Domestic Traffic.txt" 

drop _all 

// create the big data file
save EDI.dta, replace emptyok

// for each data file, keep the row that has EDI information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "EDI"
gen fileName = "`fileName'"
append using EDI.dta
save EDI.dta, replace 
}

// load the file after appending all rows
use EDI.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save EDI.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using EDI.csv, comma

exit


