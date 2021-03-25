/********************************************/
/*											*/
/*				MENAGE ET RICHESSE			*/
/********************************************/											

/* rappel des macrovariables, repertoires, formats et pieds de page */
%let pathAmaleUniv = C:\Users\n17017415\Desktop\Ter\codes;
%let pathAmalePerso = /folders/myfolders/TER;
libname ter "&pathAmaleUniv";
options fmtsearch = (ter);
footnote "Données provenant de MDHS 2008-09";


	/*i. Tris à plats */
ods pdf file = "C:\Users\n17017415\Desktop\Ter\sorties\regions.pdf";
/*region et lieu de résidence*/
title "Répartition des ménages en fonction du lieu de résidence";
proc freq data = ter.menage;
table chv024 chv025;
format chv024 $hv024a. chv025 $hv025a.;
run; title;

proc sort data = ter.menage;

title "Répartition des ménages malgache dans les régions";
proc sgplot data = ter.menage;
vbar chv024 /  barwidth = .1;
format chv024 $hv024a.;
run; title;
ods pdf close;

         /*ii. Tris croisés */
/* Test du khi deux */

data menage2;
set ter.menage;
if chv206  = . then delete;
if chv201  = . then delete;
run;

/* Accès à l'eau, média, electricité, moyen de locomotion en fonction des régions */
title "Analyse des biens du foyer en fonction de la région ";
proc freq data = menage2;
table cHV024*chv229 / EXPECTED CHISQ ;
table cHV024*chv230 / EXPECTED CHISQ DEVIATION CELLCHI2 ;
table cHV024*chv206 / EXPECTED CHISQ DEVIATION CELLCHI2 ;
table cHV024*chv201 / EXPECTED CHISQ DEVIATION CELLCHI2 ;
format  cHV229 $hv229a. chv206 $binaire. chv201 $hv201a. chv024 $hv024a.  ;
run; title;

/* Caractéristique du ménage en fonction des régions*/
title "Analyse du caractéristique des ménages en fonction de la région";
proc freq data = menage2;
table cHV024*chv219 /  CHISQ ;
format chv024 $hv024a. chv219 $hv219a.;
run; title;

	/*iii. CREATION DE L'INDICE DE RICHESSE A L'AIDE D'UNE ACM */
/* table temporaire menage1 avec les formats adaptes a l'acm et sans les données manquantes */
/* Peu de données manquantes pour chacune des variables, on peut donc les supprimer */
data menageACM; set ter.menage;
keep hhid chv201 chv205 chv024 chv213 chv226 chv206-chv209 chv219 chv221 chv227 chv247 chv243a chv243b chv243c chv243d chv229 chv230;
if chv201 = . or chv201 = 96 then delete;
if chv205 = . then delete;
if chv206 = . then delete;
if chv207 = . then delete;
if chv208 = . then delete;
if chv209 = . then delete;
if chv213 = . or chv213 = 96 then delete;
if chv221 = . then delete;
if chv226 = . or chv226 = 95 or chv226 = 96 then delete;
if chv227 = . then delete;
if chv247 = . then delete;
if chv243a = . then delete; if chv243b = . then delete; if chv243c = . then delete; if chv243d = . then delete;
run;

title "Tableaux statistiques sur les variables recodees utilisees pour l'ACM";
proc freq data = menageACM(drop hhid);
format
chv201 $hv201acm.	chv205 $hv205acm.	chv206 $hv206acm.	chv207 $hv207acm.	chv208 $hv208acm.	chv209 $hv209acm.	chv213 $hv213acm.	chv219 $hv219acm. chv221 $hv221acm.	
chv226 $hv226acm.	chv227 $hv227acm.	chv247 $hv247acm.	chv243a $hv243aacm. chv243b $hv243bacm. chv243c $hv243cacm. chv243d $hv243dacm.	chv229 $hv229acm.	chv230 $hv230acm.;
run;

/* Table de burt */
proc corresp data =	menageACM mca out = resul all cellchi2 benzecri;
table chv201 chv205 chv213 chv226 chv206-chv209 chv219 chv221 chv227 chv247 chv243a chv243b chv243c chv243d chv229 chv230;
format
chv201 $hv201acm.	chv205 $hv205acm.	chv206 $hv206acm.	chv207 $hv207acm.	chv208 $hv208acm.	chv209 $hv209acm.	chv213 $hv213acm.	chv219 $hv219acm. chv221 $hv221acm.	
chv226 $hv226acm.	chv227 $hv227acm.	chv247 $hv247acm.	chv243a $hv243aacm. chv243b $hv243bacm. chv243c $hv243cacm. chv243d $hv243dacm.	chv229 $hv229acm.	chv230 $hv230acm.;
title "ACM sur les equipements des menages à Madagascar a partir de la table de Burt";	
run;

/* Tableau disjonctif complet */
proc corresp data = menageACM out = resul noprint dim = 1 profile = column;
table hhid, chv201 chv205 chv213 chv226 chv206-chv209 chv219 chv221 chv227 chv247 chv243a chv243b chv243c chv243d chv229 chv230;
format
chv201 $hv201acm.	chv205 $hv205acm.	chv206 $hv206acm.	chv207 $hv207acm.	chv208 $hv208acm.	chv209 $hv209acm.	chv213 $hv213acm.	chv219 $hv219acm. chv221 $hv221acm.	
chv226 $hv226acm.	chv227 $hv227acm.	chv247 $hv247acm.	chv243a $hv243aacm. chv243b $hv243bacm. chv243c $hv243cacm. chv243d $hv243dacm.	chv229 $hv229acm.	chv230 $hv230acm.;
title "ACM sur les equipements des menages à Madagascar a partir du tableau disjonctif complet";	
run;

/* Fusion des tables afin de rajouter la variable indicateur de richesse */
data ter.menageACMfin; set menageACM ;set resul(keep = dim1 firstobs = 2); rename dim1 = rindex; run; 


/* Normalisation de l'indice de richesse */
proc means data = ter.menageACMfin; 
var rindex; run;

data ter.menageACMfin; set ter.menageACMfin; 
rindex = rindex + 1.0405436 ;
run;

data ter.menageACMfin; set ter.menageACMfin;
rindex = rindex/(4.0476657+1.0405436);
run;

proc means data = ter.menageACMfin; 
var rindex;
run;

/* Histogramme indice de richesse */
proc sgplot data = ter.menageACMfin;
histogram rindex ;
run;


/* Création d'une nouvelle table associant l'index de richesse moyen en fonction des régions */
proc tabulate data = ter.menageACMfin out = ter.regionrichesse;
class chv024;
var rindex;
table chv024, (rindex * mean);
run;

title "Classification ascendante hiérarchique des counties, méthode = ward";
proc cluster data = ter.regionrichesse method = ward outtree = tree
pseudo rsquare simple standard;
var rindex_mean;
id chv024;
run;

