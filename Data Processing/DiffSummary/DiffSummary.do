cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/DiffSummary"

capture log close
set more off
log using DiffSummary.log, replace

version 15

local path96 "/Users/macbook/Desktop/18-19 Thesis/R Calculations/1996 Ladders/"
local path97 "/Users/macbook/Desktop/18-19 Thesis/R Calculations/1997 Ladders/"
local path98 "/Users/macbook/Desktop/18-19 Thesis/R Calculations/1998 Ladders/"

local fileList "firstDiffNZ.csv"	///
				"firstDiffNZNA.csv"	///
				"secondDiffNZ.csv"	///
				"secondDiffNZNA.csv"

// load the data
drop _all
import delimited using "`path96'firstDiffNZ.csv", clear
summ

import delimited using "`path96'firstDiffNZNA.csv", clear
summ

import delimited using "`path96'secondDiffNZ.csv", clear
summ

import delimited using "`path96'secondDiffNZNA.csv", clear
summ

foreach fileName in "`fileList'" {
	import delimited using "`path97'`fileName'",  clear 
	di "This is `fileName'"	//DDD
	summ
}

foreach fileName in "`fileList'" {
	import delimited using "`path98'`fileName'",  clear 
	di "This is `fileName'"	//DDD
	summ
}









