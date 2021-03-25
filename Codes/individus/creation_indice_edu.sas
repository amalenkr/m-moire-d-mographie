libname ter "\\salsa.univ-amu.fr\dfs\ProfilsEtud\b17026985\Mes documents\TER\data";

/*************************/
/* Travail sur les poids */
/*************************/

/* Afin de s'assurer que nos études soient représentatives de la situation à Madagascar, nous utiliserons les poids, donnés dans la table.
Pour chaque ménage interrogé, un sur deux est sélectionné afin d'avoir à répondre au questionnaire long pour la femme plus le questionnaire
homme. Ce tirage étant aléatoire du premier (le ménage a été sélectionné) nous pouvons mulitplier le poids de chaque homme par deux afin de 
s'assurer une représentativité en terme de sexe */

proc means data=ter.individus sum;
var v005;
run;

data ter.individus;
set ter.individus;
if cv000 = 1 then v005 = 2*v005;
run;

proc means data=ter.individus sum;
var v005;
run;

/* Lorsqu'on utilise la pondération pour la PROC FREQ, il faut que la somme des poids soit égale au nombre d'individus de l'échantillon. Il faut 
bien diviser chaque poids par la somme des poids mais en le multipliant par l'effectif de l'échantillon pour qu'au final la taille de l'échantillon 
soit inchangée sans et avec pondération. */

data ter.individus;
set ter.indvidus;
retain cumpoids 0;
cumpoids=cumpoids+v005;
call symputx("totpoids",cumpoids);
call symputx("Nobs",_N_);
run;

data ter.individus;
set ter.individus;
poids=&Nobs*v005/&totpoids;
run;

proc means data=ter.individus sum;
var v005;
run;

proc freq data=ter.individus;
table cv106*cv000 / chisq cellchi2 expected;
format cv106 $cv106a. cv000 $cv000a.;
weight poids;
run;

/* Ca fonctionne. On utilisera dans la suite de l'analyse la variable poids */

/**********************/
/* Analyses bivariées */
/**********************/

proc contents data=ter.individus;
run;

options fmtsearch=(ter);

/* Intéressons nous aux variables liées à l'éducation, entendue au sens large */

/**************************/
/* Variables qualitatives */
/**************************/

ods pdf file="C:\Users\guill\Documents\TER Madagascar\TER Madagascar\Codes\individus\bivariees_educ_sexe";

footnote "Données provenant de MDHS 2008-2009";
title "Analyses Bivariées";

/* cv106 (plus haut niveau d'éducation) */

proc freq data=ter.individus;
table cv106*cv000 / expected deviation cellchi2 chisq;
format cv106 $cv106a. cv000 $cv000a.;
weight poids;
run;

/* Pas de données manquantes, 4 modalités difficilement réductibles sans pertes d'informations pertinentes, à conserver */

/* -cv149 (niveau d'éducation atteint) */

proc freq data=ter.individus;
table cv149*cv000 / expected deviation cellchi2 chisq;
format cv149 $cv149a. cv000 $cv000a.;
weight poids;
run;

/* Variable assez similaire à la première, mais avec plus d'informations (complète ou non). Possibilité de l'enlever */

/* -cv155 (alphabétisation) */

proc freq data=ter.individus;
table cv155*cv000 / expected deviation cellchi2 chisq;
format cv155 $cv155a. cv000 $cv000a.;
weight poids;
run;

/* -cv156 (a déjà partcipé à un programme d'alphabétisation en dehors du primaire) */

proc freq data=ter.individus;
table cv156*cv000 / expected deviation cellchi2 chisq;
format cv156 $cv156a. cv000 $cv000a.;
weight poids;
 run;

/* cv157 (fréquence de lecture de journaux ou magazines) */

proc freq data=ter.individus;
table cv157*cv000 / expected deviation cellchi2 chisq;
format cv157 $cv157a. cv000 $cv000a.;
weight poids;
run;

/* cv158 (fréquence d'écoute de la radio) */

