cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/ELE"

capture log close
set more off
log using ELE.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of files that contains ELE
// $ grep -l 'ELE' *.txt
local fileList "01 CEO.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"08 Controller.txt" ///
	"09 Treasurer.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"13 Sr Buyer.txt" ///
	"14 Buyer.txt" ///
	"15 Assistant Buyer.txt" ///
	"16 Top Planner.txt" ///
	"19 Distributor.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"24 Top Visual.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"27 Systems Programming.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"36 Domestic Traffic.txt" ///
	"38 Zone Manager.txt" ///
	"39 Regional Manager.txt" ///
	"41 Area Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"44 Third Key.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 
	
drop _all 

// create the big data file
save ELE.dta, replace emptyok

// for each data file, keep the row that has ELE information and append to the big data file
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "ELE"
gen fileName = "`fileName'"
if fileName == "44 Third Key.txt" {
	drop comments
	}
append using ELE.dta
save ELE.dta, replace 
}

// load the file after appending all rows
use ELE.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save ELE.dta, replace

//outsheet code base bonus total hire reports title reportsto fileName payGap using ELE.csv, comma

exit


