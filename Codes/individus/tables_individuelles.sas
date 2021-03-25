libname ter "\\salsa.univ-amu.fr\dfs\ProfilsEtud\b17026985\Mes documents\TER\data";

/************************************/
/* Prise de connaissance des tables */
/************************************/

proc contents data=ter.MDIR51FL;
run;

proc contents data=ter.MDMR51FL;
run;

/**************************************************************/
/* S�lection des variables fusion des tables hommes et femmes */
/**************************************************************/

data ter.hommes;
set ter.MDMR51FL;
sexe=1;
run;

data ter.femmes;
set ter.MDIR51FL;
sexe=2;
run;

/* Non pr�sent dans la table hommes :
-mv020 (ever-married sample)
-mv034 (line number of husband)
-mv040 (cluster altitude in meters)
-mv123-mv124-mv125-mv153 (biens d'�quipements)
-mv139 (de jure region of residence)			(mv101 et mv102, region et place of residence)
-mv141 (de jure type of place of residence)
-mv208 (Births in last five years)
-mv319 (years since sterilization)
-mv320 (age at sterilization)
-mv321 (marital duration at sterilization)
-mv325a (cost of current method)				(mv325b cost of condoms last time obtained)
-mv364 (contraceptive use & intention)			
-mv367 (wanted last child)
-mv376 (main reason not to use a method)
-mv446 (Rohrer's index for respondent)
-mv457 (anemia level)
-mv506 (wife rank number)
-mv623 (exposure)
-mv624 (unmet need)
-mv632 (decision maker for using contraception)
-mv634 (husband knows that respondent is using contraception)
-mv701 (partner's education level)
-mv702 (highest year of education)
-mv704-mv705 (partner's occupation)
-mv715 (Husband education-single years)
-mv729 (partner's educational attainment)
-mv730 (partners age)
-mv746 (earns more than partner)
-mv830 (age of first sexual partner)
-mv831 (first sexual partner younger, same age or older)
-mv3a07 (first source for current method)
-mv3a08a--mv3a08z (reason not using method)
-mv467b--mv467i (getting medical help for self)
-mv834a (age of last sexual partner)
-mv850a--mv850b (can respondent refuse sex)

On ajoute :
-mv793 paid for sex last 12 months
-mv325b cost of condoms last time obatined  
-mv3a09b How many condoms did get last time 
-mv3b17 source of condoms 
-mv3b25a contraception os woman's business, man should not worry 
-mv3b25b women who use contraception become promiscuous 
-mv634a husband has right to : get angry 
-mv634b husband has right to : refuse financial support 
-mv634c husband has right to : use force ofr unwanted sex 
-mv634d husband has right to : have sex with another women 
-mv743b final say on making large household purchases 
-mv743c final say on making household purchases for daily needs 
-mv743d final say on visits to family or relatives 
-mv743f final say on deciding what to do with money wife earns 
-mv743g final say on deciding how many children to have 
-mv747a childbearing is a woman's concern  
-mv747b important for mother/child health to get assistance at deliv */

data ter.hommes;
set ter.hommes;
keep sexe mCASEID mV001 mV002 mV004 mV005 mV012 mV023 mV029 mV101 mV102 mV106 mV107 mv130 mV133 mV149 mV150 mV151 mV155 mV156 mV157 mV158 mV159
mV190 mV191 mV201 mV202 mV203 mV204 mV205 mV206 mV207 mV218 mV301 mV302 mV312 mV313 mV384A mV384B mV384C mV464 mV481 mV501 mV502 mV503 mV504 mV505
mV511 mV513 mV535 mV536 mV602 mV605 mV613 mV621 mV627 mV628 mV629 mV714 mV716 mV717 mV719 mV721 mV731 mV732 mV739 mV740 mV741 mV750 mV751 mV756 mV761
mV769 mV770 mV777 mV778 mV779 mV780 mV781 mV783 mV785 mV820 mV822 mV823 mV824 mV825 mV826 mV836 mV849
mV463A--mV463Z mV481A--mV481X mV744A--mV744E mV762AA--mV762AZ mV762BA--mV762BZ mV767A mV769A mV833A
mv793 mv325b mv3a09b mv3b17 mv3b25a mv3b25b mv634a mv634b mv634c mv634d mv743b--mv743g mv747a mv747b;
rename mcaseid=caseid mv001-mv849=v001-v849 mv384a=v384a mv384b=v384b mv384c=v384c mv463a=v463a mv463b=v463b mv463c=v463c mv463d=v463d mv463e=v463e mv463f=v463f 
mv463g=v463g mv463h=v463h mv463i=v463i mv463j=v463j mv463k=v463k mv463l=v463l mv463m=v463m mv463n=v463n mv463o=v463o mv463p=v463p mv463q=v463q mv463r=v463r 
mv463s=v463s mv463t=v463t mv463u=v463u mv463v=v463v mv463w=v463w mv463x=v463x mv463y=v463y mv463z=v463z
mV481A=V481a mV481b=V481b mV481c=V481c mV481d=V481d mV481e=V481e mV481f=V481f mV481g=V481g mV481h=V481h mV481i=V481i mV481j=V481j mV481k=V481k mV481l=V481l
mV481m=V481m mV481n=V481n mV481o=V481o mV481p=V481p mV481q=V481q mV481r=V481r mV481s=V481s mV481t=V481t mV481u=V481u mV481v=V481v mV481w=V481w mV481X=V481x
mV744A=V744a mV744b=V744b mV744c=V744c mV744d=V744d mV744E=V744e
mV762AA=V762Aa mV762Ab=V762Ab mV762Ac=V762Ac mV762Ad=V762Ad mV762Ae=V762Ae mV762Af=V762Af mV762Ag=V762Ag mV762Ah=V762Ah mV762Ai=V762Ai mV762Aj=V762Aj 
mV762Ak=V762Ak mV762Al=V762Al mV762Am=V762Am mV762An=V762An mV762Ao=V762Ao mV762Ap=V762Ap mV762Aq=V762Aq mV762Ar=V762Ar mV762As=V762As mV762At=V762At
mV762Au=V762Au mV762Av=V762Av mV762Aw=V762Aw mV762Ax=V762Ax mV762Ay=V762Ay mV762AZ=V762Az
mV762BA=V762Ba mV762Bb=V762Bb mV762Bc=V762Bc mV762Bd=V762Bd mV762Be=V762Be mV762Bf=V762Bf mV762Bg=V762Bg mV762Bh=V762Bh mV762Bi=V762Bi mV762Bj=V762Bj
mV762Bk=V762Bk mV762Bl=V762Bl mV762Bm=V762Bm mV762Bn=V762Bn mV762Bo=V762Bo mV762Bp=V762Bp mV762Bq=V762Bq mV762Br=V762Br mV762Bs=V762Bs mV762Bt=V762Bt
mV762Bu=V762Bu mV762Bv=V762Bv mV762Bw=V762Bw mV762Bx=V762Bx mV762By=V762By mV762BZ=V762Bz
mV767A=v767a mV769A=v769a mV833A=v833a mv325b=v325b mv3a09b=v3a09b mv3b17=v3b17 mv3b25a=v3b25a mv3b25b=v3b25b mv634a=v634a mv634b=v634b mv634c=v634c mv634d=v634d
mv743b=v743b mv743c=v743c mv743d=v743d mv743e=v743e mv743f=v743f mv743g=v743g
mv747a=v747a mv747b=v747b;
run;

data ter.femmes;
set ter.femmes;
keep sexe CASEID V001 V002 V004 V005 V012 V020 V023 V029 V034 V040 V101 V102 V106 V107 V123 V124 V125 v130 V133 V139 V141 V149 V150 V151 V153 V155 V156 V157
V158 V159 V190 V191 V201 V202 V203 V204 V205 V206 V207 V208 V218 V301 V302 V312 V313 V319 V320 V321 V325A V364 V367 V376 V384A V384B V384C V446 V457 V464
V481 V501 V502 V503 V504 V505 V506 V511 V513 V535 V536 V602 V605 V613 V621 V623 V624 V627 V628 V629 V632 V634 V701 V702 V704 V705 V714 V715 V716 V717 V719
V721 V729 V730 V731 V732 V739 V740 V741 V746 V750 V751 V756 V761 V769 V770 V777 V778 V779 V780 V781 V783 V785 V820 V822 V823 V824 V825 V826 V830 V831 V836 
V849 V3A07 V3A08A--V3A08Z V463A--V463Z V467B--V467I V481A--V481X V744A--V744E V762AA--V762AZ V762BA--V762BZ V767A V769A V833A V834A V850A--V850B;
run;