proc freq data=ter.individus;
table cv158*cv000 / expected deviation cellchi2 chisq;
format cv158 $cv158a. cv000 $cv000a.;
weight poids;
run;

/* cv159 (fréquence de visionnage de la télévision) */

proc freq data=ter.individus;
table cv159*cv000 / expected deviation cellchi2 chisq;
format cv159 $cv159a. cv000 $cv000a.;
weight poids;
run;

/* cv301 (connaissance de n'importe quelle méthode) */

proc freq data=ter.individus;
table cv301*cv000 / expected deviation cellchi2 chisq;
format cv301 $cv301a. cv000 $cv000a.;
weight poids;
run;

/* -cv750 (a entendu parler des MST) */

proc freq data=ter.individus;
table cv750*cv000 / expected deviation cellchi2 chisq;
format cv750 $cv750a. cv000 $cv000a.;
weight poids;
run;

/* -cv751 (a entendu parler du SIDA) */

proc freq data=ter.individus;
table cv751*cv000 / expected deviation cellchi2 chisq;
format cv751 $cv751a. cv000 $cv000a.;
weight poids;
run;

/* -cv756 (est-ce qu'une personne en bonne santé peut avoir le SIDA) */

proc freq data=ter.individus;
table cv756*cv000 / expected deviation cellchi2 chisq;
format cv756 $cv756a. cv000 $cv000a.;
weight poids;
run;

/* -cv785 (a entendu parler d'autres MST) */

proc freq data=ter.individus;
table cv785*cv000 / expected deviation cellchi2 chisq;
format cv785 $cv785a. cv000 $cv000a.;
weight poids;
run;

/* -cv823 (il est possible d'être infecté par le SIDA par magie ou moyens supernaturels) */

proc freq data=ter.individus;
table cv823*cv000 / expected deviation cellchi2 chisq;
format cv823 $cv823a. cv000 $cv000a.;
weight poids;
run;

/* -cv824 (médications pour éviter la transmission du SIDA au bébé durant la grossesse) */

proc freq data=ter.individus;
table cv824*cv000 / expected deviation cellchi2 chisq;
format cv824 $cv824a. cv000 $cv000a.;
weight poids;
run;

/* -cv384a (a entendu parler du PF à la radio les derniers mois) */

proc freq data=ter.individus;
table cv384a*cv000 / expected deviation cellchi2 chisq;
format cv384a $cv384a. cv000 $cv000a.;
weight poids;
run;

/* -cv384b (a entendu parler du PF à la télévision) */

proc freq data=ter.individus;
table cv384b*cv000 / expected deviation cellchi2 chisq;
format cv384b $cv384b. cv000 $cv000a.;
weight poids;
run;

/* -cv384c (a entendu parler du PF dans les journaux) */

proc freq data=ter.individus;
table cv384c*cv000 / expected deviation cellchi2 chisq;
format cv384c $cv384c. cv000 $cv000a.;
weight poids;
run;

/* Variables uniquement hommes : cv3b25b cv747a cv747b */

/* cv747a (la procréation est une affaire de femme) */

proc freq data=ter.individus;
by cv000;
table cv747a / expected deviation cellchi2 chisq;
format cv747a $cv747a.;
weight poids;
run;

/* cv747b (important pour la santé de la mère/de l'enfant d'avoir une aide lors de l'accouchement) */

proc freq data=ter.individus;
by cv000;
table cv747b / expected deviation cellchi2 chisq;
format cv747b $cv747b.;
weight poids;
run;

/* -cv3b25b (les femmes qui se protègent développent des moeurs légères) */

proc freq data=ter.individus;
by cv000;
table cv3b25b / expected deviation cellchi2 chisq;
format cv3b25b $cv3b25b.;
weight poids;
run;

/* Variables uniquement femmes : cv701 cv729 */

/* cv701 (niveau d'éducation du partenaire) */

proc freq data=ter.individus;
by cv000;
table cv701 / expected deviation cellchi2 chisq;
format cv701 $cv701a.;
weight poids;
run;

