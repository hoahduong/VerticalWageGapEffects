cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/StructureSummary"

capture log close
set more off
log using StructureSummary.log, replace

version 15

local path96 "/Users/macbook/Desktop/18-19 Thesis/R Calculations/1996 Ladders/"
local path97 "/Users/macbook/Desktop/18-19 Thesis/R Calculations/1997 Ladders/"
local path98 "/Users/macbook/Desktop/18-19 Thesis/R Calculations/1998 Ladders/"

local fileList "structureNZ.csv"	///
				"structureNZNA.csv"	///
				"allStruct.csv"

// load the data
drop _all
foreach fileName in "`fileList'" {
	import delimited using "`path96'`fileName'",  clear 
	di "This is `fileName'"	//DDD
	tab structure
}

foreach fileName in "`fileList'" {
	import delimited using "`path97'`fileName'",  clear 
	di "This is `fileName'"	//DDD
	tab structure
}

foreach fileName in "`fileList'" {
	import delimited using "`path98'`fileName'",  clear 
	di "This is `fileName'"	//DDD
	tab structure
}









