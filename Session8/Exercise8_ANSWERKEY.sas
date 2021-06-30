/* Exercise 8 */

LIBNAME ref "E:\Windows\Documents\GitHub\IntroSAS\datasets";  
FILENAME formatin "E:\Windows\Documents\GitHub\IntroSAS\datasets\formatstatements_chs2011_public.sas";
%include          "E:\Windows\Documents\GitHub\IntroSAS\datasets\formats_chs2011_public.sas";
RUN;

DATA chs11;
SET ref.chs2011_public;
RUN;

PROC FREQ DATA= chs11; 
TABLE mhincontactfriends11 /missing; 
RUN; 

DATA new; 
SET chs11; 
ARRAY mhfriends (3) mhincontactfriends11 mhtalktofriends11 mhhelpfromfriends11; 
ARRAY newmhfriends (3) newcontactfriends11 newtalkfriends11 newhelpfriends11; 

DO i = 1 to 3; 
	if 0 <= mhfriends(i) <= 2 then newmhfriends(i) = 1; 
	if mhfriends(i) >= 3 then newmhfriends(i) = 2; 
	if mhfriends(i) = .d then newmhfriends(i) = 3;
	if mhfriends(i) = .r then newmhfriends(i) = 4; 
END; 
RUN;


PROC FORMAT;
VALUE ffriends
  1 = 'Less than 3'
  2 = 'Three or More'
  3 = 'Dont Know'
  4 = 'Refused'
; 

PROC FREQ DATA = new ; 
TABLE newcontactfriends11 newtalkfriends11 newhelpfriends11; 
FORMAT newcontactfriends11 newtalkfriends11 newhelpfriends11 ffriends.;
RUN; 

%macro frequencies (var = ); 

PROC FREQ DATA = new; 
TABLES &var*(agegroup sex borough newrace);
RUN; 

%mend frequencies; 

%frequencies(var = generalhealth); 
%frequencies(var = smoker); 
%frequencies(var = drinker); 


