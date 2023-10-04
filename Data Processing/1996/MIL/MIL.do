cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/MIL"

capture log close
set more off
log using MIL.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains  MIL
// $ grep -l 'MIL' *.txt
local fileList "01 CEO.txt" ///
	"03 Top Real Estate.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"14 Buyer.txt" ///
	"15 Assistant Buyer.txt" ///
	"16 Top Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"21 Product Coordinator.txt" ///
	"24 Top Visual.txt" ///
	"27 Systems Programming.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"33 Regional Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
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
save MIL.dta, replace emptyok

// for each data file, keep the row that has  MIL information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "MIL"
gen fileName = "`fileName'"
if fileName == "44 Third Key.txt" {
	drop comments
	}
append using  MIL.dta
save  MIL.dta, replace 
}

// load the file after appending all rows
use MIL.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save MIL.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using  MIL.csv, comma

exit