proc freq data=ter.hommes;
run;

proc freq data=ter.femmes;
run;

/*******************************************************/
/* Fusion des variables et nettoyage de la table homme */
/*******************************************************/

proc freq data=ter.hommes;
table v463a--v463z;
run;

data ter.hommes;
set ter.hommes;
if v463z=1 then v463=1;
if v463z=0 then v463=0;
label v463='Smokes';
drop v463a--v463z;
run;

proc freq data=ter.hommes;
table v463 v463a--v463z;
run;

/* On perd des donn�es. Pourquoi ? */

proc freq data=ter.hommes;
table v481 v481a--v481x;
run;

/* Pertinence de garder ces variables ? Presque personne de couvert dans le pays (�norme
pourcentage de v481=0, information r�siduelle sur les couverts pour v481a--v481x */

data ter.hommes;
set ter.hommes;
if v481a=1 then v482=1;
if v481b=1 then v482=2;
if v481c=1 then v482=3;
if v481d=1 then v482=4;
if v481a=v481b=v481c=v481d=v481x=0 then v482=0;
label v482='Health insurance type';
drop v481a--v481x;
run;

proc freq data=ter.hommes;
table v482 v481a--v481x;
run;

/* Pas de pertes de donn�es cette fois-ci */

proc freq data=ter.hommes;
table v744a--v744e;
run;

data ter.hommes;
set ter.hommes;
if v744a=1 then v744=1;
if v744b=1 then v744=2;
if v744c=1 then v744=3;
if v744d=1 then v744=4;
if v744e=1 then v744=5;
if v744a=v744b=v744c=v744d=v744e=0 then v744=0;
label v744='Wife beating justified if she...';
drop v744a--v744e; 
run;

proc freq data=ter.hommes;
table v744;
run;

/* 168 donn�es manquantes pour la variable cr��e, soit une perte de donn�es, s�rement parce
que les raisons ne se croisent pas */

proc freq data=ter.hommes;
table v762aa--v762az;
run;

data ter.hommes;
set ter.hommes;
if v762aa=1 then v762=1;
if v762ab=1 then v762=2;
if v762ag=1 then v762=3;
if v762ah=1 then v762=4;
if v762aj=1 then v762=5;
if v762ak=1 then v762=6;
if v762al=1 then v762=7;
if v762ap=1 then v762=8;
if v762aq=1 then v762=9;
if v762as=1 then v762=10;
if v762at=1 then v762=11;
if v762au=1 then v762=12;
if v762av=1 then v762=13;
if v762aw=1 then v762=14;
if v762ax=1 then v762=15;
if v762az=1 then v762=16;
if v762aa=v762ab=v762ag=v762ah=v762aj=v762ak=v762al=v762ap=v762aq=v762as=v762at=v762au=v762av=v762aw=v762ax=v762az=0 then v762=0;
label v762='Source for condoms';
drop v762aa--v762az;
run;

proc freq data=ter.hommes;
table v762;
run;

/* 25 donn�es manquantes, soit �quivalent aux variables de base. Pas de donn�es perdues, mais pas 
de r�ponses 0 sur cette variable, ie pas de pr�servatifs du tout */

proc freq data=ter.hommes;
table v634a v634b v634c v634d;
run;

data ter.hommes;
set ter.hommes;
if v634a=1 then v635=1;
if v634b=1 then v635=2;
if v634c=1 then v635=3;
if v634d=1 then v635=4;
if v634a=v634b=v634c=v634d=0 then v635=0;
if v634a=v634b=v634c=v634d=8 then v635=0;
label v635='Le mari a le droit...';
drop v634a--v634d;
run;

proc freq data=ter.hommes;
table v635 v634a v634b v634c v634d;
run;

/* 650 donn�es manquantes. Pourquoi ? */

proc freq data=ter.hommes;
table v743b--v743g;
run;

data ter.hommes;
set ter.hommes;
drop v743e;
run;

/* Compliquer de cr�er une variable r�sumant celles-ci, �tant donn�es que les r�ponses ne se recoupent pas selon
les variables. On se contente d'enlever celle n'ayant pas de r�ponses */

proc freq data=ter.hommes;
table v739;
run;

/* Trop de donn�es manquantes pour v739, who decides to spend money (4978 donn�es manquantes.
8 modalit�s pour ces variables : Mari=1 Femme=2 Egalit�=4 NSP=8 */

proc contents data=ter.hommes;
run;

data ter.hommes;
set ter.hommes;
drop v762ba--v762bz v621 v721 v769a;
run;

/* On enl�ve toutes les variables relatives au pr�servatif f�minin, sans donn�es, ainsi que celle sur le d�sir f�minin d'enfants,
travail � la maison ou dehors, possibilit� d'avoir ou non un pr�servatif f�minin */

proc contents data=ter.hommes;
run;

/*******************************************************/
/* Fusion des variables et nettoyage de la table femme */
/*******************************************************/

proc contents data=ter.femmes;
run;

/* On commence par faire le m�me travail qui a �t� fait sur la table homme, pour les variables
identiques */

proc freq data=ter.femmes;
table v463a--v463z;
run;

data ter.femmes;
set ter.femmes;
if v463z=1 then v463=1;
if v463z=0 then v463=0;
label v463='Smokes';
drop v463a--v463z;
run;

proc freq data=ter.femmes;
table v481 v481a--v481x;
run;

data ter.femmes;
set ter.femmes;
if v481a=1 then v482=1;
if v481b=1 then v482=2;
if v481c=1 then v482=3;
if v481d=1 then v482=4;
if v481a=v481b=v481c=v481d=v481x=0 then v482=0;
label v482='Health insurance type';
drop v481a--v481x;
run;

proc freq data=ter.femmes;
table v744a--v744e;
run;

data ter.femmes;
set ter.femmes;
if v744a=1 then v744=1;
if v744b=1 then v744=2;
if v744c=1 then v744=3;
if v744d=1 then v744=4;
if v744e=1 then v744=5;
if v744a=v744b=v744c=v744d=v744e=0 then v744=0;
label v744='Wife beating justified if she...';
drop v744a--v744e; 
run;

proc freq data=ter.femmes;
table v762aa--v762az;
run;

data ter.femmes;
set ter.femmes;
if v762aa=1 then v762=1;
if v762ab=1 then v762=2;
if v762ag=1 then v762=3;
if v762ah=1 then v762=4;
if v762aj=1 then v762=5;
if v762ak=1 then v762=6;
if v762al=1 then v762=7;
if v762ap=1 then v762=8;
if v762aq=1 then v762=9;
if v762as=1 then v762=10;
if v762at=1 then v762=11;
if v762au=1 then v762=12;
if v762av=1 then v762=13;
if v762aw=1 then v762=14;
if v762ax=1 then v762=15;
if v762az=1 then v762=16;
if v762aa=v762ab=v762ag=v762ah=v762aj=v762ak=v762al=v762ap=v762aq=v762as=v762at=v762au=v762av=v762aw=v762ax=v762az=0 then v762=0;
label v762='Source for condoms';
drop v762aa--v762az;
run;

/* Cette fois-ci, il y a des r�ponses pour les pr�servatifs f�minins. Les questions sont les m�mes 
que pour le pr�servtatif masculin, on reprend donc la m�me typologie */

proc freq data=ter.femmes;
table v762ba--v762bz;
run;

