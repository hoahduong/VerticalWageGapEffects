cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/RealConversion"

capture log close
set more off
log using TopStorePlan_Construct.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/"

local fileList "05 Top Store Plan_Construct" ///
	
drop _all

// for each data file, replace base, bonus, and total 
foreach fileName in "`fileList'" {
	display "CHECKING: fileName is `fileName'."	//DDD
	import delimited using "`pathName'`fileName'.txt",  clear // names
	
	quietly describe *base *bonus *total, varlist
	local varList = r(varlist)
	
	//local vars `r(varlist)'
	
	// replace $ in each variable that ends with base
	foreach varName of varlist `varList'	{
		
		//di "varName is `varName'" //DDD
		
		// check if varName is of type string
		local vartype: type `varName'
		
		//di "I got here" //DDD
		
		if substr("`vartype'",1,3)=="str"	{
			gen `varName'Num = subinstr(`varName', "$", "", .)
			replace `varName'Num = subinstr(`varName'Num, ",", "", .)
			drop `varName'
			
			// replace string with real
			gen `varName' = real(`varName'Num)
			drop `varName'Num
		}
	}
	
	//save `fileName'.dta, replace 
}

exit

