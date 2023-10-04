cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/02 RealConversion"

capture log close
set more off
log using convertData.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/"
local editedPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/01 DescribeData/"
local savePath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/02 RealConversion/convertedData/"

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
		"40B District Manager" ///
		"41 Area Manager" ///
		"42A Store Manager" ///
		"42B Store Manager" ///
		"43A Assistant Store Manager" ///
		"43B Assistant Store Manager" ///
		"44A Third Key" ///
		"44B Third Key" ///
		"45 Full Time" ///
		"46 Part Time" 
		
		
local editedFiles "14 Buyer", "39 Regional Manager", "40A District Manager", "41 Area Manager", "42A Store Manager", "43A Assistant Store Manager", "44A Third Key"	
	
/* the following files don't have base, bonus, total
"05 Top Store Plan_Construct" ///
		"22 Top Mktg_Sales Promo" ///
		"40B District Manager" ///
		"42B Store Manager" ///
		"43B Assistant Store Manager" ///
		"44B Third Key" ///
*/
/*
local varList "base"	///
			"bonus"		///
			"total"
*/
	
drop _all


foreach fileName in "`fileList'" {
	if inlist("`fileName'", "`editedFiles'")	{
		use "`editedPath'`fileName'.dta", clear 
		quietly describe *base* *bonus* *total*, varlist
		local varList = r(varlist)
	}
	else	{
		import delimited using "`pathName'`fileName'.txt",  clear // names
		quietly describe *base *bonus *total, varlist
		local varList = r(varlist)
	}
	
	
	// replace $ in each variable that ends with base
	foreach varName of varlist `varList'	{
		
		// check if varName is of type string
		local vartype: type `varName'
		
		if substr("`vartype'",1,3)=="str"	{
			gen `varName'Num = subinstr(`varName', "$", "", .)
			replace `varName'Num = subinstr(`varName'Num, ",", "", .)
			drop `varName'
			
			// replace string with real
			gen `varName' = real(`varName'Num)
			drop `varName'Num
		}
	}
	
	save "`savePath'`fileName'.dta", replace 
}


exit

// for each data file, replace base, bonus, and total 
foreach fileName in "`fileList'" {
	display "CHECKING: fileName is `fileName'." //DDD
	import delimited using "`pathName'`fileName'.txt",  clear // names
	
	// replace $ in each variable
	foreach varName in "`varList'"	{
		// check if varName is of type string
		local vartype: type `varName'
		if substr("`vartype'",1,3)=="str"	{
			gen `varName'Num = subinstr(`varName', "$", "", .)
			replace `varName'Num = subinstr(`varName'Num, ",", "", .)
			drop `varName'
			
			// replace string with real
			gen `varName' = real(`varName'Num)
			drop `varName'Num
		}
	}
	
	display "THE COMMAND: ---save `fileName'.dta, replace---" //DDD
	
	save "`savePath'`fileName'.dta", replace 
}




