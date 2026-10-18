* Load and convert raw csv data
import delimited "C:/Users/Lenovo/Desktop/6067/01_DID/data/public.csv", clear varnames(1)
destring _all, replace force
count
save "C:/Users/Lenovo/Desktop/6067/01_DID/data/cardkrueger_clean.dta", replace

use "C:/Users/Lenovo/Desktop/6067/01_DID/data/cardkrueger_clean.dta", clear
gen treated = (state ==1)
gen bk = (chain ==1)
gen kfc = (chain ==2)
gen roys = (chain ==3)
gen wendys = (chain ==4)
gen company_owned = co_owned

*=============================================
* Card & Krueger 1994 -- Table 2 Replication
*=============================================
* Part1: Store type distribution (Table2 first block)
display "===== NJ (treated=1) ====="
tabstat bk kfc roys wendys company_owned if treated==1, statistics(n mean sem)
display "===== PA (treated=0) ====="
tabstat bk kfc roys wendys company_owned if treated==0, statistics(n mean sem)

display "==== T-test: bk ===="
ttest bk, by(treated) unequal
scalar t_bk = r(mu1)-r(mu2)
display "t(NJ-PA): " t_bk

display "==== T-test: kfc ===="
ttest kfc, by(treated) unequal
scalar t_kfc = r(mu1)-r(mu2)
display "t(NJ-PA): " t_kfc

display "==== T-test: roys ===="
ttest roys, by(treated) unequal
scalar t_roys = r(mu1)-r(mu2)
display "t(NJ-PA): " t_roys

display "==== T-test: wendys ===="
ttest wendys, by(treated) unequal
scalar t_wendys = r(mu1)-r(mu2)
display "t(NJ-PA): " t_wendys

display "==== T-test: company_owned ===="
ttest company_owned, by(treated) unequal
scalar t_co = r(mu1)-r(mu2)
display "t(NJ-PA): " t_co

*wave1
gen fte_pre = empft + nmgrs + 0.5 * emppt
gen pct_full_pre = empft / (empft + nmgrs + 0.5 * emppt) * 100
gen wage425 = (wage_st == 4.25)
gen mealprice_pre = pentree + pfry + psoda
gen recruit_bonus = bonus
display "===== NJ (treated=1) Wave1 ====="
tabstat fte_pre pct_full_pre wage_st wage425 mealprice_pre hrsopen recruit_bonus if treated==1, statistics(n mean sem)
display "===== PA (treated=0) Wave1 ====="
tabstat fte_pre pct_full_pre wage_st wage425 mealprice_pre hrsopen recruit_bonus if treated==0, statistics(n mean sem)
display "==== T-test: fte_pre ===="
ttest fte_pre, by(treated) unequal
scalar t_fte = -r(t)
display "t(NJ-PA): " t_fte
display "==== T-test: pct_full_pre ===="
ttest pct_full_pre, by(treated) unequal
scalar t_pctfull = -r(t)
display "t(NJ-PA): " t_pctfull
display "==== T-test: wage_st ===="
ttest wage_st, by(treated) unequal
scalar t_wage = -r(t)
display "t(NJ-PA): " t_wage
display "==== T-test: wage425 ===="
ttest wage425, by(treated) unequal
scalar t_w425 = -r(t)
display "t(NJ-PA): " t_w425
display "==== T-test: mealprice_pre ===="
ttest mealprice_pre, by(treated) unequal
scalar t_meal = -r(t)
display "t(NJ-PA): " t_meal
display "==== T-test: hrsopen ===="
ttest hrsopen, by(treated) unequal
scalar t_hrs = -r(t)
display "t(NJ-PA): " t_hrs
display "==== T-test: recruit_bonus ===="
ttest recruit_bonus, by(treated) unequal
scalar t_bonus = -r(t)
display "t(NJ-PA): " t_bonus

