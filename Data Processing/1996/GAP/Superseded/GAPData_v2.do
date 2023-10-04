cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/GAP/Superseded"

capture log close
set more off
log using GAPData_v2.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

local fileList "01 CEO.txt" ///
	"02 General Counsel.txt" ///
	"03 Top Real Estate.txt" ///
	"04 Regional Real Estate.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"06 Regional Store Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"09 Treasurer.txt" ///
	"10 Top Internal Auditor.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"13 Sr Buyer.txt" ///
	"14 Buyer.txt" ///
	"15 Assistant Buyer.txt" ///
	"16 Top Planner.txt" ///
	"17 Sr Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"20 Top Import Coordinator.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"23 Art Department.txt" ///
	"24 Top Visual.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"27 Systems Programming.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"33 Regional Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"37 Top Store Operations.txt" ///
	"38 Zone Manager.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"41 Area Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 

display "`fileList'"
// help concatenate
// help strings ... double quotes
//
// foreach fileName in "`fileList'" {
// display "`fileName'"
// }

drop _all 
save allGap_v2.dta, replace emptyok
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'",  clear // names
keep if code == "GAP"
gen fileName = "`fileName'"
append using allGap_v2.dta
save allGap_v2.dta, replace 
}

use allGap_v2.dta
keep code base bonus total hire reports title reportsto fileName

sort reports

gen payGap = total - total[_n-1]

drop if fileName == "01 CEO.txt"

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

