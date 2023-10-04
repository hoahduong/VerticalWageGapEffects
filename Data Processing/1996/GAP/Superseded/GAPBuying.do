cd "/Users/macbook/Desktop/18-19 Thesis/Data Processing/GAP"

capture log close
set more off
log using GAPBuying.log, replace

version 15

use allGap_v3.dta, clear
keep code base bonus total hire reports title reportsto fileName

gsort -fileName 

keep in 22/31

gen payGap = total - total[_n-1]

save GAPBuying.dta, replace

outsheet code base bonus total hire reports title reportsto fileName payGap using GAPBuying.csv, comma

exit