/* cv729 (niveau d'éducation du partenaire) (attainment) */

proc freq data=ter.individus;
by cv000;
table cv729 / expected deviation cellchi2 chisq;
format cv729 $cv729a.;
weight poids;
run;

ods pdf close;

/* Croisons maintenant par région */

ods pdf file="C:\Users\guill\Documents\TER Madagascar\TER Madagascar\Codes\individus\bivariees_educ_region";

footnote "Données provenant de MDHS 2008-2009";
title "Analyses Bivariées";

/* cv106 (plus haut niveau d'éducation) */

proc freq data=ter.individus;
table cv106*cv101 / expected deviation cellchi2 chisq;
format cv106 $cv106a. cv101 $cv101a.;
weight poids;
run;

/* -cv149 (niveau d'éducation atteint) */

proc freq data=ter.individus;
table cv149*cv101 / expected deviation cellchi2 chisq;
format cv149 $cv149a. cv101 $cv101a.;
weight poids;
run;

/* -cv155 (alphabétisation) */

proc freq data=ter.individus;
table cv155*cv101 / expected deviation cellchi2 chisq;
format cv155 $cv155a. cv101 $cv101a.;
weight poids;
run;

/* -cv156 (a déjà partcipé à un programme d'alphabétisation en dehors du primaire) */

proc freq data=ter.individus;
table cv156*cv101 / expected deviation cellchi2 chisq;
format cv156 $cv156a. cv101 $cv101a.;
weight poids;
run;

/* cv157 (fréquence de lecture de journaux ou magazines) */

proc freq data=ter.individus;
table cv157*cv101 / expected deviation cellchi2 chisq;
format cv157 $cv157a. cv101 $cv101a.;
weight poids;
run;

/* cv158 (fréquence d'écoute de la radio) */

proc freq data=ter.individus;
table cv158*cv101 / expected deviation cellchi2 chisq;
format cv158 $cv158a. cv101 $cv101a.;
weight poids;
run;

/* cv159 (fréquence de visionnage de la télévision) */

proc freq data=ter.individus;
table cv159*cv101 / expected deviation cellchi2 chisq;
format cv159 $cv159a. cv101 $cv101a.;
weight poids;
run;

/* cv301 (connaissance de n'importe quelle méthode) */

proc freq data=ter.individus;
table cv301*cv101 / expected deviation cellchi2 chisq;
format cv301 $cv301a. cv101 $cv101a.;
weight poids;
run;

/* cv701 (niveau d'éducation du partenaire) */

proc freq data=ter.individus;
table cv701*cv101 / expected deviation cellchi2 chisq;
format cv701 $cv701a. cv101 $cv101a.;
weight poids;
run;

/* cv729 (niveau d'éducation du partenaire) */

proc freq data=ter.individus;
table cv729*cv101 / expected deviation cellchi2 chisq;
format cv729 $cv729a. cv101 $cv101a.;
weight poids;
run;

/* -cv750 (a entendu parler des MST) */

proc freq data=ter.individus;
table cv750*cv101 / expected deviation cellchi2 chisq;
format cv750 $cv750a. cv101 $cv101a.;
weight poids;
run;

/* -cv751 (a entendu parler du SIDA) */

proc freq data=ter.individus;
table cv751*cv101 / expected deviation cellchi2 chisq;
format cv751 $cv751a. cv101 $cv101a.;
weight poids;
run;

/* -cv756 (est-ce qu'une personne en bonne santé peut avoir le SIDA) */

proc freq data=ter.individus;
table cv756*cv101 / expected deviation cellchi2 chisq;
format cv756 $cv756a. cv101 $cv101a.;
weight poids;
run;

/* -cv785 (a entendu parler d'autres MST) */

proc freq data=ter.individus;
table cv785*cv101 / expected deviation cellchi2 chisq;
format cv785 $cv785a. cv101 $cv101a.;
weight poids;
run;

/* -cv823 (il est possible d'être infecté par le SIDA par magie ou moyens supernaturels) */

