/* Test program to append only the odd datasets(d1,d3,d5,etc..) from the list of N number of datasets(d1 to d5)  */
data d1;
a=1;
b=2;
run;
data d2;
a=3;
b=4;
run;
data d3;
a=5;
b=6;
run;
data d4;
a=7;
b=8;
run;
data d5;
a=9;
b=10;
run;

options mlogic symbolgen mprint;
%macro append(n);

data append_all;
set
%do i = 1 %to &n;
%if %sysfunc(mod(&i,2))=1 %then %do;
d&i
%end;
%end;
;
run;

proc print data=append_all;
run;

%mend;
%append(4)
