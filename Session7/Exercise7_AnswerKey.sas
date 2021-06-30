LIBNAME ref "E:\Windows\Documents\GitHub\IntroSAS\datasets"; run; 

PROC CONTENTS DATA = ref.classds; 
RUN; 

DATA new1;
SET ref.classds (keep = uniqueid age borough location pob 
uhf zip boro_char); 
RUN; 

PROC CONTENTS DATA = new1; 
RUN; 

DATA new2; 
SET ref.classds (keep = uniqueid condition dob_char fakedob 
gender race surveydate);
RUN; 

PROC SORT DATA = new1 nodups; 
BY uniqueid; 
RUN;

PROC SORT DATA = new2 nodup; 
BY uniqueid; 
RUN; 

DATA mynewdata; 
MERGE new1 new2; 
BY uniqueid; 
RUN;

PROC PRINT DATA = mynewdata (obs = 10); 
RUN; 

PROC CONTENTS DATA = mynewdata; 
RUN; 
