cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/02 RealConversion"

capture log close
set more off
log using convertData.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1998/"
local editedPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/01 DescribeData/"
local savePath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/02 RealConversion/convertedData/"

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
		"40b district manager" ///
		"41 area sales _ sr manager" ///
		"42a store manager" ///
		"42b store manager" ///
		"43a assistant manager" ///
		"43b assistant manager" ///
		"44a third key" ///
		"44b third key" ///
		"45 full time" ///
		"46 part time" 
		
		
local editedFiles "39 regional manager", "40a  district manager", "41 area sales _ sr manager", "42a store manager", "43a assistant manager", "44a third key"

	
drop _all


foreach fileName in "`fileList'" {
	if inlist("`fileName'", "`editedFiles'")	{
		use "`editedPath'`fileName'.dta", clear 
		quietly describe *base* *bonus* *total* *bns*, varlist
		local varList = r(varlist)
	}
	else	{
		import delimited using "`pathName'`fileName'.txt",  clear // names
		quietly describe *base* *bonus* *total*, varlist
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