proc freq data=ter.individus;
table cv823*cv101 / expected deviation cellchi2 chisq;
format cv823 $cv823a. cv101 $cv101a.;
weight poids;
run;

/* -cv824 (médications pour éviter la transmission du SIDA au bébé durant la grossesse) */

proc freq data=ter.individus;
table cv824*cv101 / expected deviation cellchi2 chisq;
format cv824 $cv824a. cv101 $cv101a.;
weight poids;
run;

/* -cv384a (a entendu parler du PF à la radio les derniers mois) */

proc freq data=ter.individus;
table cv384a*cv101 / expected deviation cellchi2 chisq;
format cv384a $cv384a. cv101 $cv101a.;
weight poids;
run;

/* -cv384b (a entendu parler du PF à la télévision) */

proc freq data=ter.individus;
table cv384b*cv101 / expected deviation cellchi2 chisq;
format cv384b $cv384b. cv101 $cv101a.;
weight poids;
run;

/* -cv384c (a entendu parler du PF dans les journaux) */

proc freq data=ter.individus;
table cv384c*cv101 / expected deviation cellchi2 chisq;
format cv384c $cv384c. cv101 $cv101a.;
weight poids;
run;

/* -cv3b25b (ls femmes qui se protègent développent des moeurs légères) */

proc freq data=ter.individus;
table cv3b25b*cv101 / expected deviation cellchi2 chisq;
format cv3b25b $cv3b25b. cv101 $cv101a.;
weight poids;
run;

/* cv747a (la procréation est une affaire de femme) */

proc freq data=ter.individus;
table cv747a*cv101 / expected deviation cellchi2 chisq;
format cv747a $cv747a. cv101 $cv101a.;
weight poids;
run;

/* cv747b (important pour la santé de la mère/de l'enfant d'avoir une aide lors de l'accouchement) */

proc freq data=ter.individus;
table cv747b*cv101 / expected deviation cellchi2 chisq;
format cv747b $cv747b. cv101 $cv101a.;
weight poids;
run;

ods pdf close;

/***************************/
/* Variables quantitatives */
/***************************/

ods pdf file="C:\Users\guill\Documents\TER Madagascar\TER Madagascar\Codes\individus\bivariees_educ_sexe_quanti";

footnote "Données provenant de MDHS 2008-2009";
title "Analyses Bivariées";

/* v107 (plus haute année d'édcuation) */

proc freq data=ter.individus;
table v107*cv000 / expected deviation cellchi2 chisq;
format cv000 $cv000a.;
weight poids;
run;

/* v133 (éducation années) */

proc freq data=ter.individus;
table v133*cv000 / expected deviation cellchi2 chisq;
format cv000 $cv000a.;
weight poids;
run;

/* v702 (plus haute année d'étude) */

proc freq data=ter.individus;
table v702*cv000 / expected deviation cellchi2 chisq;
format cv000 $cv000a.;
weight poids;
run;

/* v715 (années d'étude du mari) */

proc freq data=ter.individus;
table v715*cv000 / expected deviation cellchi2 chisq;
format cv000 $cv000a.;
weight poids;
run;

/* Possibilité de création d'indices à partir des variables liées à l'éducation. Une fois ces indices construit, utilisation pour une analyse discriminante entre les sexes 
Possibilité aussi de les utiliser dans le cadre d'une régression */

ods pdf close;

/****************************************************/
/* Construction de la table pour l'indice éducation */
/****************************************************/

proc freq data=ter.individus;
table cv156*cv106;
format cv156 $cv156a. cv106 $cv106a.;
weight poids;
run;

/* Sur les 9286 observations manquantes de cette variable, 8776 collent avec la question filtre
(la question n'est pas posée si éducation secondaire ou sup). On a donc une perte de 510 obs,
les obs qui ont . pour cv156 et pas d'éducation ou primaire pour cv49 */

proc freq data=ter.individus;
table cv157*cv155;
format cv157 $cv157a. cv155 $cv155a.;
weight poids;
run;

/* On ne récupère pas de données en croisant avec la question filtre */

