cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1997/01 DescribeData"

capture log close
set more off
log using describeData.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/"

local fileList "01 CEO" ///
		"02 General Counsel" ///
		"03 Top Real Estate" ///
		"04 Regional Real Estate" ///
		"05 Top Store Plan_Construct" ///
		"06 Regional Store Construct" ///
		"07 CFO" ///
		"08 Controller" ///
		"09 Treasurer" ///
		"10 Top Internal Auditor" ///
		"11 General Merchandise Mgr" ///
		"12 Div Merchandise Mgr" ///
		"13 Sr Buyer" ///
		"14 Buyer" ///
		"15 Assistant Buyer" ///
		"16 Top Planner" ///
		"17 Sr Planner" ///
		"18 Planner" ///
		"19 Distributor" ///
		"20 Top Import Coordinator" ///
		"21 Product Coordinator" ///
		"22 Top Mktg_Sales Promo" ///
		"23 Art Department" ///
		"24 Top Visual" ///
		"25 Regl Visual Merchandiser" ///
		"26 Top Systems_Data Procg" ///
		"27 Systems Programming" ///
		"28 Computer Operations" ///
		"29 Point Of Sale Admin" ///
		"30 Top Human Resources" ///
		"31 Comp_Benefits Mgr" ///
		"32 Top Loss Prevention" ///
		"33 Regional Loss Prevention" ///
		"34 Top DC _ Logistics" ///
		"35 DC Manager" ///
		"36 Domestic Traffic" ///
		"37 Top Store Operations" ///
		"38 Zone Manager" ///
		"39 Regional Manager" ///
		"40A District Manager" ///
		"40B District Manager" ///
		"41 Area Manager" ///
		"42A Store Manager" ///
		"42B Store Manager" ///
		"43A Assistant Store Manager" ///
		"43B Assistant Store Manager" ///
		"44A Third Key" ///
		"44B Third Key" ///
		"45 Full Time" ///
		"46 Part Time" 
		
drop _all


// See which files need to have variables renamed and/or separated 
foreach fileName in "`fileList'" {
	
	import delimited using "`pathName'`fileName'.txt",  clear // names
	di "This is `fileName'.txt"
	describe 
}

// BUYER --- Range represents sales volume
local fileName "14 Buyer" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v3         Assoc0_5
rename v4         PERCENT0_5
rename v5         bonuscap0_5
rename v6         base0_5
rename v7         bonus0_5
rename v8         total0_5
rename v9         assoc5_8
rename v10        percent5_8
rename v11        bonuscap5_8
rename v12        base5_8
rename v13        bonus5_8
rename v14        total5_8
rename v15        assoc8_12
rename v16        percent8_12
rename v17        bonuscap8_12
rename v18        base8_12
rename v19        bonus8_12
rename v20        total8_12
rename v21        assoc12_20
rename v22        percent12_20
rename v23        bonuscap12_20
rename v24        base12_20
rename v25        bonus12_20
rename v26        total12_20
rename v27        assoc20_30
rename v28        percent20_30
rename v29        bonuscap20_30
rename v30        base20_30
rename v31        bonus20_30
rename v32        total20_30
rename v33        assoc30_40
rename v34        percent30_40
rename v35        bonuscap30_40
rename v36        base30_40
rename v37        bonus30_40
rename v38        total30_40
rename v39        assoc40_50
rename v40        percent40_50
rename v41        bonuscap40_50
rename v42        base40_50
rename v43        bonus40_50
rename v44        total40_50
rename assoc      assoc50
rename percent    percent50
rename bonuscap   bonuscap50
rename base       base50
rename bonus      bonus50
rename total      total50
rename v51        assoc
rename v52        percent
rename v53        bonuscap
rename v54        base
rename v55        bonus
rename v56        total

// save it
save "`fileName'.dta", replace


// 39 --- Range represents sales volume
local fileName "39 Regional Manager"
import delimited using "`pathName'`fileName'.txt",  clear

