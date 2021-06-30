*Code for Exercise 4;

LIBNAME ref "C:\Users\User\Desktop\SAS\";

*make a new temporary data set that is limited to males;
DATA work.males;
SET ref.classds;
WHERE gender =1;
RUN;

*check contents of new data set;
PROC CONTENTS DATA = work.males;
RUN;

title1 "Results Table Marcel Ramos";

*create formats for race and borough;
PROC FORMAT;

VALUE frace
  1= '1 = Hispanic'
  2= '2 = white'
  3= '3 = black'
  4= '4 = Asian'
  5= '5 = other'
  99= '99 = unknown'
;

VALUE fborough
  1 = '1 = Bronx'
  2= '2 = Brooklyn'
  3= '3 = Manhattan'
  4= '4 = Queens'
  5= '5 = Staten Island'
  99= '99 = unknown'
;
RUN;

*Send output to Excel via ODS;
ODS HTML file= 'C:\Users\User\Desktop\SAS\Exercises\mytable.xls'; *change path to be where you want Excel file to show up;

ODS no results; *suppress "results" text in Excel;

PROC FREQ DATA = work.males;
TABLES race * borough;
FORMAT race frace. borough fborough.;
RUN;

ODS HTML close;

*Reopen SAS ODS; 
ODS HTML; 


