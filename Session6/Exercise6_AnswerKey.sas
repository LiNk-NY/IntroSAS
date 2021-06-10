LIBNAME ref 'E:/SAS/';  
FILENAME formatin 'E:/SAS/formatstatements_chs2011_public.sas';
%include          'E:/SAS/formats_chs2011_public.sas';

DATA work.chs11;
  SET ref.chs2011_public;
RUN;

PROC CONTENTS data = chs11; 
RUN; 

ODS HTML PATH="E:\SAS\"
    FILE = "Exercise6Table.xls";

PROC TABULATE DATA = chs11 format=8.1; 
  CLASS usborn agegroup sex; 
  VAR bmi; 
  TABLES usborn='Nativity - ', agegroup='', bmi*(sex='' all='Overall')*mean='' /box = 'Agegroup' ; 
RUN; 

ODS HTML CLOSE; 

