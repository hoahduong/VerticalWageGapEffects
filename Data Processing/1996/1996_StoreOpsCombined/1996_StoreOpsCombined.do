cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/1996_StoreOpsCombined"

capture log close
set more off
log using 1996_StoreOpsCombined.log, replace

version 15

local csvPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/1996_StoreOpsCombined/csvFiles/"
local dataPath "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/1996_StoreOpsCombined/Data/"

// use the grep command to get the list of all text files
// $ grep -l '' *.txt

drop _all 

do importData.do

// 42 43 have repeated code
use "`dataPath'42 Store Manager.dta", clear
collapse total, by (code)
save "`dataPath'42 Store Manager_collapse.dta", replace

use "`dataPath'43 Assistant Store Manager.dta", clear
collapse total, by (code)
save "`dataPath'43 Assistant Store Manager_collapse.dta", replace

// create the big data file
use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/001 Company ID.dta", clear
keep code store volume
save StoreOpsCombined.dta, replace emptyok
use StoreOpsCombined.dta, clear

// 43 Assistant Store Manager.dta
merge m:1 code using "`dataPath'43 Assistant Store Manager_collapse.dta", keepusing(total)
rename total total43
drop _merge

local fileList "42 Store Manager_collapse.dta" ///
	"41 Area Manager.dta" ///
	"40 District Manager.dta" ///
	"39 Regional Manager.dta" ///
	"38 Zone Manager.dta" ///
	"37 Top Store Operations.dta"

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
local noZone "BRO", "CAM", "CAT", "COA", "COU", "DRE", "FAM", "GAN", "GEN" 
local noZone1	"MAU", "MOD", "ONE", "PRI", "REC"

local noZoneNoArea	"BAK", "BIL", "BOM", "BRI", "CAR", "CHA", "CMA", "EDD", "FLA"
local noZoneNoArea1	 "FOO", "JBA", "JRI", "KIN", "LAN", "LEC", "LIZ", "MIL", "MUS"
local noZoneNoArea2  "PAR", "PET", "POT", "REE", "REN", "SCA", "STE", "TAL", "WMS"

// noZone
use StoreOpsCombined.dta
keep if inlist(code, "`noZone'") | inlist(code, "`noZone1'")
drop ZoneMgr
save noZone.dta, replace

outsheet code store volume AsstStoreMgr StoreMgr AreaMgr DistrictMgr RegionalMgr TopStoreOps using "`csvPath'noZone.csv", comma

// noZoneNoAre

use StoreOpsCombined.dta
keep if inlist(code, "`noZoneNoArea'") | inlist(code, "`noZoneNoArea1'") | inlist(code, "`noZoneNoArea2'")
drop ZoneMgr AreaMg
save noZoneNoArea.dta, replace

outsheet code store volume AsstStoreMgr StoreMgr DistrictMgr RegionalMgr TopStoreOps using "`csvPath'noZoneNoArea.csv", comma