/* On va donc commencer par créer un indice avec les variables cv106 cv155 cv156 cv157 cv158 
cv159 cv301 cv384a cv384b cv384c */

proc freq data=ter.individus;
table cv106; 
weight poids;
run;

data ter.indice;
set ter.individus;
keep CASEID cv106 cv155 cv156 cv157 cv158 cv159 cv301 cv384a cv384b cv384c poids;
if cv106 = '.' then delete;
if cv155 = '.' then delete;
if cv156 = '.' and cv106 = "0" then delete;
if cv156 = '.' and cv106 = "1" then delete;
if cv157 = '.' then delete;
if cv158 = '.' then delete;
if cv159 = '.' then delete;
if cv301 = '.' then delete;
if cv384a = '.' then delete;
if cv384b = '.' then delete;
if cv384c = '.' then delete;
run;

/* Sans prendre en compte cv156, en supprimant toutes les valeurs manquantes des autres pour 
lesquelles il n'y a pas de filtre, on passe de 25961 à 25760 obs, soit 201 observations.
On passe à 25304 obs en enlevant les valeurs manquantes qui ne correspondent pas à un filtre
pour cv156, soit 657 observations de perdues par rapport à la table individus de départ. 
On perd donc 2.53% des observations */

proc contents data=ter.indice;
run;

proc freq data=ter.indice;
run;

/* Il reste maintenant à recoder les modalités si nécessaire. Hormis pour cv156, pour laquelle 
le . correspondra maintenant à un 0 (n'a pas participé), les autres variables n'ont pas de 
données manquantes. Le recodage se fera selon une logique à expliciter */

proc format library=ter;
value $cv106i /* cv106 Plus haut niveau d'éducation */
"0" = "PE" /* Pas d'éduc */
"1" = "Pr" /* Primaire */
"2" = "Sc" /* Secondaire */
"3" = "Sp" /* Supérieur */
; 
value $cv155i /* cv155 Alphabétisation */
"0" = "Lect-" /* Illetré */
"1" = "Lect" /* Intermédiaire */
"2" = "Lect+" /* Lettré */
"3" = "Lect-"
"4" = "Lect-"
;
value $cv156i /* cv156 A déjà participé à un programme d'alphabétisation en dehors du primaire */
"." = "ProgA-" /* N'a pas participé à un programme d'alphabétisation */
"0" = "ProgA-"
"1" = "ProgA+" /* A participé */
;
value $cv157i /* cv157 Fréquence de lecture de journaux ou magazines */
"0" = "Journaux-" /* Jamais */
"1" = "Journaux" /* De temps en temps */
"2" = "Journaux"
"3" = "Journaux+" /* Tous les jours */
;
value $cv158i /* cv158 Fréquence d'écoute de la radio */
"0" = "Rad-" /* Jamais */
"1" = "Rad" /* De temps en temps */
"2" = "Rad"
"3" = "Rad+" /* Tous les jours */
;
value $cv159i /* cv159 Fréquence de visionnage de la télévision */
"0" = "TV-" /* Jamais */
"1" = "TV" /* De temps en temps */
"2" = "TV"
"3" = "TV+" /* Tous les jours */
;
value $cv301i /* cv301 Connaissance de n'importe quelle méthode */
"0" = "Contra-" /* Ne connait pas les méthodes contraceptives modernes */ 
"1" = "Contra-"
"2" = "Contra-"
"3" = "Contra+" /* Connait les méthodes conraceptives modernes */
;
value $cv384ai /* cv384a A entendu parler du PF à la radio les derniers mois */
"0" = "PFRad-" /* Non */
"1" = "PFRad+" /* Oui */
;
value $cv384bi /* cv384b A entendu parer du PF à la télévision les derniers mois */
"0" = "PFTV-"
"1" = "PFTV+"
;
value $cv384ci /* cv384c A entendu parler du PF dans les journaux les derniers mois */
"0" = "PFJournaux-"
"1" = "PFJournaux+"
;
run;

