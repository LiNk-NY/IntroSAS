
*Exercise 1, Session 1

- Download the "classds" data set from Blackboard and save it to your jump drive.

- Run the libname statement below.

- Write a proc contents for the classone.classds data set.  (See slide 23 for the proc contents template.)

- Use the proc contents output to answer the following questions:

-	How many observations are in the data set? 3000
-	How many variables are in the data set? 14
-	On what date was the data set created? 07/19/2012
-	Is race a character or numeric variable? Numeric


Bring the permanent classds data set with you to the next class.
;
/* modify to your file path */
LIBNAME classone 'C:\Users\User\Documents\';

PROC CONTENTS data = classone.classds; 
RUN; 


/* Optional */
DATA work.temp; 
SET classone.classds;
RUN; 

PROC CONTENTS data = temp; 
RUN; 

