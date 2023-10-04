cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/BIL"

capture log close
set more off
log using BIL.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains BIL
// $ grep -l 'BIL' *.txt
local fileList "01 CEO.txt" ///
	"03 Top Real Estate.txt" ///
	"04 Regional Real Estate.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"14 Buyer.txt" ///
	"16 Top Planner.txt" ///
	"19 Distributor.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"24 Top Visual.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"35 DC Manager.txt" ///
	"36 Domestic Traffic.txt" ///
	"37 Top Store Operations.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 

drop _all 

// create the big data file
save BIL.dta, replace emptyok

// for each data file, keep the row that has BIL information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "BIL"
gen fileName = "`fileName'"
append using BIL.dta
save BIL.dta, replace 
}

// load the file after appending all rows
use BIL.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save BIL.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using BIL.csv, comma

exit


