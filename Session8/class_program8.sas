/*Session 8 */
/*Class Program*/

%macro demographics (vars = ); 

proc freq data = chs11; 
tables &vars * (sex agegroup borough newrace); 
weight wt12_dual; 
run; 

%mend demographics; 

%demographics(vars = drinker); 
%demographics(vars = heavydrink11); 

proc contents data = chs11; run; 

proc univariate data = chs11; 
var bmi; run; 

proc freq data = chs11 nlevels ; 
table agegroup; 
run; 

proc print data = chs11 (obs = 10);
var agegroup; 
run; 

/*Add dummy variables to get a */
/*coefficient for each category*/
data newdata; 
set chs11; 
if agegroup = 2 then age2544 = 1; 
else if agegroup = . then age2544 = .; 
else age2544 = 0; 
if agegroup = 3 then age4564 = 1; 
else if agegroup = . then age4564 = .; 
else age4564 = 0; 
if agegroup = 4 then age65 = 1; 
else if agegroup = . then age65 = .; 
else age65  = 0; 
run; 

/*Check the categories*/
proc freq data = newdata ; 
table age2544 age4564 age65; 
run; 

/*Run regression with dummy variables*/
proc reg data = newdata; 
model bmi = age2544 age4564 age65; 
run; 

/*Setting reference categories in logistic regression*/
proc logistic data = newdata; 
class agegroup (ref = "18 - 24"); 
model sex (ref = "Female") = agegroup; 
run; 

proc logistic data = newdata; 
class agegroup (ref = "18 - 24"); 
model sex (ref = FIRST) = agegroup; 
run; 
