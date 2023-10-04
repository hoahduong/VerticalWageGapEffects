cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataTotal"

capture log close
set more off
log using CombineDataRaw.log, replace

version 15

// use the grep command to get the list of all text files
// $ grep -l '' *.dta

drop _all 

do importData.do

// 42 43 45 46 have repeated code
use "42 Store Manager.dta", clear
collapse total, by (code)
save "42 Store Manager_collapse.dta", replace

use "43 Assistant Store Manager.dta", clear
collapse total, by (code)
save "43 Assistant Store Manager_collapse.dta", replace

use "44 Third Key.dta", clear
collapse total, by (code)
save "44 Third Key_collapse.dta", replace

use "45 Full Time.dta", clear
collapse total, by (code)
save "45 Full Time_collapse.dta", replace

use "46 Part Time.dta", clear
collapse total, by (code)
save "46 Part Time_collapse.dta", replace

// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/001 Company ID.dta", clear
keep code 
save allPosRaw.dta, replace emptyok
use allPosRaw.dta, clear

// 01 CEO 
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/01 CEO.dta", keepusing(total)
rename total total1
drop _merge

local fileList "02 General Counsel.dta" ///
	"03 Top Real Estate.dta" ///
	"04 Regional Real Estate.dta" ///
	"05 Top Store Plan_Construct.dta" ///
	"06 Regional Store Construct.dta" ///
	"07 CFO.dta" ///
	"08 Controller.dta" ///
	"09 Treasurer.dta" ///
	"10 Top Internal Auditor.dta" ///
	"11 General Merchandise Mgr.dta" ///
	"12 Div Merchandise Mgr.dta" ///
	"13 Sr Buyer.dta" ///
	"14 Buyer.dta" ///
	"15 Assistant Buyer.dta" ///
	"16 Top Planner.dta" ///
	"17 Sr Planner.dta" ///
	"18 Planner.dta" ///
	"19 Distributor.dta" ///
	"20 Top Import Coordinator.dta" ///
	"21 Product Coordinator.dta" ///
	"22 Top Mktg_Sales Promo.dta" ///
	"23 Art Department.dta" ///
	"24 Top Visual.dta" ///
	"25 Regional Visual.dta" ///
	"26 Top Systems_Data Procg.dta" ///
	"27 Systems Programming.dta" ///
	"28 Computer Operations.dta" ///
	"29 Point Of Sale Admin.dta" ///
	"30 Top Human Resources.dta" ///
	"31 Comp_Benefits Mgr.dta" ///
	"32 Top Loss Prevention.dta" ///
	"33 Regional Loss Prevention.dta" ///
	"34 Top DC _ Logistics.dta" ///
	"35 DC Manager.dta" ///
	"36 Domestic Traffic.dta" ///
	"37 Top Store Operations.dta" ///
	"38 Zone Manager.dta" ///
	"39 Regional Manager.dta" ///
	"40 District Manager.dta" ///
	"41 Area Manager.dta" ///
	"42 Store Manager_collapse.dta" ///
	"43 Assistant Store Manager_collapse.dta" ///
	"44 Third Key_collapse.dta" ///
	"45 Full Time_collapse.dta" ///
	"46 Part Time_collapse.dta" 

local i 1
	
// for each data file, merge by code
foreach fileName in "`fileList'" {
local i = `i' + 1
merge m:1 code using "`fileName'",  keepusing(total)
rename total total`i'
drop _merge
}

save allPosRaw.dta, replace 

use allPosRaw.dta
describe

// rename
rename total1 CEO
rename total2 General_Counsel
rename total3 Top_Real_Estate
rename total4 Regional_Real_Estate
rename total5 Top_Store_Plan_Construct
rename total6 Regional_Store_Construct
rename total7 CFO
rename total8 Controller
rename total9 Treasurer
rename total10 Top_Internal_Auditor
rename total11 General_Merchandise_Mgr
rename total12 Div_Merchandise_Mgr
rename total13 Sr_Buyer
rename total14 Buyer
rename total15 Assistant_Buyer
rename total16 Top_Planner
rename total17 Sr_Planner
rename total18 Planner
rename total19 Distributor
rename total20 Top_Import_Coordinator
rename total21 Product_Coordinator
rename total22 Top_Mktg_Sales_Promo
rename total23 Art_Department
rename total24 Top_Visual
rename total25 Regional_Visual
rename total26 Top_Systems_Data_Procg
rename total27 Systems_Programming
rename total28 Computer_Operations
rename total29 Point_Of_Sale_Admin
rename total30 Top_Human_Resources
rename total31 Comp_Benefits_Mgr
rename total32 Top_Loss_Prevention
rename total33 Regional_Loss_Prevention
rename total34 Top_DC_Logistics
rename total35 DC_Manager
rename total36 Domestic_Traffic
rename total37 Top_Store_Operations
rename total38 Zone_Manager
rename total39 Regional_Manager
rename total40 District_Manager
rename total41 Area_Manager
rename total42 Store_Manager
rename total43 Assistant_Store_Manager 
rename total44 Third_Key
rename total45 Full_Time
rename total46 Part_Time

