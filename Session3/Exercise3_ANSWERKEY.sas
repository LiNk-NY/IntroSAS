LIBNAME duck "E:/SAS/Data"; 
RUN;

DATA work.mydata; 
SET duck.classds; 
RUN; 

title1 "SAS Exercise 3 Marcel Ramos";
title2 "Introduction to SAS"
footnote1 "Used with permission"; 

PROC PRINT data = work.mydata label noobs n;
VAR age fakedob race gender condition; 
ID uniqueid; 
RUN; 

title2 ; 
footnote1 ;