data ter.femmes;
set ter.femmes;
if v762ba=1 then v763=1;
if v762bb=1 then v763=2;
if v762bc=1 then v763=3;
if v762bd=1 then v763=4;
if v762be=1 then v763=5;
if v762bf=1 then v763=6;
if v762bj=1 then v763=7;
if v762bk=1 then v763=8;
if v762bl=1 then v763=9;
if v762bm=1 then v763=10;
if v762bn=1 then v763=11;
if v762bo=1 then v763=12;
if v762bs=1 then v763=13;
if v762bt=1 then v763=14;
if v762bu=1 then v763=15;
if v762bx=1 then v763=16;
if v762bz=1 then v763=17;
if v762ba=v762bb=v762bc=v762bd=v762be=v762bf=v762bj=v762bk=v762bl=v762bm=v762bn=v762bo=v762bs=v762bt=v762bu=v762bx=v762bz=0 then v763=0;
label v763='Source for female condoms';
drop v762ba--v762bz;
run;

/* Maintenant, autres variables dont les diff�rentes modalit�s sont divis�es en diff�rentes variables
� regrouper en une seule � chaque fois, mais celles propre � la table femme */

proc freq data=ter.femmes;
table v3a07 v3a08a--v3a08z;
run;

data ter.femmes;
set ter.femmes;
if v3a08a=1 then v3a08=1;
if v3a08b=1 then v3a08=2;
if v3a08c=1 then v3a08=3;
if v3a08d=1 then v3a08=4;
if v3a08e=1 then v3a08=5;
if v3a08f=1 then v3a08=6;
if v3a08g=1 then v3a08=7;
if v3a08h=1 then v3a08=8;
if v3a08i=1 then v3a08=9;
if v3a08j=1 then v3a08=10;
if v3a08k=1 then v3a08=11;
if v3a08l=1 then v3a08=12;
if v3a08m=1 then v3a08=13;
if v3a08n=1 then v3a08=14;
if v3a08o=1 then v3a08=15;
if v3a08p=1 then v3a08=16;
if v3a08q=1 then v3a08=17;
if v3a08r=1 then v3a08=18;
if v3a08s=1 then v3a08=19;
if v3a08t=1 then v3a08=20;
if v3a08x=1 then v3a08=21;
if v3a08z=1 then v3a08=22;
label v3a08='Reason not using method';
drop v3a08a--v3a08z;
run;

proc freq data=ter.femmes;
table v3a08;
run;

proc freq data=ter.femmes;
table v467b--v467i;
run;

data ter.femmes;
set ter.femmes;
if v467b=2 then v467=1;
if v467c=2 then v467=2;
if v467d=2 then v467=3;
if v467e=2 then v467=4;
if v467f=2 then v467=5;
if v467g=2 then v467=6;
if v467h=2 then v467=7;
if v467i=2 then v467=8;
label v467='Getting medical help for self';
drop v467b--v467i;
run;

proc freq data=ter.femmes;
table v467;
run;

/* Pas s�r de la signification pour celle-ci, � revoir avec le dictionnaire et le questionnaire */

/* Les variables � fusionner l'ont �t�es. Maintenant, il reste � supprimer les variables sans donn�es */

proc contents data=ter.femmes;
run;

data ter.femmes;
set ter.femmes;
drop v141;
run;

/*********************************************************************/
/* Fusion des tables hommes et femmes, cr�ation de la table individu */
/*********************************************************************/

proc freq data = ter.hommes;
run;

proc freq data = ter.femmes;
run;

data ter.individus;
set ter.hommes ter.femmes;
run;

proc contents data=ter.individus;
run;

/* v704 v705 : doublette partner occupation (pr�sente sur la table femme de base)
v716 v717 : la m�me chose (avec les m�mes modalit�s, � voir sur l'enqu�te la raison)
*/

proc freq data=ter.individus;
table v762 v3b17;
run;

proc freq data=ter.hommes;
table mv3b17;
run;

/* v762 : source for condoms, la variable pr�c�demment cr��e r�sumant les diff�rentes variables-modalit�s 
v3b17 : source of condoms, pos�e uniquement aux hommes, avec quasiment toutes les valeurs manquantes. 
On peut donc supprimer cette derni�re et ne garder que la premi�re.
Aussi non, la table individus semble correcte. */

data ter.individus;
set ter.individus;
drop v3b17;
run;

/************************************************/
/* Transformation des variables quanti en quali */
/************************************************/

proc contents data=ter.individus;
run;

proc freq data=ter.individus;
table v004 v029 v763;
run;

data ter.individus;
set ter.individus;
cv000 = put(sexe, 1.);
/*v004 = put(v004, 4.);*/
cv023 = put(v023, 2.);
/*cv029 = put(v029, 3.);*/
cv101 = put(v101, 2.);
cv102 = put(v102, 1.);
cv106 = put(v106, 1.);
cv123 = put(v123, 1.);
cv124 = put(v124, 1.);
cv125 = put(v125, 1.);
cv130 = put(v130, 2.);
cv139 = put(v139, 2.);
cv149 = put(v149, 1.);
cv150 = put(v150, 2.);
cv151 = put(v151, 1.);
cv153 = put(v153, 1.);
cv155 = put(v155, 1.);
cv156 = put(v156, 1.);
cv157 = put(v157, 1.);
cv158 = put(v158, 1.);
cv159 = put(v159, 1.);
cv301 = put(v301, 1.);
cv302 = put(v302, 1.);
cv312 = put(v312, 2.);
cv313 = put(v313, 1.);
cv364 = put(v364, 1.);
cv367 = put(v367, 1.);
cv376 = put(v376, 2.);
cv463 = put(v463, 1.);
cv467 = put(v467, 1.);
cv481 = put(v481, 1.);
cv482 = put(v482, 1.);
cv501 = put(v501, 1.);
cv502 = put(v502, 1.);
cv504 = put(v504, 1.);
cv535 = put(v535, 1.);
cv536 = put(v536, 1.);
cv602 = put(v602, 1.);
cv605 = put(v605, 1.);
cv621 = put(v621, 1.);
cv623 = put(v623, 1.);
cv624 = put(v624, 1.);
cv632 = put(v632, 1.);
cv634 = put(v634, 1.);
cv635 = put(v635, 1.);
cv701 = put(v701, 1.);
cv704 = put(v704, 2.);
cv705 = put(v705, 2.);
cv714 = put(v714, 1.);
cv716 = put(v716, 2.);
cv717 = put(v717, 2.);
cv719 = put(v719, 1.);
cv721 = put(v721, 1.);
cv729 = put(v729, 1.);
cv731 = put(v731, 1.);
cv732 = put(v732, 1.);
cv739 = put(v739, 1.);
cv740 = put(v740, 1.);
cv741 = put(v741, 1.);
cv744 = put(v744, 1.);
cv746 = put(v746, 1.);
cv750 = put(v750, 1.);
cv751 = put(v751, 1.);
cv756 = put(v756, 1.);
cv761 = put(v761, 1.);
cv762 = put(v762, 2.);
cv763 = put(v763, 2.);
cv769 = put(v769, 1.);
cv770 = put(v770, 1.);
cv777 = put(v777, 1.);
cv778 = put(v778, 1.);
cv779 = put(v779, 1.);
cv780 = put(v780, 1.);
cv781 = put(v781, 1.);
cv783 = put(v783, 1.);
cv785 = put(v785, 1.);
cv793 = put(v793, 1.);
cv820 = put(v820, 1.);
cv822 = put(v822, 1.);
cv823 = put(v823, 1.);
cv824 = put(v824, 1.);
cv825 = put(v825, 1.);
cv826 = put(v826, 1.);
cv831 = put(v831, 1.);
cv849 = put(v849, 1.);
cv384a = put(v384a, 1.);
cv384b = put(v384b, 1.);
cv384c = put(v384c, 1.);
cv3a07 = put(v3a07, 2.);
cv3a08 = put(v3a08, 2.);
cv3b25a = put(v3b25a, 1.);
cv3b25b = put(v3b25b, 1.);
cv743b = put(v743b, 1.);
cv743c = put(v743c, 1.);
cv743d = put(v743d, 1.);
cv743f = put(v743f, 1.);
cv743g = put(v743g, 1.);
cv747a = put(v747a, 1.);
cv747b = put(v747b, 1.);
cv763 = put(v763, 2.);
cv767a = put(v767a, 2.);
cv769a = put(v769a, 1.);
cv833a = put(v833a, 1.);
cv850a = put(v850a, 1.);
cv850b = put(v850b, 1.);
run;

