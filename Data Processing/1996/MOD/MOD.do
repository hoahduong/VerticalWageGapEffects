cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/MOD"

capture log close
set more off
log using MOD.log, replace

version 15

// use the grep command to get the list of files that contains MOD
// $ grep -l 'MOD' *.txt
local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"
local fileList "01 CEO.txt" ///
				"05 Top Store Plan_Construct.txt" ///
				"06 Regional Store Construct.txt" ///
				"07 CFO.txt" ///
				"08 Controller.txt" ///
				"11 General Merchandise Mgr.txt" ///
				"12 Div Merchandise Mgr.txt" ///
				"13 Sr Buyer.txt" ///
				"14 Buyer.txt" ///
				"15 Assistant Buyer.txt" ///
				"16 Top Planner.txt" ///
				"18 Planner.txt" ///
				"19 Distributor.txt" ///
				"22 Top Mktg_Sales Promo.txt" ///
				"24 Top Visual.txt" ///
				"30 Top Human Resources.txt" ///
				"34 Top DC _ Logistics.txt" ///
				"36 Domestic Traffic.txt" ///
				"37 Top Store Operations.txt" ///
				"39 Regional Manager.txt" ///
				"40 District Manager.txt" ///
				"41 Area Manager.txt" ///
				"42 Store Manager.txt" ///
				"43 Assistant Store Manager.txt" ///
				"44 Third Key.txt" ///
				"45 Full Time.txt" ///
				"46 Part Time.txt"

drop _all 

// create the big data file
save MOD.dta, replace emptyok

// for each data file, keep the row that has MOD information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "MOD"
gen fileName = "`fileName'"
if fileName == "44 Third Key.txt" {
	drop comments
	}
append using MOD.dta
save MOD.dta, replace 
}

// load the file after appending all rows
use MOD.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save MOD.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using MOD.csv, comma

exit


