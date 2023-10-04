cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataTotal/Superseded"

capture log close
set more off
log using Combine_Data.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of all text files
// $ grep -l '' *.dta

do collapse.do

drop _all 

// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/001 Company ID.dta", clear
keep code 
save total_all_pos.dta, replace emptyok
use total_all_pos.dta, clear

// 01 CEO 
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/01 CEO.dta", keepusing(total)
rename total total1
drop _merge

// 02 General Counsel.dta
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/02 General Counsel.dta", keepusing(total)
rename total total2
drop _merge

// 03 Top Real Estate.dta
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/03 Top Real Estate.dta", keepusing(total)
rename total total3
drop _merge


// 04 Regional Real Estate.dta
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/04 Regional Real Estate.dta", keepusing(total)
rename total total4
drop _merge

// "05 Top Store Plan_Construct.dta" 
merge m:1 code using "05 Top Store Plan_Construct_collapse.dta", keepusing(total)
rename total total5
drop _merge

// "06 Regional Store Construct.dta" 
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/06 Regional Store Construct.dta", keepusing(total)
rename total total6
drop _merge

// "07 CFO.dta" 
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/07 CFO.dta", keepusing(total)
rename total total7
drop _merge

// "08 Controller.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/08 Controller.dta", keepusing(total)
rename total total8
drop _merge

// "09 Treasurer.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/09 Treasurer.dta", keepusing(total)
rename total total9
drop _merge

// "10 Top Internal Auditor.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/10 Top Internal Auditor.dta", keepusing(total)
rename total total10
drop _merge

// "11 General Merchandise Mgr.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/11 General Merchandise Mgr.dta", keepusing(total)
rename total total11
drop _merge

//	"12 Div Merchandise Mgr.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/12 Div Merchandise Mgr.dta", keepusing(total)
rename total total12
drop _merge

//	"13 Sr Buyer.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/13 Sr Buyer.dta", keepusing(total)
rename total total13
drop _merge

//	"14 Buyer.dta" ///
merge m:1 code using "14 Buyer_collapse.dta", keepusing(total)
rename total total14
drop _merge

//	"15 Assistant Buyer.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/15 Assistant Buyer.dta", keepusing(total)
rename total total15
drop _merge

//	"16 Top Planner.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/16 Top Planner.dta", keepusing(total)
rename total total16
drop _merge

//	"17 Sr Planner.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/17 Sr Planner.dta", keepusing(total)
rename total total17
drop _merge

//	"18 Planner.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/18 Planner.dta", keepusing(total)
rename total total18
drop _merge

//	"19 Distributor.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/19 Distributor.dta", keepusing(total)
rename total total19
drop _merge

//	"20 Top Import Coordinator.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/20 Top Import Coordinator.dta", keepusing(total)
rename total total20
drop _merge

//	"21 Product Coordinator.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/21 Product Coordinator.dta", keepusing(total)
rename total total21
drop _merge

//	"22 Top Mktg_Sales Promo.dta" ///
merge m:1 code using "22 Top Mktg_Sales Promo_collapse.dta", keepusing(total)
rename total total22
drop _merge

//	"23 Art Department.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/23 Art Department.dta", keepusing(total)
rename total total23
drop _merge

//	"24 Top Visual.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/24 Top Visual.dta", keepusing(total)
rename total total24
drop _merge

//	"25 Regional Visual.dta" ///
merge m:1 code using "25 Regional Visual_collapse.dta", keepusing(total)
rename total total25
drop _merge

//	"26 Top Systems_Data Procg.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/26 Top Systems_Data Procg.dta", keepusing(total)
rename total total26
drop _merge

//	"27 Systems Programming.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/27 Systems Programming.dta", keepusing(total)
rename total total27
drop _merge

//	"28 Computer Operations.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/28 Computer Operations.dta", keepusing(total)
rename total total28
drop _merge

//	"29 Point Of Sale Admin.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/29 Point Of Sale Admin.dta", keepusing(total)
rename total total29
drop _merge

//	"30 Top Human Resources.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/30 Top Human Resources.dta", keepusing(total)
rename total total30
drop _merge

//	"31 Comp_Benefits Mgr.dta" ///
merge m:1 code using "31 Comp_Benefits Mgr_collapse.dta", keepusing(total)
rename total total31
drop _merge

//	"32 Top Loss Prevention.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/32 Top Loss Prevention.dta", keepusing(total)
rename total total32
drop _merge

//	"33 Regional Loss Prevention.dta" ///
merge m:1 code using "33 Regional Loss Prevention_collapse.dta", keepusing(total)
rename total total33
drop _merge

//	"34 Top DC _ Logistics.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/34 Top DC _ Logistics.dta", keepusing(total)
rename total total34
drop _merge

//	"35 DC Manager.dta" ///
merge m:1 code using "35 DC Manager_collapse.dta", keepusing(total)
rename total total35
drop _merge

//	"36 Domestic Traffic.dta" ///
merge m:1 code using "36 Domestic Traffic_collapse.dta", keepusing(total)
rename total total36
drop _merge

// 	"37 Top Store Operations.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/37 Top Store Operations.dta", keepusing(total)
rename total total37
drop _merge

//	"38 Zone Manager.dta" ///
merge m:1 code using "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/38 Zone Manager.dta", keepusing(total)
rename total total38
drop _merge

//	"39 Regional Manager.dta" ///
merge m:1 code using "39 Regional Manager_collapse.dta", keepusing(total)
rename total total39
drop _merge

//	"40 District Manager.dta" ///
merge m:1 code using "40 District Manager_collapse.dta", keepusing(total)
rename total total40
drop _merge

//	"41 Area Manager.dta" ///
merge m:1 code using "41 Area Manager_collapse.dta", keepusing(total)
rename total total41
drop _merge

//	"42 Store Manager.dta" ///
merge m:1 code using "42 Store Manager_collapse.dta", keepusing(total)
rename total total42
drop _merge

//	"43 Assistant Store Manager.dta" ///
merge m:1 code using "43 Assistant Store Manager_collapse.dta", keepusing(total)
rename total total43
drop _merge

//	"44 Third Key.dta" ///
merge m:1 code using "44 Third Key_collapse.dta", keepusing(total)
rename total total44
drop _merge

//	"45 Full Time.dta" ///
merge m:1 code using "45 Full Time_collapse.dta", keepusing(total)
rename total total45
drop _merge

//	"46 Part Time.dta" 
merge m:1 code using "46 Part Time_collapse.dta", keepusing(total)
rename total total46
drop _merge

// load the file after appending all rows
save total_all_pos.dta, replace

exit


/*

local fileList "01 CEO.dta"	///
	"02 General Counsel.dta" ///
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
	"42 Store Manager.dta" ///
	"43 Assistant Store Manager.dta" ///
	"44 Third Key.dta" ///
	"45 Full Time.dta" ///
	"46 Part Time.dta" 

// for each data file, merge by code
foreach fileName in "`fileList'" {
local name = `i' + 1
merge m:1 code using "`pathName'`fileName'",  keepusing(total)
rename total total`i'
drop _merge
save total_all_pos.dta, replace 
}
*/