data ter.individus;
set ter.individus;
drop sexe v004 v023 v029 v101 v102 v106 v130 v149 v150 v151 v155 v156 v157 v158 v159 v301 v302 v312 v313 v463 v481 v482 v501 v502 v504 v535 v536 v602 v605 v632 v634 v635 v714 v716 v717 v719 v731 v732 v739 v740 v741 v744 v750 v751 v756 
v761 v762 v769 v770 v777 v778 v779 v780 v781 v783 v785 v793 v820 v822 v823 v824 v825 v826 v849 v384a v384b v384c v3b25a v3b25b v743b v743c v743d v743f v743g v747a v747b v767a v833a
v123 v124 v125 v139 v153 v364 v367 v376 v621 v623 v624 v701 v704 v705 v721 v729 v746 v763 v831 /*v384*/ v3a07 v769a v850a v850b v3a08 v467; 
run;

data ter.individus;
set ter.individus;
label
cv000 = "Sexe"
cv004 = "Ultimate area unit"
cv023 = "Domaine de l'�chantillon"
cv029 = "Identifiant cl�"
cv101 = "R�gion"
cv102 = "Type de lieu de r�sidence"
cv106 = "Plus haut niveau d'�ducation"
cv123 = "A un v�lo" 
cv124 = "A un scooter"
cv125 = "A une voiture"
cv130 = "Religion"
cv139 = "R�gion de r�sidence de jure"
cv149 = "Niveau d'�ducation atteint"
cv150 = "Relation avec le chef de m�nage"
cv151 = "Sexe du chef de m�nage"
cv153 = "A le t�l�phone"
cv155 = "Alphab�tisation"
cv156 = "A d�j� particip� � un programme d'alphab�tisation en dehors du primaire"
cv157 = "Fr�quence de lecture de journaux ou magazines"
cv158 = "Fr�quence d'�coute de la radio"
cv159 = "Fr�quence de visionnage de la t�l�vision"
cv301 = "Connaissance de n'importe quelle m�thode"
cv302 = "A d�j� utilis� n'importe quelle m�thode"
cv312 = "M�thode de contraception actuelle"
cv313 = "Utilisation actuelle par type de m�thode"
cv364 = "Utilisation de la contraception et intention"
cv367 = "Dernier enfant voulu"
cv376 = "Principale raison pour ne pas se prot�ger"
cv463 = "Fume"
cv467 = "Va chercher de l'aide m�dical pour soi"
cv481 = "Couvert par l'assurance maladie"
cv482 = "Type de couverture d'assurance maladie"
cv501 = "Statut marital actuel"
cv502 = "Actuellement/anciennement/jamais mari�"
cv504 = "Femme/partenaire vie � la maison"
cv535 = "Dur�e du mariage"
cv536 = "R�cente activit� sexuelle"
cv602 = "Pr�f�rence de fertilit�"
cv605 = "D�sir pour plus d'enfants"
cv621 = "D�sir de la femme pour les enfants" 
cv623 = "Exposition"
cv624 = "Besoin non satisfait"
cv632 = "D�cideur pour l'utilisation de la contraception"
cv634 = "Le mari sait que la r�pondante se prot�ge"
cv635 = "Le mari a le droit"
cv701 = "Niveau d'�ducation du partenaire"
cv704 = "Occupation du partenaire"
cv705 = "Occupation du partenaire"
cv714 = "Le r�pondant travaille actuellement"
cv716 = "Occupation du r�pondant"
cv717 = "Occupation du r�pondant"
cv719 = "Travaille pour la famille, lui-m�me, autres"
cv721 = "Travaille � la maison ou ailleurs"
cv729 = "Niveau d'�ducation du partenaire"
cv731 = "A travaill� ces 12 derni�res heures"
cv732 = "Travail annuel/saisonnier"
cv739 = "Qui d�cide comment d�penser l'argent"
cv740 = "Type de terre o� le responsable travaille"
cv741 = "Type de revenu du travail"
cv744 = "Battre sa femme est justifi� si"
cv746 = "Gagne plus que le partenaire"
cv750 = "A entendu parler des MST"
cv751 = "A entendu parler du SIDA"
cv756 = "Est-ce qu'une personnne en bonne sant� peut avoir le SIDA"
cv761 = "Derni�re fois qu'un pr�servatif a �t� utilis�"
cv762 = "Provenance des pr�servatifs"
cv763 = "Provenance des pr�servatifs f�minins"
cv769 = "Peut obtenir un pr�servatif"
cv770 = "A cherch� des conseils pour la derni�re maladie"
cv777 = "Il est autoris� de garder une infection du SIDA secr�te"
cv778 = "Pr�t � s'occuper de proches infect�s par le SIDA"
cv779 = "Les personnes infect�es par le SIDA sont autoris�es � continuer � enseigner"
cv780 = "Les enfants devraient apprendre � propos des pr�servatifs"
cv781 = "A d�j� �t� test� pour le SIDA"
cv783 = "Connait une place pour passer un test SIDA"
cv785 = "A entendu parler d'autres MST"
cv793 = "A eu une relation sexuelle tarif�e ces derniers mois"
cv820 = "A utilis� un pr�servatif lors du premier rapport sexuel"
cv822 = "La femme a le droit de demander au mari d'utiliser un pr�servatif s'il a une MST"
cv823 = "Il est possible d'�tre infect� par le SIDA par magie ou moyens supernaturels"
cv824 = "M�dicaments pour �viter la transmission du SIDA au b�b� durant la grossesse"
cv825 = "Acheteriez-vous des l�gumes � un vendeur ayant le SIDA ?"
cv826 = "Quelle est la derni�re fois � vous �tre fait tester ?"
cv831 = "Premier partenaire sexeul plus jeune, m�me �ge ou plus �g�"
cv849 = "Les enfants de 12-14 ans devraient attendre jusqu'au mariage pour le sexe"
cv384a = "A entendu parler du PF � la radio les derniers mois"
cv384b = "A entendu parler du PF � la t�l�vision les derniers mois"
cv384c = "A entendu parler du PF dans les journaux les derniers mois"
cv3a07 = "Premi�re source pour la m�thode actuelle"
cv3a08 = "Raisons pour ne pas se prot�ger"
cv3b17 = "Porvenance des pr�servatifs"
cv3b25a = "La contraception est une affaire de femmes, l'homme n'a pas � s'y inqui�ter"
cv3b25b = "Les femmes qui se prot�gent d�veloppent des moeurs l�g�res" 
cv743b = "Dernier mot sur les achats importants du m�nage"
cv743c = "Dernier mot sur les achats journaliers du m�nage"
cv743d = "Dernier mot pour rendre visite � de la famille ou des proches"
cv743f = "Dernier mot sur quoi faire avec le revenu de la femme"
cv743g = "Dernier mot sur le nombre d'enfants � avoir"
cv747a = "La procr�ation est une affaire de femme"
cv747b = "Important pour la sant� de la m�re/de l'enfant d'avoir une aide lors de l'accouchement"
cv767a = "Relation avec le dernier partenaire sexuel"
cv769a = "Peut obtenir un pr�servatif f�minin"
cv833a = "A utiliser un pr�servatif � chaque fois avec son dernier partenaire sexuel"
cv850a = "La r�pondante peut refuser une relation sexuelle"
cv850b = "Elle peut demander � son partenaire d'uiliser un pr�servatif"
;
run;


ods pdf file="\\salsa.univ-amu.fr\dfs\ProfilsEtud\b17026985\Mes documents\TER\code\table.pdf";
proc contents data=ter.individus;
run;
ods pdf close;

proc freq data=ter.individus;
run;