*wave2
gen fte_post = empft2 + nmgrs2 + 0.5 * emppt2
gen pct_full_post = empft2 / (empft2 + nmgrs2 + 0.5 * emppt2) * 100
gen wage425_post = (wage_st2 == 4.25)
gen wage505_post = abs(wage_st2 - 5.05) < 0.001
gen mealprice_post = pentree2 + pfry2 + psoda2
gen recruit_bonus_post = special2
display "===== NJ (treated=1) Wave2 ====="
tabstat fte_post pct_full_post wage_st2 wage425_post wage505_post mealprice_post hrsopen2 recruit_bonus_post if treated==1, statistics(n mean sem)
display "===== PA (treated=0) Wave2 ====="
tabstat fte_post pct_full_post wage_st2 wage425_post wage505_post mealprice_post hrsopen2 recruit_bonus_post if treated==0, statistics(n mean sem)
display "==== T-test: fte_post ===="
ttest fte_post, by(treated) unequal
scalar t_fte2 = -r(t)
display "t(NJ-PA): " t_fte2
display "==== T-test: pct_full_post ===="
ttest pct_full_post, by(treated) unequal
scalar t_pctfull2 = -r(t)
display "t(NJ-PA): " t_pctfull2
display "==== T-test: wage_st2 ===="
ttest wage_st2, by(treated) unequal
scalar t_wage2 = -r(t)
display "t(NJ-PA): " t_wage2
display "==== T-test: wage425_post ===="
ttest wage425_post, by(treated) unequal
scalar t_w425_2 = -r(t)
display "t(NJ-PA): " t_w425_2
display "==== T-test: wage505_post ===="
ttest wage505_post, by(treated) unequal
scalar t_w505_2 = -r(t)
display "t(NJ-PA): " t_w505_2
display "==== T-test: mealprice_post ===="
ttest mealprice_post, by(treated) unequal
scalar t_meal2 = -r(t)
display "t(NJ-PA): " t_meal2
display "==== T-test: hrsopen2 ===="
ttest hrsopen2, by(treated) unequal
scalar t_hrs2 = -r(t)
display "t(NJ-PA): " t_hrs2
display "==== T-test: recruit_bonus_post ===="
ttest recruit_bonus_post, by(treated) unequal
scalar t_bonus2 = -r(t)
display "t(NJ-PA): " t_bonus2


*=============================================
* Card & Krueger 1994 -- Table 3 Replication
*=========================
***stores by state
*Row3: All available observations
display "===== Correct Row3: All available observations ====="
tabstat fte_pre if treated==0, statistics(n mean sem)
tabstat fte_post if treated==0, statistics(n mean sem)
tabstat fte_pre if treated==1, statistics(n mean sem)
tabstat fte_post if treated==1, statistics(n mean sem)

*Row4: Balanced sample of stores
gen delta_fte = fte_post - fte_pre
gen balanced_row4 = (!missing(fte_pre) & !missing(fte_post))
display "===== Row4 : Balanced sample ====="
tabstat delta_fte if treated==0 & balanced_row4==1, statistics(n mean sem)
tabstat delta_fte if treated==1 & balanced_row4==1, statistics(n mean sem)
ttest delta_fte if balanced_row4==1, by(treated) unequal

*Row5: Temporarily closed set FTE_post=0
gen balanced_row5 = !missing(fte_pre)
gen fte_post_adj = fte_post
replace fte_post_adj = 0 if inlist(status2,2,4,5)
gen delta_fte_adj = fte_post_adj - fte_pre
display "===== Row5 : Temporarily closed set FTE_post=0 ====="
tabstat delta_fte_adj if treated==0 & balanced_row5==1, statistics(n mean sem)
tabstat delta_fte_adj if treated==1 & balanced_row5==1, statistics(n mean sem)
ttest delta_fte_adj if balanced_row5==1, by(treated) unequal

***Generate wage group for NJ sub-groups
gen wave1_exist = !missing(fte_pre)
gen wage_group = .
replace wage_group =1 if abs(wage_st - 4.25) < 0.005 & !missing(wage_st)
replace wage_group =2 if wage_st > 4.255 & wage_st <=4.995 & !missing(wage_st)
replace wage_group =3 if wage_st >= 4.995 & !missing(wage_st)

label define wg 1 "Wage=4.25" 2 "Wage 4.26~4.99" 3 "Wage>=5.00"
label values wage_group wg
display "===== Row1: FTE employment before, all available obs ====="
tabstat fte_pre if treated==1 & wage_group==1, statistics(n mean sem)
tabstat fte_pre if treated==1 & wage_group==2, statistics(n mean sem)
tabstat fte_pre if treated==1 & wage_group==3, statistics(n mean sem)

display "===== Row2: FTE employment after, all available obs (closed=0, only wave1 stores)"
tabstat fte_post if treated==1 & wage_group==1, statistics(n mean sem)
tabstat fte_post if treated==1 & wage_group==2, statistics(n mean sem)
tabstat fte_post if treated==1 & wage_group==3, statistics(n mean sem)
.
display "===== Row3 delta_all (individual delta, paper definition)"
gen delta_all = fte_post - fte_pre
tabstat delta_all if treated==1 & wage_group==1 & wave1_exist==1, statistics(n mean sem)
tabstat delta_all if treated==1 & wage_group==2 & wave1_exist==1, statistics(n mean sem)
tabstat delta_all if treated==1 & wage_group==3 & wave1_exist==1, statistics(n mean sem)

display "===== Row4: Change in mean FTE, balanced sample ====="
tabstat delta_fte if treated==1 & balanced_row4==1 & wage_group==1, statistics(n mean sem)
tabstat delta_fte if treated==1 & balanced_row4==1 & wage_group==2, statistics(n mean sem)
tabstat delta_fte if treated==1 & balanced_row4==1 & wage_group==3, statistics(n mean sem)

