cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/03 1998_StoreOpsCombined"

capture log close
set more off
log using 1998_StoreOpsCombined.log, replace

version 15

local csvPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/03 1998_StoreOpsCombined/csvFiles/"
local dataPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/02 RealConversion/convertedData/"
	
drop _all

local fileList "43a assistant manager.dta" ///
	"42a store manager.dta" ///
	"41 area sales _ sr manager.dta" ///
	"40a  district manager.dta" ///
	"39 regional manager.dta" ///
	"38 zone manager.dta" ///
	"37 head of stores.dta" ///


// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1998/001 company data.dta", clear
keep code employees stores volume 
save StoreOpsCombined.dta, replace emptyok
use StoreOpsCombined.dta, clear
local i 44
	
// for each data file, merge by code
foreach fileName in "`fileList'" {
local i = `i' - 1
merge m:1 code using "`dataPath'`fileName'",  keepusing(total)
rename total total`i'
drop _merge
}

save StoreOpsCombined.dta, replace 

use StoreOpsCombined.dta, clear
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
	
exit
	
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
	
	
