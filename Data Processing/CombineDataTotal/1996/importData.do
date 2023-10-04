cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataTotal/1996"

capture log close
set more off
log using CombineDataRaw.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"

// use the grep command to get the list of all text files
// $ grep -l '' *.txt

local fileList "01 CEO"	///
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
	"25 Regional Visual" ///
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
	"40 District Manager" ///
	"41 Area Manager" ///
	"42 Store Manager" ///
	"43 Assistant Store Manager" ///
	"44 Third Key" ///
	"45 Full Time" ///
	"46 Part Time" 

// for each data file, merge by code
foreach fileName in "`fileList'" {
import delimited using "`pathName'`fileName'.txt",  clear 
save "`fileName'.dta", replace 
}
