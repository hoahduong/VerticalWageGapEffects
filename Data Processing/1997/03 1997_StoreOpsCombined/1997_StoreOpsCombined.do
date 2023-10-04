cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/03 1997_StoreOpsCombined"

capture log close
set more off
log using 1997_StoreOpsCombined.log, replace

version 15

local csvPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/03 1997_StoreOpsCombined/csvFiles/"
local dataPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/02 RealConversion/convertedData/"
	
drop _all

// 43 has repeated code (BRI)
use "`dataPath'43A Assistant Store Manager.dta", clear
collapse total, by (code)
save "`dataPath'43A Assistant Store Manager_collapse.dta", replace

local fileList "42A Store Manager.dta" ///
	"41 Area Manager.dta" ///
	"40A District Manager.dta" ///
	"39 Regional Manager.dta" ///
	"38 Zone Manager.dta" ///
	"37 Top Store Operations.dta"


// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/001 Company ID.dta", clear
keep code stores volume employees
save StoreOpsCombined.dta, replace emptyok
use StoreOpsCombined.dta, clear

// 43 Assistant Store Manager.dta
merge m:1 code using "`dataPath'43A Assistant Store Manager_collapse.dta", keepusing(total)
rename total total43
drop _merge

local i 43
	
// for each data file, merge by code
foreach fileName in "`fileList'" {
local i = `i' - 1
merge m:1 code using "`dataPath'`fileName'",  keepusing(total)
rename total total`i'
drop _merge
}

save StoreOpsCombined.dta, replace 

use StoreOpsCombined.dta
//describe

// rename
rename total37 TopStoreOps
rename total38 ZoneMgr
rename total39 RegionalMgr
rename total40 DistrictMgr
rename total41 AreaMgr
rename total42 StoreMgr
rename total43 AsstStoreMgr

save StoreOpsCombined.dta, replace
	
	
// split into two categories
local noZone "BRO", "CAM", "COU", "DRE", "FRE", "GAN", "GEN" 
local noZone1	"MAU", "ONE", "WAL"

local noZoneNoArea	"AME", "BIL", "BOM", "BRI", "CAR", "CHR", "CMA"
local noZoneNoArea1	 "EDD", "DEB", "FAM", "JLI", "LEC", "LIZ", "PET"
local noZoneNoArea2  "POT", "SIZ", "TAL", "WMS", "WOO"

// noZone
use StoreOpsCombined.dta
keep if inlist(code, "`noZone'") | inlist(code, "`noZone1'")
drop ZoneMgr
save noZone.dta, replace

outsheet code stores volume employees AsstStoreMgr StoreMgr AreaMgr DistrictMgr RegionalMgr TopStoreOps using "`csvPath'noZone.csv", comma

// noZoneNoAre

use StoreOpsCombined.dta
keep if inlist(code, "`noZoneNoArea'") | inlist(code, "`noZoneNoArea1'") | inlist(code, "`noZoneNoArea2'")
drop ZoneMgr AreaMg
save noZoneNoArea.dta, replace

outsheet code stores volume employees AsstStoreMgr StoreMgr DistrictMgr RegionalMgr TopStoreOps using "`csvPath'noZoneNoArea.csv", comma
	
	
exit
	
	
local companyList "AER" ///
				"AME" ///
				"AMY" ///
				"BAK" ///
				"BIL" ///
				"BLO" ///
				"BOD" ///
				"BOM" ///
				"BRI" ///
				"BRO" ///
				"CAM" ///
				"CAR" ///
				"CAS" ///
				"CAT" ///
				"CHC" ///
				"CHR" ///
				"CLA" ///
				"CMA" ///
				"COU" ///
				"CRA" ///
				"DEB" ///
				"DES" ///
				"DRE" ///
				"EDD" ///
				"EDI" ///
				"ELE" ///
				"FAC" ///
				"FAM" ///
				"FED" ///
				"FRE" ///
				"GAN" ///
				"GAP" ///
				"GEN" ///
				"HEL" ///
				"JBA" ///
				"JLI" ///
				"JRI" ///
				"LAU" ///
				"LEC" ///
				"LEN" ///
				"LIM" ///
				"LIN" ///
				"LIZ" ///
				"MAU" ///
				"MIL" ///
				"MOD" ///
				"MUS" ///
				"NIN" ///
				"ONE" ///
				"PAY" ///
				"PET" ///
				"POT" ///
				"SIZ" ///
				"SPE" ///
				"TAL" ///
				"THI" ///
				"WAL" ///
				"WIL" ///
				"WMS" ///
				"WOO"