display "===== Row5: Change in mean FTE, temp closed set to 0 ====="
tabstat delta_fte_adj if treated==1 & balanced_row5==1 & wage_group==1, statistics(n mean sem)
tabstat delta_fte_adj if treated==1 & balanced_row5==1 & wage_group==2, statistics(n mean sem)
tabstat delta_fte_adj if treated==1 & balanced_row5==1 & wage_group==3, statistics(n mean sem)


*=============================================
* Card & Krueger 1994 -- Table 4 Replication
* Dependent variable: change in FTE employment (delta_fte)
*=============================================

* load dataset
use "cardkrueger.dta", clear

* generate full‑time equivalent employment for wave1 and wave2
gen fte = empft + emppt/2 + nmgrs
gen fte2 = empft2 + emppt2/2 + nmgrs2

* compute change of FTE: wave2 minus wave1
gen delta_fte = fte2 - fte

* New Jersey dummy: 1 = NJ, 0 = PA
gen nj_dummy = (state == 1)

* create wage_gap: proportional wage increase needed to reach $5.05
gen wage_gap = 0
replace wage_gap = (5.05 - wage_st)/wage_st if state == 1 & wage_st < 5.05

* create chain dummies and company‑owned dummy
gen bk = (chain == 1)
gen kfc = (chain == 2)
gen roys = (chain == 3)
gen co_owned = (own == 2)

*------------------------------------------------
* Note: original paper sample is sample==1 (N=357)
* If you want original paper sample, uncomment line below
* keep if sample == 1
*------------------------------------------------

eststo clear

* Model (i): only NJ dummy
reg delta_fte nj_dummy
eststo m1

* Model (ii): NJ dummy + chain + ownership controls
reg delta_fte nj_dummy bk kfc roys co_owned
eststo m2

* Model (iii): only wage_gap
reg delta_fte wage_gap
eststo m3

* Model (iv): wage_gap + chain + ownership controls
reg delta_fte wage_gap bk kfc roys co_owned
eststo m4

* Model (v): wage_gap + chain+ownership + region dummies
* southj, centralj, pa1, pa2 are native dataset variables
reg delta_fte wage_gap bk kfc roys co_owned southj centralj pa1 pa2
eststo m5

* export regression table (keep main coefficients only)
esttab m1 m2 m3 m4 m5, se nodepvars nomtitle nonumber keep(nj_dummy wage_gap)

*================================================
* F test for joint significance of control variables
*================================================

* F test for controls in model (ii): bk kfc roys co_owned
reg delta_fte nj_dummy bk kfc roys co_owned
test bk kfc roys co_owned

* F test for controls in model (iv): bk kfc roys co_owned
reg delta_fte wage_gap bk kfc roys co_owned
test bk kfc roys co_owned

* F test for all controls in model (v): chain+ownership+region dummies
reg delta_fte wage_gap bk kfc roys co_owned southj centralj pa1 pa2
test bk kfc roys co_owned southj centralj pa1 pa2



*====================================================================
* INDEPENDENT EXTENSION: HETEROGENEITY BY FAST‑FOOD CHAIN BRAND
* Original paper only uses chain as control, NO subsample regressions.
* We run separate regressions for each chain: BK / KFC / ROYS / WENDY's
* Each subsample: keep ownership & region controls; drop chain dummies.
*====================================================================
eststo clear
* -------- Subsample 1: Burger King (chain == 1) --------
reg delta_fte nj_dummy co_owned southj centralj pa1 pa2 if chain == 1
eststo het_bk_nj
reg delta_fte wage_gap co_owned southj centralj pa1 pa2 if chain == 1
eststo het_bk_gap
* -------- Subsample 2: KFC (chain == 2) --------
reg delta_fte nj_dummy co_owned southj centralj pa1 pa2 if chain == 2
eststo het_kfc_nj
reg delta_fte wage_gap co_owned southj centralj pa1 pa2 if chain == 2
eststo het_kfc_gap
* -------- Subsample 3: Roy Rogers (chain == 3) --------
reg delta_fte nj_dummy co_owned southj centralj pa1 pa2 if chain == 3
eststo het_roys_nj
reg delta_fte wage_gap co_owned southj centralj pa1 pa2 if chain == 3
eststo het_roys_gap
* -------- Subsample 4: Wendy's (chain == 4) --------
reg delta_fte nj_dummy co_owned southj centralj pa1 pa2 if chain == 4
eststo het_wendys_nj
reg delta_fte wage_gap co_owned southj centralj pa1 pa2 if chain == 4
eststo het_wendys_gap
* Export heterogeneity table 1: NJ‑dummy results across four chains
esttab het_bk_nj het_kfc_nj het_roys_nj het_wendys_nj , se nodepvars nomtitle nonumber keep(nj_dummy) title("Heterogeneity: New Jersey dummy by fast‑food chain")
* Export heterogeneity table 2: wage_gap results across four chains
esttab het_bk_gap het_kfc_gap het_roys_gap het_wendys_gap , se nodepvars nomtitle nonumber keep(wage_gap) title("Heterogeneity: wage_gap coefficient by fast‑food chain")