rename v3             assoc0_25
rename v4             percent0_25
rename v5             bonuscap0_25
rename v6             base0_25
rename v7             bonus0_25
rename v8             total0_25
rename v9             assoc25_50
rename v10            percent25_50
rename v11            bonuscap25_50
rename v12            base25_50
rename v13            bonus25_50
rename v14            total25_50
rename v15            assoc50_75
rename v16            percent50_75
rename v17            bonuscap50_75
rename v18            base50_75
rename v19            bonus50_75
rename v20            total50_75
rename v21            assoc75_100
rename v22            percent75_100
rename v23            bonuscap75_100
rename v24            base75_100
rename v25            bonus75_100
rename v26            total75_100
rename v27            assoc100_200
rename v28            percent100_200
rename v29            bonuscap100_200
rename v30            base100_200
rename v31            bonus100_200
rename v32            total100_200
rename assoc          assoc200
rename percent        percent200
rename bonuscap       bonuscap200
rename base           base200
rename bonus          bonus200
rename total          total200
rename v39            assoc
rename v40            percent
rename v41            bonuscap
rename v42            base
rename v43            bonus
rename v44            total

// save 
save "`fileName'.dta", replace

// 40A
local fileName "40A District Manager"
import delimited using "`pathName'`fileName'.txt",  clear

rename v5                      assoc0_5
rename v6                      percent0_5
rename v7                      bonuscap0_5
rename v8                      base0_5
rename v9                      bonus0_5
rename v10                     total0_5
rename v11                     assoc5_8
rename v12                     percent5_8
rename v13                     bonuscap5_8
rename v14                     base5_8
rename v15                     bonus5_8
rename v16                     total5_8
rename v17                     assoc8_12
rename v18                     percent8_12
rename v19                     bonuscap8_12
rename v20                     base8_12
rename v21                     bonus8_12
rename v22                     total8_12
rename v23                     assoc12_20
rename v24                     percent12_20
rename v25                     bonuscap12_20
rename v26                     base12_20
rename v27                     bonus12_20
rename v28                     total12_20
rename v29                     assoc20_30
rename v30                     percent20_30
rename v31                     bonuscap20_30
rename v32                     base20_30
rename v33                     bonus20_30
rename v34                     total20_30
rename v35                     assoc30_40
rename v36                     percent30_40
rename v37                     bonuscap30_40
rename v38                     base30_40
rename v39                     bonus30_40
rename v40                     total30_40
rename assoc                   assoc40
rename percent                 percent40
rename bonuscap                bonuscap40
rename base                    base40
rename bonus                   bonus40
rename total                   total40
rename v47                     assoc
rename v48                     percent
rename v49                     bonuscap
rename v50                     base
rename v51                     bonus
rename v52                     total

// save
save "`fileName'.dta", replace


// 41
local fileName "41 Area Manager"
import delimited using "`pathName'`fileName'.txt",  clear

rename v6             dot2
rename v7             pct2
rename v8             bonuscap2
rename v9             base2
rename v10            bonus2
rename v11             total2
rename v12             dot2_5
rename v13             pct2_5
rename v14             bonuscap2_5
rename v15             base2_5
rename v16             bonus2_5
rename v17             total2_5
rename v18             dot5
rename v19             pct5
rename bonuscap        bonuscap5
rename base            base5
rename bonus           bonus5
rename total           total5
rename assoc           assoc5
rename percent         percent5
rename v26             bonuscap
rename v27             base
rename v28             bonus
rename v29             total

// save
save "`fileName'.dta", replace


// 42A
local fileName "42A Store Manager"
import delimited using "`pathName'`fileName'.txt",  clear

