cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/CombineDataTotal/Superseded"

capture log close
set more off
log using collapse.log, replace

version 15

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/05 Top Store Plan_Construct.dta", clear
collapse total, by (code)
save "05 Top Store Plan_Construct_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/14 Buyer.dta", clear
collapse total, by (code)
save "14 Buyer_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/22 Top Mktg_Sales Promo.dta", clear
collapse total, by (code)
save "22 Top Mktg_Sales Promo_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/25 Regional Visual.dta", clear
collapse total, by (code)
save "25 Regional Visual_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/31 Comp_Benefits Mgr.dta", clear
collapse total, by (code)
save "31 Comp_Benefits Mgr_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/33 Regional Loss Prevention.dta", clear
collapse total, by (code)
save "33 Regional Loss Prevention_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/35 DC Manager.dta", clear
collapse total, by (code)
save "35 DC Manager_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/36 Domestic Traffic.dta", clear
collapse total, by (code)
save "36 Domestic Traffic_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/39 Regional Manager.dta", clear
collapse total, by (code)
save "39 Regional Manager_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/40 District Manager.dta", clear
collapse total, by (code)
save "40 District Manager_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/41 Area Manager.dta", clear
collapse total, by (code)
save "41 Area Manager_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/42 Store Manager.dta", clear
collapse total, by (code)
save "42 Store Manager_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/43 Assistant Store Manager.dta", clear
collapse total, by (code)
save "43 Assistant Store Manager_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/44 Third Key.dta", clear
collapse total, by (code)
save "44 Third Key_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/45 Full Time.dta", clear
collapse total, by (code)
save "45 Full Time_collapse.dta", replace

use "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/46 Part Time.dta", clear
collapse total, by (code)
save "46 Part Time_collapse.dta", replace





