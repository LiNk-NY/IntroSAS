LIBNAME duck "E:/SAS/"; 
RUN; 

DATA work.females; 
SET duck.classds; 
WHERE gender = 2; 
newID = catx (' . ', pob, uniqueid);
newID2 = compress(newID); 
RUN; 

PROC PRINT DATA = females (obs = 10); 
VAR newID2; 
RUN; 

PROC SORT DATA = females; 
BY condition; 
RUN; 

PROC MEANS DATA = females n min max range mean stddev missing maxdec=3; 
VAR age; 
BY condition; 
RUN; 