data ter.individus;
set ter.individus;
label
v001 = "Num�ro de cluster"
v002 = "Identifiant m�nage"
v005 = "Poids"
v012 = "Age actuel du r�pondant"
v020 = "Echantillon d�j� mari�"
v034 = "Num�ro de ligne du mari"
v040 = "Altitude du cluster"
v107 = "Plus haute ann�e d'�ducation"
v133 = "Education (ann�es)"
v190 = "Indice de richesse"
v191 = "Score (indice de richesse)"
v201 = "Total d'enfants d�j� n�s"
v202 = "Fils � la maison"
v203 = "Filles � la maison"
v204 = "Fils ailleurs"
v205 = "Filles ailleurs"
v206 = "Fils d�c�d�s"
v207 = "Filles d�c�d�es"
v208 = "Naissances ces 5 derni�res ann�es"
v218 = "Nombre d'enfants vivants"
v319 = "Ann�es depuis la st�rilisation"
v320 = "Age � la st�rilisation"
v321 = "Ann�es de mariage � la st�rilisation"
v446 = "Indice de Rohrer du r�pondant"
v457 = "Niveau d'an�mie"
v464 = "Nombre de cigarettes fum�es ces derni�res 24 heures"
v503 = "Nombre d'unions"
v505 = "Nombre d'autres femmes"
v506 = "Rang de la femme"
v511 = "Age au premier mariage"
v513 = "Dur�e du mariage (group�)"
v613 = "Nombre id�al d'enfants"
v627 = "Nombre id�al de gar�ons"
v628 = "Nombre id�al de filles"
v629 = "Nombre id�al des deux sexes"
v702 = "Plus haute ann�e d'�tude"
v715 = "Ann�es d'�tudes du mari"
v730 = "Age du partenaire"
v830 = "Age du premier partenaire sexuel"
v836 = "Nombre total de partenaires sexuels au crous de la vie"
v325a = "Co�t de la m�thode contraceptive actuelle"
v834a = "Age du dernier partenaire sexuel"
v325b = "Co�t des derniers pr�servatifs achet�s"
v3a09b = "Combien de pr�servatifs obtenus la derni�re fois"
;
run;

