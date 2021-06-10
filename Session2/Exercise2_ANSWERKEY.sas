LIBNAME duck 'E:/SAS/Data'; 

* optional ; 
PROC PRINT data = duck.classds (obs = 10); 
VAR race gender age borough;
RUN;

/* In one data step */
DATA work.males; 
SET duck.classds (keep = gender race age borough); 

if race = 1 then ethnicity = 'hispanic';
else if race = 2 then ethnicity = 'white' ;
else if race = 3 then ethnicity = 'black' ; 
else if race = 4 then ethnicity = 'asian'; 
else if race = 5 then ethnicity = 'other';
else if race = 99 then ethnicity = 'unknown'; 

WHERE gender = 1; 	
RUN; 

PROC CONTENTS data = males;
RUN; 

DATA duck.males; 
SET work.males; 
RUN; 

