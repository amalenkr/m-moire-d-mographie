/********************************************/
/*								
*/
/*				TRIS A PLAT					*/
/********************************************/											

/* rappel des macrovariables, repertoires, formats et pieds de page */
%let pathAmaleUniv = C:\Users\n17017415\Desktop\Ter;
%let pathAmalePerso = /folders/myfolders/TER;
libname ter "&pathAmaleUniv";
options fmtsearch = (ter);
footnote "Données provenant de MDHS 2008-09";


	/*i. Ensemble variables */

/*creation d'une table temporaire sans les id et les poids*/ 
data menagetempo; set ter.menage;
drop hhid hv005;
run;

proc freq data = menagetempo;
format 
	hv220 hv220a. 
	hv238 hv238a. 
	hv245 hv245a. 
	hv246A hv246a. 
	chv024 $hv024a. 
	chv025 $hv025a. 
	chv201 $hv201a. 
	chv202 $hv201a. 
	chv205 $hv205a. 
	chv206--chv212 chv221 chv227 chv246 chv247 chv243a chv243b chv243c chv243d $binaire. 
	chv213 $hv213a. 
	chv214 $hv214a. 
	chv215 $hv215a. 
	chv217 $hv217a.
	chv219 $hv219a. 
	chv226 $hv226a. 
	chv235 $hv235a. 
	chv236 $hv236a. 
	chv239 $hv239a.
	chv240 $hv240a. 
	chv241 $hv241a.
	chv109 $hv109a. 
	chb68 cha68 $hb68a. 
	chv106 chc61 $hv106a.;
run;

proc freq data = projet.menage;
table chv219 / binomial;
format chv219 $hv219a.;
run;
