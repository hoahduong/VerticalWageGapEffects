cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/MEL"

capture log close
set more off
log using MEL.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains MEL
// $ grep -l 'MEL' *.txt
local fileList "01 CEO.txt" ///
	"02 General Counsel.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"09 Treasurer.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"13 Sr Buyer.txt" ///
	"14 Buyer.txt" ///
	"16 Top Planner.txt" ///
	"17 Sr Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"20 Top Import Coordinator.txt" ///
	"21 Product Coordinator.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"23 Art Department.txt" ///
	"24 Top Visual.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"27 Systems Programming.txt" ///
	"30 Top Human Resources.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"33 Regional Loss Prevention.txt" ///
	"35 DC Manager.txt" ///
	"37 Top Store Operations.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"41 Area Manager.txt" ///
	"45 Full Time.txt" 


drop _all 

// create the big data file
save MEL.dta, replace emptyok

// for each data file, keep the row that has MEL information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "MEL"
gen fileName = "`fileName'"
append using MEL.dta
save MEL.dta, replace 
}

// load the file after appending all rows
use MEL.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save MEL.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using MEL.csv, comma

exit