/**************************************/
/* Correctif à apporter sur les poids */
/**************************************/

data ter.indice;
set ter.indice;
retain cumpoids 0;
cumpoids=cumpoids+poids;
call symputx("totpoids",cumpoids);
call symputx("Nobs",_N_);
run;

data ter.indice;
set ter.indice;
poids=&Nobs*poids/&totpoids;
run;

/*******/
/* ACM */
/*******/

ods pdf file="C:\Users\guill\Documents\TER Madagascar\TER Madagascar\Codes\individus\ACM_Burt_2dimensions";

footnote "Données provenant de MDHS 2008-2009";
title "Première ACM";

proc corresp data=ter.indice all mca benzecri;
tables cv106 cv155 cv156 cv157 cv158 cv159 cv301 cv384a cv384b cv384c;
format cv106 $cv106i. cv155 $cv155i. cv156 $cv156i. cv157 $cv157i. cv158 $cv158i. cv159 $cv159i. 
cv301 $cv301i. cv384a $cv384ai. cv384b $cv384bi. cv384c $cv384ci.;
weight poids;
run;

ods pdf close;

/* En regardant les taux d'inertie modifiés, on constate que le premier axe explique à lui seul plus de 90% de l'inertie.
On peut donc se contenter de cet axe et prendre les poids des modalités sur cet axe afin de construire notre indice */

ods pdf file="C:\Users\guill\Documents\TER Madagascar\TER Madagascar\Codes\individus\ACM_indice";

footnote "Données provenant de MDHS 2008-2009";
title "Construction de l'indice d'éducation";

proc corresp data=ter.indice out=ter.resulTB all mca dimens=1;
tables cv106 cv155 cv156 cv157 cv158 cv159 cv301 cv384a cv384b cv384c;
format cv106 $cv106i. cv155 $cv155i. cv156 $cv156i. cv157 $cv157i. cv158 $cv158i. cv159 $cv159i. 
cv301 $cv301i. cv384a $cv384ai. cv384b $cv384bi. cv384c $cv384ci.;
weight poids;
run;

ods pdf close;

/* On répète la même procédure que précédemment, mais avec le TDC. Le plan est le même, les résultats à partir de la table de Burt pourront 
donc être utilisés. En revanche, on a désormais directement les coordonnées des individus dans le plan */

proc corresp data=ter.indice out=ter.resulTDC noprint dimens=1;
tables CASEID, cv106 cv155 cv156 cv157 cv158 cv159 cv301 cv384a cv384b cv384c;
format cv106 $cv106i. cv155 $cv155i. cv156 $cv156i. cv157 $cv157i. cv158 $cv158i. cv159 $cv159i. 
cv301 $cv301i. cv384a $cv384ai. cv384b $cv384bi. cv384c $cv384ci.;
weight poids;
run;

/*****************************************/
/* Calcul des indices pour les individus */
/*****************************************/

data ter.intermediaire;
set ter.resulTDC;
keep _NAME_ Dim1;
if Dim1 = "." then delete;
if _NAME_ = "PE" then delete;
if _NAME_ = "Pr" then delete;
if _NAME_ = "Sc" then delete;
if _NAME_ = "Sp" then delete;
if _NAME_ = "Lect-" then delete;
if _NAME_ = "Lect" then delete;
if _NAME_ = "Lect+" then delete;
if _NAME_ = "Lect-" then delete;
if _NAME_ = "Lect-" then delete;
if _NAME_ = "ProgA-" then delete;
if _NAME_ = "ProgA-" then delete;
if _NAME_ = "ProgA+" then delete;
if _NAME_ = "Journaux-" then delete;
if _NAME_ = "Journaux" then delete;
if _NAME_ = "Journaux" then delete;
if _NAME_ = "Journaux+" then delete;
if _NAME_ = "Rad-" then delete;
if _NAME_ = "Rad" then delete;
if _NAME_ = "Rad" then delete;
if _NAME_ = "Rad+" then delete;
if _NAME_ = "TV-" then delete;
if _NAME_ = "TV" then delete;
if _NAME_ = "TV" then delete;
if _NAME_ = "TV+" then delete;
if _NAME_ = "Contra-" then delete; 
if _NAME_ = "Contra-" then delete;
if _NAME_ = "Contra-" then delete;
if _NAME_ = "Contra+" then delete;
if _NAME_ = "PFRad-" then delete;
if _NAME_ = "PFRad+" then delete;
if _NAME_ = "PFTV-" then delete;
if _NAME_ = "PFTV+" then delete;
if _NAME_ = "PFJournaux-" then delete;
if _NAME_ = "PFJournaux+" then delete;
run;

