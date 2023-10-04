cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/AME"

capture log close
set more off
log using AME.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains AME
// $ grep -l 'AME' *.txt
local fileList "01 CEO.txt" ///
	"03 Top Real Estate.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"06 Regional Store Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"09 Treasurer.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"13 Sr Buyer.txt" ///
	"14 Buyer.txt" ///
	"15 Assistant Buyer.txt" ///
	"16 Top Planner.txt" ///
	"17 Sr Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"20 Top Import Coordinator.txt" ///
	"21 Product Coordinator.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"24 Top Visual.txt" ///
	"25 Regional Visual.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"32 Top Loss Prevention.txt" ///
	"33 Regional Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"35 DC Manager.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 


drop _all 

// create the big data file
save AME.dta, replace emptyok

// for each data file, keep the row that has AME information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "AME"
gen fileName = "`fileName'"
append using AME.dta
save AME.dta, replace 
}

// load the file after appending all rows
use AME.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

keep in 1/6

// generate the pay gap between each position
gen payGap = total - total[_n-1]

save AME.dta, replace

outsheet code base bonus total hire reports title reportsto fileName payGap using AME.csv, comma

exit


