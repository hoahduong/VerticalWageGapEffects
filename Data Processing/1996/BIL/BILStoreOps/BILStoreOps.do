cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/BIL/BILStoreOps"

capture log close
set more off
log using BILStoreOps.log, replace

use "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/BIL/BIL.dta", clear

local fileList	"01 CEO.txt" ///
	"03 Top Real Estate.txt" ///
	"04 Regional Real Estate.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"14 Buyer.txt" ///
	"16 Top Planner.txt" ///
	"19 Distributor.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"24 Top Visual.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"35 DC Manager.txt" ///
	"36 Domestic Traffic.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 
	
	
// drop other positions except Store operations
foreach fileName in "`fileList'" {
drop if fileName == "`fileName'"
}

// generate the pay gap between each position
gen payGap = total - total[_n-1]

outsheet code base bonus total hire reports title reportsto fileName payGap using BILStoreOps.csv, comma

