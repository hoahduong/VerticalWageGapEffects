cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataTotal/1998"

capture log close
set more off
log using CombineDataRaw.log, replace

version 15

// use the grep command to get the list of all text files
// $ grep -l '' *.dta

drop _all 

local dataPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/02 RealConversion/convertedData/"

// 15 has both assistant and associate
use "`dataPath'15 assistant _ assoiciate",  clear 
gen total = cond(missing(assoctotal, assisttotal), max(assoctotal, assisttotal), (assoctotal + assisttotal) / 2) 
save "15 assistant _ assoiciate_avg.dta", replace

// 44 has both pt and ft
use "`dataPath'44a third key", clear
gen total = cond(missing(pttotal, fttotal), max(pttotal, fttotal), (pttotal + fttotal) / 2) 
save "44a third key_avg.dta", replace

// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1998/001 company data.dta", clear
keep code 
save allPosRaw.dta, replace emptyok
use allPosRaw.dta, clear

local fileList "01 ceo" ///
		"02 head of legal" ///
		"03 head of real estate" ///
		"04 regional real estate" ///
		"05 head of store plan const" ///
		"06 field regional const mgr" ///
		"07 cfo" ///
		"08 controller" ///
		"09 treasurer" ///
		"10 top internal auditor" ///
		"11 head of merchandising" ///
		"12 div merchandise mgr" ///
		"13 sr merch buyer" ///
		"14 merch buyer" ///
		"15 assistant _ assoiciate" ///
		"16 head of merch plan alloc" ///
		"17 sr merch plan controll" ///
		"18 merch planner controller" ///
		"19 merch distrib" ///
		"20 head of import prod" ///
		"21 production coor" ///
		"22 head of mktg advtg sales" ///
		"23 art department head" ///
		"24 head of visual" ///
		"25 reg visual merch" ///
		"26 head info sys data proc" ///
		"27 head systems programming" ///
		"28 head computer operations" ///
		"29 point sale admin" ///
		"30 head of human resource" ///
		"31 compensation benefit mgr" ///
		"32 head of loss prevention" ///
		"33 regional loss prevention" ///
		"34 head phys distrib log" ///
		"35 distribution center mgr" ///
		"36 domestic traffic manager" ///
		"37 head of stores" ///
		"38 zone manager" ///
		"39 regional manager" ///
		"40a  district manager" ///
		"41 area sales _ sr manager" ///
		"42a store manager" ///
		"43a assistant manager" ///
		"44a third key" ///
		"45 full time" ///
		"46 part time" 
local i 0
	
// for each data file, merge by code
foreach fileName in "`fileList'" {
di "This is file `fileName'" //DDD
local i = `i' + 1
if (`i' != 5 & `i' != 15 & `i' != 21 & `i' != 22 & `i' != 31 & `i' != 44 & `i' != 45 & `i' != 46)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(total)
	rename total total`i'
	drop _merge
	}
if (`i' == 5)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(pdctotal)
	rename pdctotal total`i'
	drop _merge
	}
if (`i' == 15)	{
	merge m:1 code using "15 assistant _ assoiciate_avg.dta", keepusing(total)
	rename total total`i'
	drop _merge
	}
if (`i' == 21)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(odtotal)
	rename odtotal total`i'
	drop _merge
	}
if (`i' == 22)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(masptotal)
	rename masptotal total`i'
	drop _merge
	}
if (`i' == 31)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(cbtotal)
	rename cbtotal total`i'
	drop _merge
	}
if (`i' == 44)	{
	merge m:1 code using "44a third key_avg.dta", keepusing(total)
	rename total total`i'
	drop _merge
	}
if (`i' == 45 | `i' == 46)	{
	merge m:1 code using "`dataPath'`fileName'",  keepusing(nattotal)
	rename nattotal total`i'
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

