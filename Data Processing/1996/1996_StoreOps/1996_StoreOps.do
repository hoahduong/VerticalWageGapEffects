cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/1996_StoreOps"

capture log close
set more off
log using 1996_StoreOps.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/"
local csvPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/1996_StoreOps/csvFiles/"

local companyList "AME" ///
				"BAK" ///
				"BIL" ///
				"BOM" ///
				"BRI" ///
				"BRO" ///
				"CAM" ///
				"CAR" ///
				"CAS" ///
				"CAT" ///
				"CHA" ///
				"CHA1" ///
				"CLA" ///
				"CMA" ///
				"COA" ///
				"COU" ///
				"DES" ///
				"DIS" ///
				"DRE" ///
				"EAS" ///
				"EDD" ///
				"EDI" ///
				"ELE" ///
				"FAM" ///
				"FLA" ///
				"FOO" ///
				"FOO1" ///
				"GAN" ///
				"GAP" ///
				"GEN" ///
				"JBA" ///
				"JRI" ///
				"KIN" ///
				"KIN1" ///
				"LAN" ///
				"LAU" ///
				"LEC" ///
				"LIM" ///
				"LIZ" ///
				"MAN" ///
				"MAU" ///
				"MEL" ///
				"MIL" ///
				"MOD" ///
				"MUS" ///
				"NIN" ///
				"ONE" ///
				"PAR" ///
				"PAY" ///
				"PET" ///
				"POT" ///
				"PRI" ///
				"REC" ///
				"REE" ///
				"REN" ///
				"SCA" ///
				"SCA1" ///
				"SPE" ///
				"STE" ///
				"TAL" ///
				"THI" ///
				"UPT" ///
				"WAL" ///
				"WIL" ///
				"WMS" ///
				"WOO"
			  
local noZone "BRO", "CAM", "CAT", "COA", "COU", "DRE", "FAM", "GAN", "GEN" 
local noZone1	"MAU", "MOD", "ONE", "PRI", "REC"

local noZoneNoArea	"BAK", "BIL", "BOM", "BRI", "CAR", "CHA", "CMA", "EDD", "FLA"
local noZoneNoArea1	 "FOO", "JBA", "JRI", "KIN", "LAN", "LEC", "LIZ", "MIL", "MUS"
local noZoneNoArea2  "PAR", "PET", "POT", "REE", "REN", "SCA", "STE", "TAL", "WMS"
			
local fileList "37 Top Store Operations.txt" ///
	"38 Zone Manager.txt" ///
	"39 Regional Manager.txt" ///
	"40 District Manager.txt" ///
	"41 Area Manager.txt" ///
	"42 Store Manager.txt" ///
	"43 Assistant Store Manager.txt" 

// di `"`fileList'"' //DDD

drop _all 

// for each company, generate a .dta file

foreach companyName in "`companyList'"	{
	drop _all
	// create the big data file
	save `companyName'.dta, replace emptyok

	// for each data file, keep the row that has each companyName information and append to the big data file
	foreach fileName in "`fileList'" {
		import delimited using "`pathName'`fileName'",  clear // names
		gen fileName = "`fileName'"
		if fileName == "44 Third Key.txt" {
			drop comments
			// (Need to do more here)
			} 
		else {
		// display "Checking: companyName is " "`companyName' and fileName is `fileName'." //DDD
		keep if code == "`companyName'"
		// display "before append" //DDD
		// count //DDD
		append using `companyName'.dta
		// display "after append, before save" //DDD
		// count //DDD
		save `companyName'.dta, replace 
		}
	}

// load the file after appending all rows
use "`companyName'.dta", clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
gen firstDiff = total - total[_n-1]

// generate the second difference
gen secondDiff = firstDiff - firstDiff[_n-1]

save `companyName'.dta, replace

if inlist("`companyName'", "`noZone'") | inlist("`companyName'", "`noZone1'")	{
	outsheet code base bonus total hire reports title reportsto fileName firstDiff secondDiff using "`csvPath'NoZone/`companyName'.csv", comma
	}
	
if inlist("`companyName'", "`noZoneNoArea'") | inlist("`companyName'", "`noZoneNoArea1'") | inlist("`companyName'", "`noZoneNoArea2'")	{
	outsheet code base bonus total hire reports title reportsto fileName firstDiff secondDiff using "`csvPath'NoZoneNoArea/`companyName'.csv", comma
	}
}


exit


