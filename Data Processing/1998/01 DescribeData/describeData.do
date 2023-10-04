cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/1998/01 DescribeData"

capture log close
set more off
log using describeData.log, replace

version 15

local pathName "/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1998/"

local fileList "01 ceo" ///
		"02 head of legal" ///
		"03 head of real estate" ///
		"04 regional real estate" ///
		"05 head of store plan const" ///
		"06 field regional const mgr" ///
		"07 cfo" ///
		"08 controller" ///
		"09 treasurer" ///
		"10 top internal auditor" ///
		"11 head of merchandising" ///
		"12 div merchandise mgr" ///
		"13 sr merch buyer" ///
		"14 merch buyer" ///
		"15 assistant _ assoiciate" ///
		"16 head of merch plan alloc" ///
		"17 sr merch plan controll" ///
		"18 merch planner controller" ///
		"19 merch distrib" ///
		"20 head of import prod" ///
		"21 production coor" ///
		"22 head of mktg advtg sales" ///
		"23 art department head" ///
		"24 head of visual" ///
		"25 reg visual merch" ///
		"26 head info sys data proc" ///
		"27 head systems programming" ///
		"28 head computer operations" ///
		"29 point sale admin" ///
		"30 head of human resource" ///
		"31 compensation benefit mgr" ///
		"32 head of loss prevention" ///
		"33 regional loss prevention" ///
		"34 head phys distrib log" ///
		"35 distribution center mgr" ///
		"36 domestic traffic manager" ///
		"37 head of stores" ///
		"38 zone manager" ///
		"39 regional manager" ///
		"40a  district manager" ///
		"40b district manager" ///
		"41 area sales _ sr manager" ///
		"42a store manager" ///
		"42b store manager" ///
		"43a assistant manager" ///
		"43b assistant manager" ///
		"44a third key" ///
		"44b third key" ///
		"45 full time" ///
		"46 part time" 
		
drop _all


// See which files need to have variables renamed and/or separated 
foreach fileName in "`fileList'" {
	
	import delimited using "`pathName'`fileName'.txt",  clear // names
	di "This is `fileName'"
	describe 
}

// 39
local fileName "39 regional manager" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v12              assoc0_25
rename v13              bnspct0_25
rename v14              bnsdollar0_25
rename v15            cap0_25
rename v16              base0_25
rename v17             bonus0_25
rename v18              total0_25
rename v19              assoc25_49
rename v20              bnspct25_49
rename v21             bnsdollar25_49
rename v22            cap25_49
rename v23              base25_49
rename v24             bonus25_49
rename v25              total25_49
rename v26              assoc50_74
rename v27              bnspct50_74
rename v28             bnsdollar50_74
rename v29            cap50_74
rename v30              base50_74
rename v31             bonus50_74
rename v32              total50_74
rename v33              assoc75_99
rename v34              bnspct75_99
rename v35             bnsdollar75_99
rename v36            cap75_99
rename v37              base75_99
rename v38             bonus75_99
rename v39              total75_99
rename v40              assoc100_199
rename v41            bnspct100_199
rename v42             bnsdollar100_199
rename v43            cap100_199
rename v44              base100_199
rename v45             bonus100_199
rename v46              total100_199
rename assoc           assoc200
rename bns              bnspct200
rename v49              bnsdollar200
rename cap              cap200
rename base             base200
rename bonus           bonus200
rename total            total200
rename allassoc           assoc
rename allbons          bnspct
rename allbns            bnsdollar
rename allcap           cap
rename allbase         base
rename allbonus       bonus
rename alltotal          total

// save it
save "`fileName'.dta", replace

// 40a
local fileName "40a  district manager" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v12                     assoc0_5
rename v13                       bnspct0_5
rename v14                       bnsdollar0_5
rename v15                     cap0_5
rename v16                      base0_5
rename v17                      bonus0_5
rename v18                      total0_5
rename v19                       assoc5_7
rename v20                       bnspct5_7
rename v21                      bnsdollar5_7
rename v22                     cap5_7
rename v23                      base5_7
rename v24                      bonus5_7
rename v25                      total5_7
rename v26                     assoc8_11
rename v27                       bnspct8_11
rename v28                      bnsdollar8_11
rename v29                     cap8_11
rename v30                      base8_11
rename v31                      bonus8_11
rename v32                      total8_11
rename v33                       assoc12_19
rename v34                      bnspct12_19
rename v35                      bnsdollar12_19
rename v36                     cap12_19
rename v37                      base12_19
rename v38                      bonus12_19
rename v39                      total12_19
rename v40                     assoc20_29
rename v41                       bnspct20_29
rename v42                       bnsdollar20_29
rename v43                     cap20_29
rename v44                      base20_29
rename v45                      bonus20_29
rename v46                      total20_29
rename assoc                     assoc30
rename bns                       bnspct30
rename v49                      bnsdollar30
rename cap                     cap30
rename base                      base30
rename bonus                    bonus30
rename total                     total30
rename allassoc               assoc
rename allbns                  bnspct
rename v7                       bnsdollar
rename allcap                 cap
rename allbase               base
rename allbonus             bonus
rename alltotal                total

