cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataTotal/1997"

capture log close
set more off
log using CombineDataRaw.log, replace

version 15

// use the grep command to get the list of all text files
// $ grep -l '' *.dta

drop _all 

// // 43 have repeated code
local dataPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/02 RealConversion/convertedData/"
use "`dataPath'43A Assistant Store Manager.dta",  clear 
collapse total, by (code)
save "43A Assistant Store Manager_collapse.dta", replace

// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/001 Company ID.dta", clear
keep code stores volume employee
save allPosRaw.dta, replace emptyok
use allPosRaw.dta, clear

local fileList "01 CEO" ///
		"02 General Counsel" ///
		"03 Top Real Estate" ///
		"04 Regional Real Estate" ///
		"05 Top Store Plan_Construct" ///
		"06 Regional Store Construct" ///
		"07 CFO" ///
		"08 Controller" ///
		"09 Treasurer" ///
		"10 Top Internal Auditor" ///
		"11 General Merchandise Mgr" ///
		"12 Div Merchandise Mgr" ///
		"13 Sr Buyer" ///
		"14 Buyer" ///
		"15 Assistant Buyer" ///
		"16 Top Planner" ///
		"17 Sr Planner" ///
		"18 Planner" ///
		"19 Distributor" ///
		"20 Top Import Coordinator" ///
		"21 Product Coordinator" ///
		"22 Top Mktg_Sales Promo" ///
		"23 Art Department" ///
		"24 Top Visual" ///
		"25 Regl Visual Merchandiser" ///
		"26 Top Systems_Data Procg" ///
		"27 Systems Programming" ///
		"28 Computer Operations" ///
		"29 Point Of Sale Admin" ///
		"30 Top Human Resources" ///
		"31 Comp_Benefits Mgr" ///
		"32 Top Loss Prevention" ///
		"33 Regional Loss Prevention" ///
		"34 Top DC _ Logistics" ///
		"35 DC Manager" ///
		"36 Domestic Traffic" ///
		"37 Top Store Operations" ///
		"38 Zone Manager" ///
		"39 Regional Manager" ///
		"40A District Manager" ///
		"41 Area Manager" ///
		"42A Store Manager" ///
		"43A Assistant Store Manager" ///
		"44A Third Key" ///
		"45 Full Time" ///
		"46 Part Time" 

local i 0
	
// for each data file, merge by code
foreach fileName in "`fileList'" {
di "This is file `fileName'" //DDD
local i = `i' + 1
if (`i' != 5 & `i' != 22 & `i' != 43)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(total)
	rename total total`i'
	drop _merge
	}
if (`i' == 43)	{
	merge m:1 code using "43A Assistant Store Manager_collapse.dta", keepusing(total)
	rename total total`i'
	drop _merge
	}
if (`i' == 5)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(pdctotal)
	rename pdctotal total`i'
	drop _merge
	}
if (`i' == 22)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(headtotal)
	rename headtotal total`i'
	drop _merge
	}
}

save allPosRaw.dta, replace 

summ

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

save allPosRaw.dta, replace 

