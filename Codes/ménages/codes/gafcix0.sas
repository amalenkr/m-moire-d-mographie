%macro gafcix0(ident= , x=, y=, nc=, tp=);

%*    Graphique simultanee variables--individus;
%*    Representation des individus par des points;
%*    x : numero axe horizontal;
%*    y : numero axe vertical;
%*   nc : nombre max de caracteres;

data	anno;
set 	resul;
retain 	xsys	ysys	'2';
length color $6.;
y = dim&y;	x = dim&x;
coul = substr(&ident, 1, 1) ;
text = substr(&ident, 1, &nc);
size = 1;
select;
	when(coul in('C')) color = 'red';
	when(coul in('E')) color = 'cream';
	when(coul in('F')) color = 'cyan';
	when(coul in('L')) color = 'maroon';
	when(coul in('M')) color = 'olive';
	when(coul in('R')) color = 'pink';
	when(coul in('P')) color = 'purple';
	when(coul in('S')) color = 'blue';
	when(coul in('T')) color = 'steel';
	when(coul in('V')) color = 'black';
/*	when(coul in('0')) do; 
		color = 'red';
		text = '.';
		size = &tp;
	end;*/
	otherwise do; 
		color = 'black';
		text = '.'; 
		size = &tp;
	end;
end;
label	y = "Axe &y"
		x = "Axe &x";
keep x y text xsys ysys size color;

proc sgplot data = anno noautolegend;
title;
scatter y = y x = x / markerchar = text group=color;
options spool;
/*frame  href=0 vref=0 haxis=axis1 vaxis=axis2 ;*/
run;

quit;	%mend;