proc format library=ter;
value $cv023a
"1" = "Alaotra Mangoro - urban"
"2" = "Alaotra Mangoro - rural"
"3" = "Amoron'I Mania - urban"
"4" = "Amoron'I Mania - rural"
"5" = "Analamanga - rural"
"6" = "Analanjirofo - urban"
"7" = "Analanjirofo - rural"
"8" = "Androy - rural"
"9" = "Anosy - urban"
"10" = "Anosy - rural"
"11" = "Antananarivo"
"12" = "Atsimo Andrefana - urban"
"13" = "Atsimo Andrefana - rural"
"14" = "Atsimo Atsinanana - urban"
"15" = "Atsimo Atsinanana - rural"
"16" = "Atsinanana - urban"
"17" = "Atsinanana - rural"
"18" = "Betsiboka - urban"
"19" = "Betsiboka - rural"
"20" = "Boeny - urban"
"21" = "Boeny - rural"
"22" = "Bongolava - urban"
"23" = "Bongolava - rural"
"24" = "Diana - urban"
"25" = "Diana - rural"
"26" = "Haute Matsiatra - urban"
"27" = "Haute Matsiatra - rural"
"28" = "Ihorombe - urban"
"29" = "Ihorombe - rural"
"30" = "Itasy - urban"
"31" = "Itasy - rural"
"32" = "Melaky - urban"
"33" = "Melaky - rural"
"34" = "Menabe - urban"
"35" = "Menabe - rural"
"36" = "Sava - urban"
"37" = "Sava - rural"
"38" = "Sofia - urban"
"39" = "Sofia - rural"
"40" = "Vakinankaratra - urban"
"41" = "Vakinankaratra - rural"
"42" = "Vatovavy Fitovinany - urban"
"43" = "Vatovavy Fitovinany - rural"
;
value $cv101a
"11" = "Analamanga"
"12" = "Vakinankaratra"
"13" = "Itasy"
"14" = "Bongolava"
"21" = "Haute Matsiatra"
"22" = "Anamoroni'i Mania"
"23" = "Vatovavy Fitovinany"
"24" = "Ihorombe"
"25" = "Atsimo Atsinanana"
"31" = "Atsinanana"
"32" = "Analanjirofo"
"33" = "Alaotra Mangoro"
"41" = "Boeny"
"42" = "Sofia"
"43" = "Betsiboka"
"44" = "Melaky"
"51" = "Atsimo Andrefana"
"52" = "Androy"
"53" = "Anosy"
"54" = "Menabe"
"71" = "Diana"
"72" = "Sava"
;
value $cv102a
"1" = "Urbain"
"2" = "Rural"
;
value $cv106a
"0" = "Pas d'�ducation"
"1" = "Primaire"
"2" = "Secondaire"
"3" = "Sup�rieure"
;
value $cv123a
"0" = "Non"
"1" = "Oui"
"7" = "Pas r�sident de jure"
;
value $cv124a
"0" = "Non"
"1" = "Oui"
"7" = "Pas r�sident de jure"
;
value $cv125a
"0" = "Non"
"1" = "Oui"
"7" = "Pas r�sident de jure"
;
value $cv130a
"1" = "Catholique"
"2" = "Protestant"
"3" = "Musulman"
"4" = "Religion traditionnelle"
"5" = "Pas de religion"
"96" = "Autre"
;
value $cv139a
"11" = "Analamanga"
"12" = "Vakinankaratra"
"13" = "Itasy"
"14" = "Bongolava"
"21" = "Haute Matsiatra"
"22" = "Anamoroni'i Mania"
"23" = "Vatovavy Fitovinany"
"24" = "Ihorombe"
"25" = "Atsimo Atsinanana"
"31" = "Atsinanana"
"32" = "Analanjirofo"
"33" = "Alaotra Mangoro"
"41" = "Boeny"
"42" = "Sofia"
"43" = "Betsiboka"
"44" = "Melaky"
"51" = "Atsimo Andrefana"
"52" = "Androy"
"53" = "Anosy"
"54" = "Menabe"
"71" = "Diana"
"72" = "Sava"
"97" = "Pas r�sident de jure"
;
value $cv149a
"0" = "Pas d'�ducation"
"1" = "Primaire incompl�te"
"2" = "Primaire compl�te"
"3" = "Secondaire incompl�te"
"4" = "Secondaire compl�te"
"5" = "Sup�rieure"
;
value $cv150a
"1" = "Chef"
"2" = "Femme ou mari"
"3" = "Fils/fille"
"4" = "Beau-fils/belle-fille"
"5" = "Petit-enfant"
"6" = "Parent"
"7" = "Parent par alliance"
"8" = "Fr�re/soeur"
"9" = "Co-�pouse"
"10" = "Autre parent"
"11" = "Enfant adopt�/�tranger"
"12" = "Pas de lien"
"13" = "Neveux/ni�ce de sang"
"14" = "Neveux/ni�ce par alliance"
"98" = "On ne sait pas"
;
value $cv151a
"1" = "Homme"
"2" = "Femme"
;
value $cv153a
"0" = "Non"
"1" = "Oui"
"7" = "Pas r�sident de jure"
;
value $cv155a
"0" = "Ne sait pas lire du tout"
"1" = "Est capable de lire seulement quelque partie d'une phrase"
"2" = "Est capable de lire des phrases enti�res"
"3" = "Ne colle pas avec les langues propos�es"
"4" = "Aveugle/malvoyant"
;
value $cv156a
"0" = "Non"
"1" = "Oui"
;
value $cv157a
"0" = "Jamais"
"1" = "Moins d'une fois par semaine"
"2" = "Au moins une fois par semaine"
"3" = "Presque tous les jours"
;
value $cv158a
"0" = "Jamais"
"1" = "Moins d'une fois par semaine"
"2" = "Au moins une fois par semaine"
"3" = "Presque tous les jours"
;
value $cv159a
"0" = "Jamais"
"1" = "Moins d'une fois par semaine"
"2" = "Au moins une fois par semaine"
"3" = "Presque tous les jours"
;
value $cv301a
"0" = "Ne connait pas de m�thodes"
"1" = "Ne connait que des m�thodes folkloriques"
"2" = "Ne connait que des m�thodes traditionnelles"
"3" = "Connait les m�thodes modernes"
;
value $cv302a
"0" = "N'en a jamais utilis�e"
"1" = "Utilise seulement des m�thodes folkloriques"
"2" = "Utilise seulement des m�thodes traditionnelles"
"3" = "Utilise des m�thodes modernes"
;
value $cv312a
"0" = "N'en utilise pas"
"1" = "Pillule"
"2" = "St�rilet"
"3" = "Par injection"
"4" = "Diaphragme"
"5" = "Pr�servatif"
"6" = "St�rilisation f�minine"
"7" = "St�rilisation masculine"
"8" = "Abstinence p�riodique"
"9" = "Retrait"
"10" = "Autre"
"11" = "Implant"
"12" = "Abstinence"
"13" = "M�thode de l'am�norrh�e"
"14" = "Pr�servatif f�minin"
"15" = "Mousse ou gel�e"
"17" = "M�thode des jours fixes"
"18" = "M�thode sp�cifique 2"
"19" = "M�thode sp�cifique 3"
"20" = "M�thode sp�cifique 4"
;
value $cv313a
"0" = "Pas de m�thode"
"1" = "M�thode folklorique"
"2" = "M�thode traditionnelle"
"3" = "M�thode moderne"
;
value $cv364a
"1" = "Utilise une m�thode moderne"
"2" = "Utilise une m�thode tradtionnelle"
"3" = "Non-utilisateur qui a l'intention de s'y mettre"
"4" = "N'a pas l'intention de s'y mettre"
"5" = "N'a jamais de relation sexuelle"
;
value $cv367a
"1" = "Le voulait maintenant"
"2" = "Le voulait plus tard"
"3" = "n'en voulait pas plus"
;
value $cv376a
"11" = "Pas mari�"
"20" = "Reli�e � la fertilit�"
"22" = "Relation sexuelle irr�guli�re"
"23" = "M�nopaus�e, hyst�rectomie"
"24" = "Hypofertilit�, inf�cond"
"26" = "Veut plus d'enfants"
"30" = "Oppos� � l'usage"
"31" = "R�pondant oppos�"
"32" = "Mari oppos�"
"33" = "Autres oppos�s"
"34" = "Interdiction religieuse"
"40" = "Manque de connaissance"
"41" = "Ne connait pas de m�thode"
"42" = "Ne connait pas de sources"
"50" = "Reli�e � la m�thode"
"51" = "Probl�mes de sant�"
"52" = "Peur d'un effet secondaire"
"53" = "Manque d'acc�s"
"54" = "Co�t trop �lev�"
"55" = "Inconv�nient � l'usage"
"56" = "Interf�re avec le corps"
"96" = "Autre"
"98" = "Ne sait pas"
;
value $cv463a
"0" = "Non fumeur"
"1" = "Fume cigarettes"
"2" = "Fume pipe"
"3" = "Mache tabac"
"4" = "Inhale du tabac � priser"
"5" = "Fume autre chose"
;
value $cv467a
"1" = "Si a la permission d'y aller"
"2" = "Si a l'argent pour y aller"
"3" = "Si la distance n'est pas trop importante"
"4" = "Si elle doit prendre un transport"
"5" = "Si elle n'a pas envie d'y aller seule"
"6" = "Si parce qu'il n'y a pas d'offre de sant� f�minine"
"7" = "Si il n'y a pas d'offre de sant�"
"8" = "Si il n'y a pas de m�dicaments disponibles"
;
value $cv481a
"0" = "Couvert"
"1"= "Non-Couvert"
;
value $cv482a
"0" = "Non couvert"
"1" = "Couvert pas une mutuelle"
"2" = "Couvert pas l'employeur"
"3" = "Couvert pas la s�curit� sociale"
"4" = "Couvert par un contrat priv�"
;
value $cv501a
"0" = "Jamais mari�"
"1" = "Mari�"
"2" = "Concubinage"
"3" = "Veuf/veuve"
"4" = "Divorc�"
"5" = "Ne vivent pas ensemble"
;
value $cv502a
"0" = "jamais mari�"
"1" = "Actuellement mari�"
"2" = "Anciennement mari�"
;
value $cv504a
"1" = "Vie avec elle"
"2" = "reste ailleurs"
;
value $cv535a
"0" = "Non"
"1" = "Formellement mari�e"
"2" = "Vie avec un homme"
;
value $cv536a
"0" = "N'a jamais eu de rapport"
"1" = "Actif ces 4 derni�res semaines"
"2" = "Pas actif ces 4 derni�res semaines - abstinence post-partum"
"3" = "Pas actif ces 4 derni�res semaines - pas abstinence post-partum"
;
value $cv602a
"1" = "En a un autre"
"2" = "Ind�cis"
"3" = "Pas plus"
"4" = "Sterilis�"
"5" = "D�clar� inf�cond"
"6" = "Vierge"
;
value $cv605a
"1" = "Dans les deux ans"
"2" = "Dans plus de deux ans"
"3" = "En veux davantage, peut importe quand"
"4" = "Ind�cis"
"5" = "N'en veut pas plus"
"6" = "St�rilis�"
"7" = "D�clar� inf�cond"
"8" = "Vierge"
;
value $cv621a
"1" = "Les deux veulent le m�me"
"2" = "La mari veut plus"
"3" = "Le mari veut moins"
"8" = "On ne sait pas"
;
value $cv623a
"0" = "F�cond"
"1" = "Enceinte"
"2" = "Am�norrh�ique"
"3" = "Inf�cond, m�naupos�e"
;
value $cv624a 	/* Non traduit !!! */
"0" = "Vierge"
"1" = "Unmet need to space"
"2" = "Unmet need to limit"
"3" = "Using to space"
"4" = "Using to limit"
"5" = "Spacing failure"
"6" = "Limiting failure"
"7" = "Desire birth < 2 yrs"
"8" = "No sex, want to wait"
"9" = "Infecund, menopausal"
;
value $cv632a
"1" = "Principalement le r�pondant"
"2" = "Principalement le mari, le partenaire"
"3" = "D�cision commune"
"6" = "Autre"
;
value $cv634a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv635a
"0" = "Il n'y a pas de droits particuliers au mari"
"1" = "Le mari a le droit d'�tre en col�re"
"2" = "Le mari a le droit de refuser un support financier"
"3" = "Le mari a le droit d'utiliser la force pour avoir des rapports sexuels"
"4" = "Le mari a le droit d'avoir des relations sexuelles avec d'autres femmes"
;
value $cv701a
"0" = "Pas d'�ducation"
"1" = "Primaire"
"2" = "Secondaire"
"3" = "Sup�rieure"
"8" = "On ne sait pas"
;
value $cv704a
"0" = "Ne travaille pas"
"1" = "Officiers de forces arm�es"
"2" = "Sous-officiers des forces arm�es"
"3" = "Autres membres des forces arm�es"
"5" = "Retrait"
"6" = "Autre profession"
"10" = "Senior public administrators and senior business directors"
"11" = "Directeurs g�n�raux, cadres sup�rieurs et miembres de l'Ex�ctif et des corps l�gislatifs"
"12" = "Directeurs de services administratifs et commerciaux"
"13" = "Directeurs et cadres de direction, production et services sp�cialis�s"
"14" = "Dorecteurs et g�rants de l'hotellerie, la restauration, le commerce et autres services"
"20" = "Skilled professional workers"
"21" = "Sp�cialistes des sciences techniques"
"22" = "Sp�cialistes de la sant�"
"23" = "Sp�cialistes de l'enseignements"
"24" = "Sp�cialistes en adminstration d'entreprises"
"25" = "Sp�cialistes des technologies de l'information et des communications"
"26" = "Sp�cialistes de la justice, des sciences sociales et de la culture"
"30" = "Intermediate level professional workers"
"31" = "Professions interm�diaires des sciences et techniques"
"32" = "Professions interm�diaires de la sant�"
"33" = "Professions interm�diaires, finance et administration"
"34" = "Professions interm�diaires des services juridiques, des services sociaux et assimil�s"
"35" = "Techniciens de l'information et des communications"
"40" = "Clerical, administrative and supervisory workers"
"41" = "Employ�s de bureau"
"42" = "Employ�s de rec�ptions, quicetiers et assimil�s"
"43" = "Employ�s des services comptables et d'approvisionnement"
"44" = "Autre employ�s de type administratif"
"50" = "Workers in services, shops and markets"
"51" = "Personnel des services directs aux particuliers"
"52" = "Commercants et vendeurs"
"53" = "Personnel soignants"
"54" = "Personnel des services de protection et de s�curit�"
"60" = "Agriculture, forestry and fishing"
"61" = "Agriculteurs et ouvriers qualifi�s de l'agriculture commerciale"
"62" = "Professions commerciales qualifi�es de la sylviculture, de la peche et de la chasse"
"63" = "Agriculteurs, pecheurs, chasseurs et cuellleurs de substistance"
"70" = "Skilled manual workers"
"71" = "M�tiers qualifi�s du batiment et assimil�s, sauf �lectriciens"
"72" = "M�tiers qualifi�s de la m�tallurgie, de la construction m�canique et assimil�s"
"73" = "M�tiers qualifi�s de l'artisanat et de l'imprimerie"
"74" = "M�tiers de l'�lectricit� et de l'�lectrotechnique"
"75" = "M�tiers de l'alimentation, du travail sur bois, de l'habillement et autres m�tiers qualifi�s de l'industrie et de l'artisanat"
"80" = "Silled workers in transport and industry"
"81" = "Conducteurs de machines et d'installations fixes"
"82" = "Ouvries de l'assemblage"
"83" = "Conducteurs de v�hicules de d'engins lourds de levage et de manoeuvre"
"90" = "Unskille manual workers"
"91" = "Aides de m�nage"
"92" = "Manoeuvres de l'agriculture, de la peche et de la sylviculture"
"93" = "Manoeuvres des mines, du batiments et des travaux publics, des industries manufacturi�res et des transportations"
"94" = "Assistants de fabrication de l'alimentation"
"95" = "Vendeurs ambulants et autres travailleurs des petits m�tiers des rues et assimil�s"
"96" = "Eboueurs et autres travailleurs non qualifi�s"
"97" = "Etudiants"
"98" = "Ne sait pas"
;
value $cv705a
"0" = "Na travaillait pas"
"1" = "Prof., Tech., Manag."
"2" = "Clerg�"
"3" = "Vendeur"
"4" = "Auto-entrepreneur agricole"
"5" = "Employ� agricole"
"6" = "Domestique"
"7" = "Services"
"8" = "Travailleur qualifi�"
"9" = "Travailleur non-qualifi�"
"98" = "ne sait pas"
;
value $cv714a
"0" = "Non"
"1" = "Oui"
;
value $cv716a
"0" = "Ne travaille pas"
"1" = "Officiers de forces arm�es"
"2" = "Sous-officiers des forces arm�es"
"3" = "Autres membres des forces arm�es"
"5" = "Retrait"
"6" = "Autre profession"
"10" = "Senior public administrators and senior business directors"
"11" = "Directeurs g�n�raux, cadres sup�rieurs et miembres de l'Ex�ctif et des corps l�gislatifs"
"12" = "Directeurs de services administratifs et commerciaux"
"13" = "Directeurs et cadres de direction, production et services sp�cialis�s"
"14" = "Dorecteurs et g�rants de l'hotellerie, la restauration, le commerce et autres services"
"20" = "Skilled professional workers"
"21" = "Sp�cialistes des sciences techniques"
"22" = "Sp�cialistes de la sant�"
"23" = "Sp�cialistes de l'enseignements"
"24" = "Sp�cialistes en adminstration d'entreprises"
"25" = "Sp�cialistes des technologies de l'information et des communications"
"26" = "Sp�cialistes de la justice, des sciences sociales et de la culture"
"30" = "Intermediate level professional workers"
"31" = "Professions interm�diaires des sciences et techniques"
"32" = "Professions interm�diaires de la sant�"
"33" = "Professions interm�diaires, finance et administration"
"34" = "Professions interm�diaires des services juridiques, des services sociaux et assimil�s"
"35" = "Techniciens de l'information et des communications"
"40" = "Clerical, administrative and supervisory workers"
"41" = "Employ�s de bureau"
"42" = "Employ�s de rec�ptions, quicetiers et assimil�s"
"43" = "Employ�s des services comptables et d'approvisionnement"
"44" = "Autre employ�s de type administratif"
"50" = "Workers in services, shops and markets"
"51" = "Personnel des services directs aux particuliers"
"52" = "Commercants et vendeurs"
"53" = "Personnel soignants"
"54" = "Personnel des services de protection et de s�curit�"
"60" = "Agriculture, forestry and fishing"
"61" = "Agriculteurs et ouvriers qualifi�s de l'agriculture commerciale"
"62" = "Professions commerciales qualifi�es de la sylviculture, de la peche et de la chasse"
"63" = "Agriculteurs, pecheurs, chasseurs et cuellleurs de substistance"
"70" = "Skilled manual workers"
"71" = "M�tiers qualifi�s du batiment et assimil�s, sauf �lectriciens"
"72" = "M�tiers qualifi�s de la m�tallurgie, de la construction m�canique et assimil�s"
"73" = "M�tiers qualifi�s de l'artisanat et de l'imprimerie"
"74" = "M�tiers de l'�lectricit� et de l'�lectrotechnique"
"75" = "M�tiers de l'alimentation, du travail sur bois, de l'habillement et autres m�tiers qualifi�s de l'industrie et de l'artisanat"
"80" = "Silled workers in transport and industry"
"81" = "Conducteurs de machines et d'installations fixes"
"82" = "Ouvries de l'assemblage"
"83" = "Conducteurs de v�hicules de d'engins lourds de levage et de manoeuvre"
"90" = "Unskille manual workers"
"91" = "Aides de m�nage"
"92" = "Manoeuvres de l'agriculture, de la peche et de la sylviculture"
"93" = "Manoeuvres des mines, du batiments et des travaux publics, des industries manufacturi�res et des transportations"
"94" = "Assistants de fabrication de l'alimentation"
"95" = "Vendeurs ambulants et autres travailleurs des petits m�tiers des rues et assimil�s"
"96" = "Eboueurs et autres travailleurs non qualifi�s"
"97" = "Etudiants"
"98" = "Ne sait pas"
;
value $cv717a
"0" = "Na travaillait pas"
"1" = "Prof., Tech., Manag."
"2" = "Clerg�"
"3" = "Vendeur"
"4" = "Auto-entrepreneur agricole"
"5" = "Employ� agricole"
"6" = "Domestique"
"7" = "Services"
"8" = "Travailleur qualifi�"
"9" = "Travailleur non-qualifi�"
"98" = "ne sait pas"
;
value $cv719a
"1" = "Pour les membres de la famille"
"2" = "Pour quelqu'un d'autre"
"3" = "Auto-entrepreneur"
;
value $cv721a
"1" = "A la maison"
"2" = "Ailleurs"
;
value $cv729a
"0" = "Pas d'�ducation"
"1" = "Primaire incompl�te"
"2" = "Primaire compl�te"
"3" = "Secondaire incompl�te"
"4" = "Secondaire compl�te"
"5" = "Sup�rieure"
"8" = "Ne sait pas"
;
value $cv731a
"0" = "Non"
"1" = "Durant la derni�re ann�e"
"2" = "A actuellement un travail"
"3" = "A un travail mais en cong� ces 7 derniers jours"
;
value $cv732a
"1" = "A l'ann�e"
"2" = "Saisonnier"
"3" = "Occasionnel"
;
value $cv739a
"1" = "R�pondant seul"
"2" = "R�pondant et mari/partenaire"
"3" = "R�pondant et autre personne"
"4" = "Mari/partenaire seul"
"5" = "Quelqu'un d'autre"
;
value $cv740a
"0" = "Propri�t� personnelle"
"1" = "Propri�t� familiale"
"2" = "Propri�t� d'un tiers"
"3" = "Terre lou�e"
"8" = "Ne sait pas"
;
value $cv741a
"0" = "Non pay�"
"1" = "En esp�ce seulement"
"2" = "Esp�ce et en nature"
"3" = "En nature seulement"
;
value $cv744a
"0" = "Si la femme ne m�rite pas d'�tre battue" 
"1" = "Si la femme m�rite d'�tre battue quand elle sort sans le dire � son mari"
"2" = "Si la femme m�rite d'�tre battue quand elle n�glige les enfants"
"3" = "Si la femme m�rite d'�tre battue quand elle s'oppose � son mari"
"4" = "Si la femme m�rite d'�tre battue quand elle refuse une relation sexuelle avec son mari"
"5" = "Si la femme m�rite d'�tre battue quand elle br�le la nourriture"
;
value $cv746a
"1" = "Plus que lui"
"2" = "Moins que lui"
"3" = "A peu pr�s la m�me chose"
"4" = "Le partenaire n'apporte pas d'argent"
"8" = "Ne sait pas"
;
value $cv750a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv751a
"0" = "Non"
"1" = "Oui"
;
value $cv756a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv761a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv762a
"0" = "Pas de pr�servatifs" 
"1" = "Hopital de type II"
"2" = "Centre de sant� de base II"
"3" = "Clinique du planning familial"
"4" = "Hopital de type I"
"5" = "Hopital priv�/clinique" 
"6" = "Pharmacie"
"7" = "M�decin lib�ral"
"8" = "Centre de sant� priv�"
"9" = "Centre priv� PF/FISA"
"10" = "Magasin"
"11" = "Eglise"
"12" = "Amis ou connaissances"
"13" = "Agent VBC"
"14" = "Kiosque"
"15" = "Ailleurs"
"16" = "Ne sait pas"
;
value $cv763a
"0" = "Pas de pr�servatifs" 
"1" = "Hopital de type II"
"2" = "Centre de sant� de base II"
"3" = "Clinique du planning familial"
"4" = "Clinique mobile"
"5" = "Travailleur du secteur public" 
"6" = "Autre secteur du domaine public"
"7" = "H�pital priv�, d'une clinique"
"8" = "Pharmacie"
"9" = "M�decin lib�ral"
"10" = "Clinique mobile priv�e"
"11" = "Travailleur du secteur priv�"
"12" = "Autres priv�s"
"13" = "Magazin"
"14" = "Eglise"
"15" = "Amis ou connaissances"
"16" = "Ailleurs"
"17" = "Ne sait pas"
;
value $cv769a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv770a
"0" = "Non"
"1" = "Oui"
;
value $cv777a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv778a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv779a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv780a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv781a
"0" = "Non"
"1" = "Oui"
;
value $cv783a
"0" = "Non"
"1" = "Oui"
;
value $cv785a
"0" = "Non"
"1" = "Oui"
;
value $cv793a
"0" = "Non"
"1" = "Oui"
;
value $cv820a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv822a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv823a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv824a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv825a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv826a
"1" = "Moins de 12 mois"
"2" = "12-23 mois"
"3" = "2 ans ou plus"
;
value $cv831a
"1" = "Plus jeune"
"2" = "A peu pr�s le m�me �ge"
"3" = "Moins de 10 ans de plus"
"4" = "10 ou plus de 10 de plus"
"5" = "Plus �g�, ne connait pas la diff�rence"
"8" = "Ne sait pas"
;
value $cv849a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv384a
"0" = "Non"
"1" = "Oui"
;
value $cv384b
"0" = "Non"
"1" = "Oui"
;
value $cv384c
"0" = "Non"
"1" = "Oui"
;
value $cv3a07a
"10" = "PUBLIC"
"11" = "H�pital (CHD II)"
"12" = "H�pital (CHD I)"
"13" = "H�pital (CHU, CHRR)"
"14" = "Centre de sant� (de base II)"
"15" = "Centre de sant� (de base I)"
"16" = "Autre public"
"20" = "Secteur priv�"
"21" = "Clinique/H�pital priv�"
"22" = "Pharmacie priv�e"
"23" = "M�decin lib�ral"
"24" = "Centre de sant� priv�"
"25" = "Centre PF/FISA"
"26" = "Autre priv�"
"30" = "Autre priv�" /* Les deux sont identiques, dans les formats originaux */
"31" = "Agent VBC"
"32" = "Spots m�dias"
"33" = "Magasins"
"34" = "Kiosque"
"35" = "Eglise"
"36" = "Amis/parents"
"37" = "Ecole"
"96" = "Autre"
"98" = "Ne sait pas"
;
value $cv3a08a
"1" = "Non-mari�e"
"2" = "Pas de relation sexuelle"
"3" = "Relations sexuelles non-fr�quentes"
"4" = "M�nopaus�e"
"5" = "Inf�conde"
"6" = "Am�nhor�e post-partum"
"7" = "Allaitement"
"8" = "Fataliste"
"9" = "La r�pondante y est oppos�e"
"10" = "Le mari/partenaire y est oppos�"
"11" = "D'autres y sont oppos�s"
"12" = "Interdit religieux"
"13" = "Ne connait pas m�thodes"
"14" = "Ne connait pas de sources"
"15" = "A des probl�mes de sant�"
"16" = "A peur des effets secondaires"
"17" = "L'acc�s est trop compliqu�/trop loin"
"18" = "Le co�t est trop �lev�"
"19" = "C'est g�n�nt � utiliser"
"20" = "Cela interf�re avec les fonctions corporelles"
"21" = "Autres"
"22" = "Ne sait pas"
;
value $cv3b25a
"0" = "Pas d'accord"
"1" = "D'accord"
"8" = "Ne sait pas"
;
value $cv3b25b
"0" = "Pas d'accord"
"1" = "D'accord"
"8" = "Ne sait pas"
;
value $cv743b
"1" = "R�pondant seul"
"2" = "R�pondant et mari/partenaire"
"3" = "R�pondant et autre personne"
"4" = "Mari/partenaire seul"
"5" = "Quelqu'un d'autre"
"6" = "Autres"
;
value $cv743c
"1" = "R�pondant seul"
"2" = "R�pondant et mari/partenaire"
"3" = "R�pondant et autre personne"
"4" = "Mari/partenaire seul"
"5" = "Quelqu'un d'autre"
"6" = "Autres"
;
value $cv743d
"1" = "R�pondant seul"
"2" = "R�pondant et mari/partenaire"
"3" = "R�pondant et autre personne"
"4" = "Mari/partenaire seul"
"5" = "Quelqu'un d'autre"
"6" = "Autres"
;
value $cv743f
"1" = "R�pondant seul"
"2" = "R�pondant et mari/partenaire"
"3" = "R�pondant et autre personne"
"4" = "Mari/partenaire seul"
"5" = "Quelqu'un d'autre"
"6" = "Autres"
;
value $cv743g
"1" = "R�pondant seul"
"2" = "R�pondant et mari/partenaire"
"3" = "R�pondant et autre personne"
"4" = "Mari/partenaire seul"
"5" = "Quelqu'un d'autre"
"6" = "Autre"
;
value $cv747a
"0" = "Pas d'accord"
"1" = "D'accord"
"8" = "Ne sait pas"
;
;
value $cv747b
"0" = "Pas d'accord"
"1" = "D'accord"
"8" = "Ne sait pas"
;
;
value $cv767a
"1" = "Epouse"
"2" = "Petit copain ne vit pas avec la r�pondante"
"3" = "Autre ami"
"4" = "Simple connaissance"
"5" = "Parent"
"6" = "Travailleur du sexe"
"7" = "Conjoint"
"96" = "Autre"
;
value $cv769a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv833a
"0" = "Non"
"1" = "Oui"
;
value $cv850a
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv850b
"0" = "Non"
"1" = "Oui"
"8" = "Ne sait pas"
;
value $cv000a
"1" = "Homme"
"2" = "Femme"
;
run;

options fmtsearch=(ter);

data ter.individus;
set ter.individus;
drop v001 cv004 v020 cv023 cv029 v040 cv139 cv140 v190 v191 v319 v320 v321 v325a v325b v446 v457 
v464 cv482 v513 cv535 cv536 cv623 cv624 cv705 cv717 cv731 cv767a cv793;
run;

proc contents data=ter.individus;
run;