// save it
save "`fileName'.dta", replace

// 41
local fileName "41 area sales _ sr manager" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v14                    assoc2
rename v15                    bnspct2
rename v16                    bnsdollar2
rename v17                  cap2
rename v18                    base2
rename v19                    bonus2
rename v20                    total2
rename v21                  assoc2_4
rename v22                    bnspct2_4
rename v23                    bnsdollar2_4
rename v24                  cap2_4
rename v25                    base2_4
rename v26                    bonus2_4
rename v27                    total2_4
rename assoc                  assoc5
rename bns                    bnspct5
rename v30                    bnsdollar5
rename cap                  cap5
rename base                   base5
rename bonus                  bonus5
rename total                total5
rename allassoc              assoc
rename allbns                 bnspct
rename v9                   bnsdollar
rename allcap             cap
rename allbase             base
rename allbonus           bonus
rename alltotal              total


// save it
save "`fileName'.dta", replace

// 42a
local fileName "42a store manager" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v13                   assoc500
rename v14                    bnspct500
rename v15                   bnsdollar500
rename v16                   cap500
rename v17                    base500
rename v18                    bonus500
rename v19                    total500
rename v20                   assoc501_999
rename v21                    bnspct501_999
rename v22                   bnsdollar501_999
rename v23                   cap501_999
rename v24                    base501_999
rename v25                    bonus501_999
rename v26                    total501_999
rename m14assoc             assoc1m_1m4
rename m14bns                 bnspct1m_1m4
rename v29                   bnsdollar1m_1m4
rename m14cap                cap1m_1m4
rename m14base                base1m_1m4
rename m14bonus               bonus1m_1m4
rename m14total               total1m_1m4
rename v34                   assoc1m5_2m4
rename v35                     bnspct1m5_2m4
rename v36                   bnsdollar1m5_2m4
rename v37                   cap1m5_2m4
rename v38                    base1m5_2m4
rename v39                    bonus1m5_2m4
rename v40                    total1m5_2m4
rename v41                   assoc2m5_3m9
rename v42                     bnspct2m5_3m9
rename v43                   bnsdollar2m5_3m9
rename v44                   cap2m5_3m9
rename v45                    base2m5_3m9
rename v46                    bonus2m5_3m9
rename v47                    total2m5_3m9
rename massoc               assoc4m
rename mbns                    bnspct4m
rename v50                   bnsdollar4m
rename mcap                  cap4m
rename mbase                    base4m
rename mbonus                 bonus4m
rename mtotal                 total4m
rename allassoc           assoc
rename allbns               bnspct
rename v8                     bnsdollar
rename allcap               cap
rename allbase             base
rename allbonus           bonus
rename alltotal              total


// save it
save "`fileName'.dta", replace


// 43a
local fileName "43a assistant manager" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v8                   assoc500
rename v9                   base500
rename v10                   bonus500
rename v11                   total500
rename v12                   min500
rename v13                   assoc501_999
rename v14                   base501_999
rename v15                   bns501_999
rename v16                   total501_999
rename v17                   min501_999
rename m14assoc              assoc1m_1m4
rename m14base               base1m_1m4
rename m14bns                bns1m_1m4
rename m14total              total1m_1m4
rename m14min                min1m_1m4
rename v23                   assoc1m5_2m4
rename v24                   base1m5_2m4
rename v25                   bns1m5_2m4
rename v26                   total1m5_2m4
rename v27                   min1m5_2m4
rename v28                   assoc2m5_3m9
rename v29                   base2m5_3m9
rename v30                   bns2m5_3m9
rename v31                   total2m5_3m9
rename v32                   min2m5_3m9
rename massoc                assoc4m
rename mbase                 base4m
rename mbns                  bns4m
rename mtotal                total4m
rename mmin                  min4m
rename allassoc           assoc
rename allbase             base
rename allbns               bns
rename alltotal              total

// save it
save "`fileName'.dta", replace

// 44a
local fileName "44a third key" 
import delimited using "`pathName'`fileName'.txt",  clear

rename v15                    assoc500
rename v16                    base500
rename v17                    bonus500
rename v18                    total500
rename v19                    assoc501_999
rename v20                    base501_999
rename v21                    Bns501_999
rename v22                    total501_999
rename m14assoc               assoc1m_1m4
rename m14base                base1m_1m4
rename m14bns                 Bns1m_1m4
rename m14total               total1m_1m4
rename v27                    assoc1m5_2m4
rename v28                    base1m5_2m4
rename v29                    Bns1m5_2m4
rename v30                    total1m5_2m4
rename v31                    assoc2m5_3m9
rename v32                    base2m5_3m9
rename v33                    Bns2m5_3m9
rename v34                    total2m5_3m9
rename massoc                 assoc4m
rename mbase                  base4m
rename mbns                   Bns4m
rename mtotal                 total4m

// save it
save "`fileName'.dta", replace