rename v5                    assoc0_500
rename v6                    max0_500
rename v7                    bonuscap0_500
rename v8                    base0_500
rename v9                    bonus0_500
rename v10                   total0_500
rename v11                   assoc500_1000
rename v12                   max500_1000
rename v13                   bonuscap500_1000
rename v14                   base500_1000
rename v15                   bonus500_1000
rename v16                   total500_1000
rename v17                   assoc1_1500
rename v18                   max1_1500
rename v19                   bonuscap1_1500
rename v20                   base1_1500
rename v21                   bonus1_1500
rename v22                   total1_1500
rename v23                   assoc15_2500
rename v24                   max15_2500
rename v25                   bonuscap15_2500
rename v26                   base15_2500
rename v27                   bonus15_2500
rename v28                   total15_2500
rename v29                   assoc25_4000
rename v30                   max25_4000
rename v31                   bonuscap25_4000
rename v32                   base25_4000
rename v33                   bonus25_4000
rename v34                   total25_4000
rename v35                   assoc4_10000
rename v36                   max4_10000
rename v37                   bonuscap4_10000
rename v38                   base4_10000
rename v39                   bonus4_10000
rename v40                   total4_10000
rename assoc                 assoc10000
rename max                   max10000
rename bc	                bonuscap10000
rename base                  base10000
rename bonus                 bonus10000
rename total                 total10000
rename v47                   assoc
rename maximum               maximum
rename bonuscap              bonuscap
rename v50                   base
rename v51                   bonus
rename v52                   total


// save
save "`fileName'.dta", replace


// 43A
local fileName "43A Assistant Store Manager"
import delimited using "`pathName'`fileName'.txt",  clear
rename v3          assoc0_500
rename v4          base0_500
rename v5          bonus0_500
rename v6          total0_500
rename v7          hire0_500
rename v8          assoc500_1000
rename v9          base500_1000
rename v10         bonus500_1000
rename v11         total500_1000
rename v12         hire500_1000
rename v13         assoc1_1500
rename v14         base1_1500
rename v15         bonus1_1500
rename v16         total1_1500
rename v17         hire1_1500
rename v18         assoc15_2500
rename v19         base15_2500
rename v20         bonus15_2500
rename v21         total15_2500
rename v22         hire15_2500
rename v23         assoc25_4000
rename v24         base25_4000
rename v25         bonus25_4000
rename v26         total25_4000
rename v27         hire25_4000
rename v28         assoc4_10000
rename v29         base4_10000
rename v30         bonus4_10000
rename v31         total4_10000
rename v32         hire4_10000
rename assoc       assoc10000
rename base        base10000
rename bonus       bonus10000
rename total       total10000
rename hire        hire10000
rename v38         assoc
rename v39         base
rename v40         bonus
rename v41         total
rename v42         hire

// save
save "`fileName'.dta", replace


// 44A
local fileName "44A Third Key"
import delimited using "`pathName'`fileName'.txt",  clear

rename v4             assoc0_500
rename v5             base0_500
rename v6             bonus0_500
rename v7             total0_500
rename v8             hire0_500
rename v9             assoc500_1000
rename v10            base500_1000
rename v11            bonus500_1000
rename v12            total500_1000
rename v13            hire500_1000
rename v14            assoc1_1500
rename v15            base1_1500
rename v16            bonus1_1500
rename v17            total1_1500
rename v18            hire1_1500
rename v19            assoc15_2500
rename v20            base15_2500
rename v21            bonus15_2500
rename v22            total15_2500
rename v23            hire15_2500
rename v24            assoc25_4000
rename v25            base25_4000
rename v26            bonus25_4000
rename v27            total25_4000
rename v28            hire25_4000
rename v29            assoc4_10000
rename v30            base4_10000
rename v31            bonus4_10000
rename v32            total4_10000
rename v33            hire4_10000
rename assoc          assoc10000
rename base           base10000
rename bonus          bonus10000
rename total          total10000
rename hire           hire10000
rename v39            assoc
rename v40            base
rename v41            bonus
rename v42            total
rename v43            hire

// save
save "`fileName'.dta", replace

exit


// OTHER

// MKTG_SALES PROMO --- several positions?
local fileName "22 Top Mktg_Sales Promo"
import delimited using "`pathName'`fileName'.txt",  clear


// Regl Visual Merchandiser --- separate regional?
local fileName "25 Regl Visual Merchandiser"

// 31

// 33

// 34 --- extra variables (union, etc)

// 40B

// 42B

// 43B

// 44B

// 45

// 46

