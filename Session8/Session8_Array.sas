
/*Session 8: ARRAY EXAMPLE*/

/*Call in CHS 2011 data set*/
/*enter in the pathway where dataset and format programs are stored*/
/* These can be downloaded from the NYC.GOV website */
libname ref 'E:\Windows\Documents\GitHub\IntroSAS\datasets';
filename formatin 'E:\Windows\Documents\GitHub\IntroSAS\datasets\formatstatements_chs2011_public.sas';
%include          'E:\Windows\Documents\GitHub\IntroSAS\datasets\formats_chs2011_public.sas';

*Create new temporary data set from permanent data set;
data chs11;
set ref.chs2011_public;
run;

/*Check variables mood27, mood28, mood29, mood30, mood31, and mood32*/
proc freq data = chs11;
tables mood27 mood28 mood29 mood30 mood31 mood32;
run;

/*Say we want to re-code variables mood27, mood28, mood29, mood30, mood31, and mood32 to be:*/
/*1 = Most or all of the time*/
/*2 = Some of the time or a little of the time*/
/*3 = none of the time*/
/**/
/*Option 1: Re-code each variable separately*/

data new;
set chs11;

if mood27 in (1,2) then newmood27 = 1;
if mood27 in (3,4) then newmood27 =2;
if mood27 =5 then newmood27 =3;
if missing (mood27) then newmood27 =.;

if mood28 in (1,2) then newmood28 =1;
if mood28 in (3,4) then newmood28 =2;
if mood28 =5 then newmood28 =3;
if missing (mood28) then newmood28 =.;
/*ETC.*/


/*Option 2: Use arrays to re-code variables:*/

data new;
set chs11;

array moods (6) mood27 mood28 mood29 mood30 mood31 mood32;  *array of variables from our dataset to be re-coded;
array newmoods (6) newmood27 newmood28 newmood29 newmood30 newmood31 newmood32;  *array with names for new re-coded variables;

do i = 1 to 6;
	if moods(i) in (1,2) then newmoods(i) =1;
	if moods(i) in (3,4) then newmoods(i) =2;
	if moods(i) =5 then newmoods(i) =3;
	if moods(i) =. then newmoods(i) =.;
	end;
* format newmood27 newmood28 newmood29 newmood30 newmood31 newmood32 moodsf.; 
run;
/*The "do loop" (do i = ) allows us to tell SAS what to do to the arrayed variables.*/


*check new re-coded variables;
proc freq data =new;
tables newmood27 newmood28 newmood29 newmood30 newmood31 newmood32;
run;

/*Success!  Saved us time and lots of lines of code.*/
