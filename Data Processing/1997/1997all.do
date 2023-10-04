cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997"

capture log close
set more off
log using 1997all.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/"

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
				  
			
local fileList "01 CEO.txt" ///
	"02 General Counsel.txt" ///
	"03 Top Real Estate.txt" ///
	"04 Regional Real Estate.txt" ///
	"05 Top Store Plan_Construct.txt" ///
	"06 Regional Store Construct.txt" ///
	"07 CFO.txt" ///
	"08 Controller.txt" ///
	"09 Treasurer.txt" ///
	"10 Top Internal Auditor.txt" ///
	"11 General Merchandise Mgr.txt" ///
	"12 Div Merchandise Mgr.txt" ///
	"13 Sr Buyer.txt" ///
	"14 Buyer.txt" ///
	"15 Assistant Buyer.txt" ///
	"16 Top Planner.txt" ///
	"17 Sr Planner.txt" ///
	"18 Planner.txt" ///
	"19 Distributor.txt" ///
	"20 Top Import Coordinator.txt" ///
	"21 Product Coordinator.txt" ///
	"22 Top Mktg_Sales Promo.txt" ///
	"23 Art Department.txt" ///
	"24 Top Visual.txt" ///
	"25 Regl Visual Merchandiser.txt" ///
	"26 Top Systems_Data Procg.txt" ///
	"27 Systems Programming.txt" ///
	"28 Computer Operations.txt" ///
	"29 Point Of Sale Admin.txt" ///
	"30 Top Human Resources.txt" ///
	"31 Comp_Benefits Mgr.txt" ///
	"32 Top Loss Prevention.txt" ///
	"33 Regional Loss Prevention.txt" ///
	"34 Top DC _ Logistics.txt" ///
	"35 DC Manager.txt" ///
	"36 Domestic Traffic.txt" ///
	"37 Top Store Operations.txt" ///
	"38 Zone Manager.txt" ///
	"39 Regional Manager.txt" ///
	"40A District Manager.txt" ///
	"40B District Manager.txt" ///
	"41 Area Manager.txt" ///
	"42A Store Manager.txt" ///
	"42B Store Manager.txt" ///
	"43A Assistant Store Manager.txt" ///
	"43B Assistant Store Manager.txt" ///
	"44A Third Key.txt" ///
	"44B Third Key.txt" ///
	"45 Full Time.txt" ///
	"46 Part Time.txt" 


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
		keep if code == "`companyName'"
		append using `companyName'.dta
		save `companyName'.dta, replace 
		}
	}

// load the file after appending all rows
use `companyName'.dta, clear

// keep certain columns
keep code base bonus total hire reports title reportsto fileName

// sort descending by file name 
gsort -fileName 

// generate the pay gap between each position
//gen payGap = total - total[_n-1]

save `companyName'.dta, replace

}

//outsheet code base bonus total hire reports title reportsto fileName payGap using BRI.csv, comma

exit


