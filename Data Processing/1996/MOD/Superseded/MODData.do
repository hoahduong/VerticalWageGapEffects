cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/MOD/Superseded"

capture log close
set more off
log using MODData.log, replace

version 15

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

display "`fileList'"
// help concatenate
// help strings ... double quotes
//
// foreach fileName in "`fileList'" {
// display "`fileName'"
// }

// drop _all
// use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/01 CEO.dta"
// keep if code == "GAP"
// append using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/02 General Counsel.dta", generate(newvar)

drop _all 
save allMOD.dta, replace emptyok
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "MOD"
gen fileName = "`fileName'"
append using allMOD.dta
save allMOD.dta, replace 
}

exit

use allMOD.dta, clear
keep code base bonus total hire reports title reportsto fileName

gsort -fileName

gen payGap = total - total[_n-1]

save allMOD.dta, replace

outsheet code base bonus total hire reports title reportsto fileName payGap using allGap.csv, comma

exit



display `"`file'"'


foreach file of 
{
import delimited `file'
keep if Code == "GAP"
append using allGap.dta
save allGap.dta, replace 
}