data ter.individus;
set ter.individus;
CASEID2=strip(CASEID);
run;

proc sort data=ter.individus;
by CASEID2;
run; 

data ter.intermediaire;
set ter.intermediaire;
CASEID2=strip(_NAME_);
run;

proc sort data=ter.intermediaire;
by CASEID2;
run; 

data ter.ii;
merge ter.individus (in=ind) ter.intermediaire (in=int);
by CASEID2;
if ind and int;
run;

/*****************************/
/* Normalisation des indices */
/*****************************/

proc means data=ter.ii;
var dim1;
run;

/* -0.9338384
1.9623176 */

data ter.ii;
set ter.ii;
dim1 = dim1 + 0.9338384;
run;

data ter.ii;
set ter.ii;
dim1 = dim1/(0.9338384+1.9623176);
run;

proc means data=ter.ii;
var dim1;
run;

proc sgplot data=ter.ii;
histogram dim1;
run;

/***********************************************/
/* Utilisation de l'indice dans une régression */
/***********************************************/

proc contents data=ter.ii;
run;

data ter.ii;
set ter.ii;
if cv000 = . then delete;
if cv102 = . then delete;
if cv130 = . then delete;
if cv151 = . then delete;
if v012 = . then delete;
if v201 = . then delete;
run;

proc transreg data=ter.ii design;
model class(cv000 cv102 cv130 cv151);
output out=ter.TDC;
id caseid2;
weight poids;
run; 

proc freq data=ter.ii;
table cv000 cv102 cv130 cv151;
run;

data ter.ii2;
merge ter.ii (in=ii) ter.TDC (in=tdc);
by CASEID2;
if ii and tdc;
run;

/* Fait manuellement afin de s'assurer du codage des modalités et donc de l'interprétation de la régression */

data ter.ii;
set ter.ii;
if cv000 = 1 then cv0001=1;
else cv0001 = 0;
if cv102 = 1 then cv1021 = 1;
else cv1021 = 0;
if cv130 = 1 then cv1301=cv1302=cv1303=cv1304=cv1305=0;
else cv1301=cv1302=cv1303=cv1304=cv1305=0;
if cv130 = 2 then cv1301 = 1;
else cv1301 = 0;
if cv130 = 3 then cv1302 = 1;
else cv1302 = 0;
if cv130 = 4 then cv1303 = 1;
else cv1303 = 0;
if cv130 = 5 then cv1304 = 1;
else cv1304 = 0;
if cv130 = 96 then cv1305 = 1;
else cv1305 = 0;
if cv151 = 2 then cv1511 = 1;
else cv1511 = 0;
run;

ods pdf file="C:\Users\guill\Documents\TER Madagascar\TER Madagascar\Codes\individus\regression";

footnote "Données provenant de MDHS 2008-2009";
title "Régression de l'indice éducation";

proc reg data=ter.ii outest=reg;
model dim1 = cv0001 cv1021 cv1301 cv1302 cv1303 cv1304 cv1305 cv1511 v012 v201;
label 
cv0001 = "L'individu est un homme"
cv1021 = "Urbain"
cv1301 = "Catholique"
cv1302 = "Pas de religion"
cv1303 = "Religion traditionnelle"
cv1304 = "Musulman"
cv1305 = "Autre"
cv1511 = "Le chef de ménage est une femme"
;
weight poids;
run;

ods pdf close;
