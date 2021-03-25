/*	creation du repertoire et des macrovariables de chemins associes */
	/*	macrovariables de chemins */
	
%let pathTheoPerso = /folders/myfolders/madagascar/data/individus;

	/*	creation repertoire */
libname projet "&pathTheoPerso";

	/*	importation des formats */
options fmtsearch = (projet);

/*	creation de la variable sexe pour fusionner*/

data projet.hommes;
set projet.MDMR51FL;
sexe = 1;
run;

data projet.femmes;
set projet.MDIR51FL;
sexe = 2;
run;

/*	preparation à la fusion des deux tables */
data projet.hommes;
set projet.hommes;
keep 
	sexe 
	mcaSeId 
	mv001 
	mv002 
	mv004 
	mv005 
	mv012 
	mv023 
	mv029 
	mv101 
	mv102 
	mv106 
	mv107 
	mv130 
	mv133 
	mv149 
	mv150 
	mv151 
	mv155 
	mv156 
	mv157 
	mv158 
	mv159
	mv190 
	mv191 
	mv201 
	mv202 
	mv203 
	mv204 
	mv205 
	mv206 
	mv207 
	mv218 
	mv301 
	mv302 
	mv312 
	mv313 
	mv384a 
	mv384b 
	mv384c 
	mv464 
	mv481 
	mv501 
	mv502 
	mv503 
	mv504 
	mv505
	mv511 
	mv513 
	mv535 
	mv536 
	mv602 
	mv605 
	mv613 
	mv621 
	mv627 
	mv628 
	mv629 
	mv714 
	mv716 
	mv717 
	mv719 
	mv721 
	mv731 
	mv732 
	mv739 
	mv740 
	mv741 
	mv750 
	mv751 
	mv756 
	mv761
	mv769 
	mv770 
	mv777 
	mv778 
	mv779 
	mv780 
	mv781 
	mv783 
	mv785 
	mv820 
	mv822 
	mv823 
	mv824 
	mv825 
	mv826 
	mv836 
	mv849
	mv463a--mv463z 
	mv481a--mv481X 
	mv744a--mv744e 
	mv762aa--mv762aZ 
	mv762ba--mv762bZ 
	mv767a 
	mv769a 
	mv833a
	mv793 
	mv325b 
	mv3a09b 
	mv3b17 
	mv3b25a 
	mv3b25b 
	mv634a 
	mv634b 
	mv634c 
	mv634d 
	mv743b--mv743g 
	mv747a 
	mv747b;
drop
	mv463e--mv463g;
rename 
	mcaseid = caseid 
	mv001-mv849 = v001-v849 
	mv384a = v384a 
	mv384b = v384b 
	mv384c = v384c 
	mv463a = v463a 
	mv463b = v463b 
	mv463c = v463c 
	mv463d = v463d 
	mv463x = v463x 
	mv463z = v463z
	mv481a = v481a 
	mv481b = v481b 
	mv481c = v481c 
	mv481d = v481d 
	mv481e = v481e 
	mv481f = v481f 
	mv481g = v481g 
	mv481h = v481h 
	mv481i = v481i 
	mv481j = v481j 
	mv481k = v481k 
	mv481l = v481l
	mv481m = v481m 
	mv481n = v481n 
	mv481o = v481o 
	mv481p = v481p 
	mv481q = v481q 
	mv481r = v481r 
	mv481s = v481s 
	mv481t = v481t 
	mv481u = v481u 
	mv481v = v481v 
	mv481w = v481w 
	mv481X = v481x
	mv744a = v744a 
	mv744b = v744b 
	mv744c = v744c 
	mv744d = v744d 
	mv744e = v744e
	mv762aa = v762aa 
	mv762ab = v762ab 
	mv762ac = v762ac 
	mv762ad = v762ad 
	mv762ae = v762ae 
	mv762af = v762af 
	mv762ag = v762ag 
	mv762ah = v762ah 
	mv762ai = v762ai 
	mv762aj = v762aj 
	mv762ak = v762ak 
	mv762al = v762al 
	mv762am = v762am 
	mv762an = v762an 
	mv762ao = v762ao 
	mv762ap = v762ap 
	mv762aq = v762aq 
	mv762ar = v762ar 
	mv762as = v762as 
	mv762at = v762at
	mv762au = v762au 
	mv762av = v762av 
	mv762aw = v762aw 
	mv762ax = v762ax 
	mv762ay = v762ay 
	mv762aZ = v762az
	mv762ba = v762ba 
	mv762bb = v762bb 
	mv762bc = v762bc 
	mv762bd = v762bd 
	mv762be = v762be 
	mv762bf = v762bf 
	mv762bg = v762bg 
	mv762bh = v762bh 
	mv762bi = v762bi 
	mv762bj = v762bj
	mv762bk = v762bk 
	mv762bl = v762bl 
	mv762bm = v762bm 
	mv762bn = v762bn 
	mv762bo = v762bo 
	mv762bp = v762bp 
	mv762bq = v762bq 
	mv762br = v762br 
	mv762bs = v762bs 
	mv762bt = v762bt
	mv762bu = v762bu 
	mv762bv = v762bv 
	mv762bw = v762bw 
	mv762bx = v762bx 
	mv762by = v762by 
	mv762bZ = v762bz
	mv767a = v767a 
	mv769a = v769a 
	mv833a = v833a 
	mv325b = v325b 
	mv3a09b = v3a09b 
	mv3b17 = v3b17 
	mv3b25a = v3b25a 
	mv3b25b = v3b25b 
	mv634a = v634a 
	mv634b = v634b 
	mv634c = v634c 
	mv634d = v634d
	mv743b = v743b 
	mv743c = v743c 
	mv743d = v743d 
	mv743e = v743e 
	mv743f = v743f 
	mv743g = v743g
	mv747a = v747a 
	mv747b = v747b;
run;

data projet.femmes;
set projet.femmes;
keep 
	sexe 
	caSeId 
	v001 
	v002 
	v004 
	v005 
	v012 
	v020 
	v023 
	v029 
	v034 
	v040 
	v101 
	v102 
	v106 
	v107 
	v123 
	v124
	v125
	v130
	v133 
	v139
	v141
	v149
	v150
	v151
	v153
	v155
	v156
	v157
	v158
	v159
	v190
	v191
	v201
	v202
	v203 
	v204 
	v205
	v206
	v207
	v208
	v218
	v301
	v302
	v312 
	v313
	v319
	v320
	v321 
	v325a
	v364
	v367
	v376
	v384a
	v384b
	v384c
	v446 
	v457 
	v464
	v481
	v501
	v502
	v503
	v504
	v505
	v506
	v511 
	v513
	v535
	v536
	v602 
	v605
	v613
	v621
	v623
	v624
	v627
	v628
	v629
	v632 
	v634 
	v701 
	v702
	v704
	v705 
	v714
	v715
	v716
	v717
	v719
	v721
	v729 
	v730
	v731 
	v732 
	v739 
	v740 
	v741
	v746
	v750 
	v751 
	v756
	v761 
	v769 
	v770
	v777
	v778
	v779
	v780
	v781
	v783 
	v785 
	v820
	v822
	v823 
	v824 
	v825
	v826 
	v830
	v831
	v836 
	v849
	v3a07
	v3a08a--v3a08z
	v463a--v463z
	v467b--v467i
	v481a--v481x
	v744a--v744e 
	v762aa--v762az
	v762ba--v762bz 
	v767a
	v769a 
	v833a 
	v834a 
	v850a--v850b;
run;

/****					****/
/***	table hommes	 ***/
/****					****/

	/*	donnees sur les cigarettes, creation de la variable fume */
proc freq data = projet.hommes;
table v463a--v463z;
run;

data projet.hommes;
set projet.hommes ;
if v463z = 1 then v463 = 1;
if v463z = 0 then v463 = 0;
label 
	v463 = 'Fume';
drop 
	v463a--v463z;
run;

proc freq data = projet.hommes;
table v463;
run;

	/*	donnees sur la maltraitance de la femme */
proc freq data = projet.hommes;
table v744a--v744e;
run;

data projet.hommes;
set projet.hommes;
if v744a = 1 then v744 = 1;
if v744b = 1 then v744 = 2;
if v744c = 1 then v744 = 3;
if v744d = 1 then v744 = 4;
if v744e = 1 then v744 = 5;
if v744a = v744b = v744c = v744d = v744e = 0 then v744 = 0;
label 
	v744 = 'Maltraitance justifiee si...';
run;

proc freq data = projet.hommes;
table v744;
run;

/* 168 donn�es manquantes pour la variable cr��e, soit une perte de donn�es, s�rement parce
que les raisons ne se croisent pas */

	/*	*/
proc freq data = projet.hommes;
table v762aa--v762az;
run;

data projet.hommes;
set projet.hommes;
if v762aa = 1 then v762 = 1;
if v762ab = 1 then v762 = 2;
if v762ag = 1 then v762 = 3;
if v762ah = 1 then v762 = 4;
if v762aj = 1 then v762 = 5;
if v762ak = 1 then v762 = 6;
if v762al = 1 then v762 = 7;
if v762ap = 1 then v762 = 8;
if v762aq = 1 then v762 = 9;
if v762as = 1 then v762 = 10;
if v762at = 1 then v762 = 11;
if v762au = 1 then v762 = 12;
if v762av = 1 then v762 = 13;
if v762aw = 1 then v762 = 14;
if v762ax = 1 then v762 = 15;
if v762az = 1 then v762 = 16;
if v762aa = v762ab = v762ag = v762ah = v762aj = v762ak = v762al = v762ap = v762aq = v762as = v762at = v762au = v762av = v762aw = v762ax = v762az = 0 then v762 = 0;
label v762 = 'Source for condoms';
drop v762aa--v762az;
run;

proc freq data = projet.hommes;
table v762 v762aa--v762az;
run;

/* 25 donn�es manquantes, soit �quivalent aux variables de base. Pas de donn�es perdues, mais pas 
de r�ponses 0 sur cette variable, ie pas de pr�servatifs du tout */

proc freq data = projet.hommes;
table v634a v634b v634c v634d;
run;

data projet.hommes;
set projet.hommes;
if v634a = 1 then v635 = 1;
if v634b = 1 then v635 = 2;
if v634c = 1 then v635 = 3;
if v634d = 1 then v635 = 4;
if v634a = v634b = v634c = v634d = 0 then v635 = 0;
if v634a = v634b = v634c = v634d = 8 then v635 = 0;
label v635 = 'Le mari a le droit...';
drop v634a--v634d;
run;

proc freq data = projet.hommes;
table v635 v634a v634b v634c v634d;
run;

/* 650 donn�es manquantes. Pourquoi ? */

proc freq data = projet.hommes;
table v743b--v743g;
run;

data projet.hommes;
set projet.hommes;
drop v743e;
run;

/* compliquer de cr�er une variable r�sumant celles-ci, �tant donn�es que les r�ponses ne se recoupent pas selon
les variables. On se contente d'enlever celle n'ayant pas de r�ponses */

proc freq data = projet.hommes;
table v739;
run;

/* Trop de donn�es manquantes pour v739, who decides to spend money (4978 donn�es manquantes.
8 modalit�s pour ces variables : mari = 1 Femme = 2 egalit� = 4 NSP = 8 */

proc contents data = projet.hommes;
run;

data projet.hommes;
set projet.hommes;
drop v762ba--v762bz v621 v721 v769a;
run;

/* On enl�ve toutes les variables relatives au pr�servatif f�minin, sans donn�es, ainsi que celle sur le d�sir f�minin d'enfants,
travail � la maison ou dehors, possibilit� d'avoir ou non un pr�servatif f�minin */

proc contents data = projet.hommes;
run;

/*******************************************************/
/* Fusion des variables et nettoyage de la table femme */
/*******************************************************/

proc contents data = projet.gadji;
run;

/* On commence par faire le m�me travail qui a �t� fait sur la table homme, pour les variables
identiques */

proc freq data = projet.gadji;
table v463a--v463z;
run;

data projet.gadji;
set projet.gadji;
if v463a = 1 then v463 = 1;
if v463b = 1 then v463 = 2;
if v463c = 1 then v463c = 3;
if v463d = 1 then v463 = 4;
if v463x = 1 then v463 = 5;
if v463z = 1 then v463 = 0;
if v463a = v463b = v463c = v463d = v463x = 0 then v463 = 0;
label v463 = 'Smokes';
drop v463a--v463z;
run;

proc freq data = projet.gadji;
table v481 v481a--v481x;
run;

data projet.gadji;
set projet.gadji;
if v481a = 1 then v482 = 1;
if v481b = 1 then v482 = 2;
if v481c = 1 then v482 = 3;
if v481d = 1 then v482 = 4;
if v481a = v481b = v481c = v481d = v481x = 0 then v482 = 0;
label v482 = 'Health insurance type';
drop v481a--v481x;
run;

proc freq data = projet.gadji;
table v744a--v744e;
run;

data projet.gadji;
set projet.gadji;
if v744a = 1 then v744 = 1;
if v744b = 1 then v744 = 2;
if v744c = 1 then v744 = 3;
if v744d = 1 then v744 = 4;
if v744e = 1 then v744 = 5;
if v744a = v744b = v744c = v744d = v744e = 0 then v744 = 0;
label v744 = 'Wife beating justified if she...';
drop v744a--v744e; 
run;

proc freq data = projet.gadji;
table v762aa--v762az;
run;

data projet.gadji;
set projet.gadji;
if v762aa = 1 then v762 = 1;
if v762ab = 1 then v762 = 2;
if v762ag = 1 then v762 = 3;
if v762ah = 1 then v762 = 4;
if v762aj = 1 then v762 = 5;
if v762ak = 1 then v762 = 6;
if v762al = 1 then v762 = 7;
if v762ap = 1 then v762 = 8;
if v762aq = 1 then v762 = 9;
if v762as = 1 then v762 = 10;
if v762at = 1 then v762 = 11;
if v762au = 1 then v762 = 12;
if v762av = 1 then v762 = 13;
if v762aw = 1 then v762 = 14;
if v762ax = 1 then v762 = 15;
if v762az = 1 then v762 = 16;
if v762aa = v762ab = v762ag = v762ah = v762aj = v762ak = v762al = v762ap = v762aq = v762as = v762at = v762au = v762av = v762aw = v762ax = v762az = 0 then v762 = 0;
label v762 = 'Source for condoms';
drop v762aa--v762az;
run;

/* cette fois-ci, il y a des r�ponses pour les pr�servatifs f�minins. Les questions sont les m�mes 
que pour le pr�servtatif masculin, on reprend donc la m�me typologie */

proc freq data = projet.gadji;
table v762ba--v762bz;
run;

data projet.gadji;
set projet.gadji;
if v762ba = 1 then v763 = 1;
if v762bb = 1 then v763 = 2;
if v762bc = 1 then v763 = 3;
if v762bd = 1 then v763 = 4;
if v762be = 1 then v763 = 5;
if v762bf = 1 then v763 = 6;
if v762bj = 1 then v763 = 7;
if v762bk = 1 then v763 = 8;
if v762bl = 1 then v763 = 9;
if v762bm = 1 then v763 = 10;
if v762bn = 1 then v763 = 11;
if v762bo = 1 then v763 = 12;
if v762bs = 1 then v763 = 13;
if v762bt = 1 then v763 = 14;
if v762bu = 1 then v763 = 15;
if v762bx = 1 then v763 = 16;
if v762bz = 1 then v763 = 17;
if v762ba = v762bb = v762bc = v762bd = v762be = v762bf = v762bj = v762bk = v762bl = v762bm = v762bn = v762bo = v762bs = v762bt = v762bu = v762bx = v762bz = 0 then v763 = 0;
label v763 = 'Source for female condoms';
drop v762ba--v762bz;
run;

/* maintenant, autres variables dont les diff�rentes modalit�s sont divis�es en diff�rentes variables
� regrouper en une seule � chaque fois, mais celles propre � la table femme */

proc freq data = projet.gadji;
table v3a07 v3a08a--v3a08z;
run;

data projet.gadji;
set projet.gadji;
if v3a08a = 1 then v3a08 = 1;
if v3a08b = 1 then v3a08 = 2;
if v3a08c = 1 then v3a08 = 3;
if v3a08d = 1 then v3a08 = 4;
if v3a08e = 1 then v3a08 = 5;
if v3a08f = 1 then v3a08 = 6;
if v3a08g = 1 then v3a08 = 7;
if v3a08h = 1 then v3a08 = 8;
if v3a08i = 1 then v3a08 = 9;
if v3a08j = 1 then v3a08 = 10;
if v3a08k = 1 then v3a08 = 11;
if v3a08l = 1 then v3a08 = 12;
if v3a08m = 1 then v3a08 = 13;
if v3a08n = 1 then v3a08 = 14;
if v3a08o = 1 then v3a08 = 15;
if v3a08p = 1 then v3a08 = 16;
if v3a08q = 1 then v3a08 = 17;
if v3a08r = 1 then v3a08 = 18;
if v3a08s = 1 then v3a08 = 19;
if v3a08t = 1 then v3a08 = 20;
if v3a08x = 1 then v3a08 = 21;
if v3a08z = 1 then v3a08 = 22;
label v3a08 = 'Reason not using method';
drop v3a08a--v3a08z;
run;

proc freq data = projet.gadji;
table v3a08;
run;

proc freq data = projet.gadji;
table v467b--v467i;
run;

data projet.gadji;
set projet.gadji;
if v467b = 2 then v467 = 1;
if v467c = 2 then v467 = 2;
if v467d = 2 then v467 = 3;
if v467e = 2 then v467 = 4;
if v467f = 2 then v467 = 5;
if v467g = 2 then v467 = 6;
if v467h = 2 then v467 = 7;
if v467i = 2 then v467 = 8;
label v467 = 'Getting medical help for self';
drop v467b--v467i;
run;

proc freq data = projet.gadji;
table v467;
run;

/* Pas s�r de la signification pour celle-ci, � revoir avec le dictionnaire et le questionnaire */

/* Les variables � fusionner l'ont �t�es. maintenant, il reste � supprimer les variables sans donn�es */

proc contents data = projet.gadji;
run;

data projet.gadji;
set projet.gadji;
drop v141;
run;

/*********************************************************************/
/* Fusion des tables hommes et femmes, cr�ation de la table individu */
/*********************************************************************/

data projet.individus;
set projet.gadji projet.hommes;
run;

proc contents data = projet.individus;
run;

/* v704 v705 : doublette partner occupation (pr�sente sur la table femme de base)
v716 v717 : la m�me chose (avec les m�mes modalit�s, � voir sur l'enqu�te la raison)
*/

proc freq data = projet.individus;
table v762 v3b17;
run;

proc freq data = projet.hommes;
table mv3b17;
run;

/* v762 : source for condoms, la variable pr�c�demment cr��e r�sumant les diff�rentes variables-modalit�s 
v3b17 : source of condoms, pos�e uniquement aux hommes, avec quasiment toutes les valeurs manquantes. 
On peut donc supprimer cette derni�re et ne garder que la premi�re.
aussi non, la table individus semble correcte. */

data projet.individus;
set projet.individus;
drop v3b17;
run;

/************************************************/
/* Transformation des variables quanti en quali */
/************************************************/

proc contents data = projet.individus;
run;

proc freq data = projet.individus;
table cv632 v632;
run;

data projet.individus;
set projet.individus;
cv000 = put(sexe, 8.);
cv004 = put(v004, 4.);
cv023 = put(v023, 3.);
cv029 = put(v029, 3.);
cv101 = put(v101, 3.);
cv102 = put(v102, 3.);
cv106 = put(v106, 3.);
cv123 = put(v123, 3.);
cv124 = put(v124, 3.);
cv125 = put(v125, 3.);
cv130 = put(v130, 3.);
cv139 = put(v139, 3.);
cv149 = put(v149, 3.);
cv150 = put(v150, 3.);
cv151 = put(v151, 3.);
cv153 = put(v153, 3.);
cv155 = put(v155, 3.);
cv156 = put(v156, 3.);
cv157 = put(v157, 3.);
cv158 = put(v158, 3.);
cv159 = put(v159, 3.);
cv301 = put(v301, 3.);
cv302 = put(v302, 3.);
cv312 = put(v312, 3.);
cv313 = put(v313, 3.);
cv364 = put(v364, 3.);
cv367 = put(v367, 3.);
cv376 = put(v376, 3.);
cv463 = put(v463, 8.);
cv467 = put(v467, 8.);
cv481 = put(v481, 3.);
cv482 = put(v482, 8.);
cv501 = put(v501, 3.);
cv502 = put(v502, 3.);
cv504 = put(v504, 3.);
cv535 = put(v535, 3.);
cv536 = put(v536, 3.);
cv602 = put(v602, 3.);
cv605 = put(v605, 3.);
cv621 = put(v621, 3.);
cv623 = put(v623, 3.);
cv624 = put(v624, 3.);
cv632 = put(v632, 3.);
cv634 = put(v634, 3.);
cv635 = put(v635, 8.);
cv701 = put(v701, 3.);
cv704 = put(v704, 3.);
cv705 = put(v705, 3.);
cv714 = put(v714, 3.);
cv716 = put(v716, 3.);
cv717 = put(v717, 3.);
cv719 = put(v719, 3.);
cv721 = put(v721, 3.);
cv729 = put(v729, 3.);
cv731 = put(v731, 3.);
cv732 = put(v732, 3.);
cv739 = put(v739, 3.);
cv740 = put(v740, 3.);
cv741 = put(v741, 3.);
cv744 = put(v744, 8.);
cv746 = put(v746, 3.);
cv750 = put(v750, 3.);
cv751 = put(v751, 3.);
cv756 = put(v756, 3.);
cv761 = put(v761, 3.);
cv762 = put(v762, 8.);
cv769 = put(v769, 3.);
cv770 = put(v770, 3.);
cv777 = put(v777, 3.);
cv778 = put(v778, 3.);
cv779 = put(v779, 3.);
cv780 = put(v780, 3.);
cv781 = put(v781, 3.);
cv783 = put(v783, 3.);
cv785 = put(v785, 3.);
cv793 = put(v793, 3.);
cv820 = put(v820, 3.);
cv822 = put(v822, 3.);
cv823 = put(v823, 3.);
cv824 = put(v824, 3.);
cv825 = put(v825, 3.);
cv826 = put(v826, 3.);
cv831 = put(v831, 3.);
cv849 = put(v849, 3.);
cv384a = put(v384a, 3.);
cv384b = put(v384b, 3.);
cv384c = put(v384c, 3.);
cv3a07 = put(v3a07, 3.);
cv3a08 = put(v3a08, 8.);
cv3b25a = put(v3b25a, 3.);
cv3b25b = put(v3b25b, 3.);
cv743b = put(v743b, 3.);
cv743c = put(v743c, 3.);
cv743d = put(v743d, 3.);
cv743f = put(v743f, 3.);
cv743g = put(v743g, 3.);
cv747a = put(v747a, 3.);
cv747b = put(v747b, 3.);
cv763 = put(v763, 8.);
cv767a = put(v767a, 3.);
cv769a = put(v769a, 3.);
cv833a = put(v833a, 3.);
cv850a = put(v850a, 3.);
cv850b = put(v850b, 3.);
run;

data projet.individus;
set projet.individus;
drop sexe v004 v023 v029 v101 v102 v106 v130 v149 v150 v151 v155 v156 v157 v158 v159 v301 v302 v312 v313 v463 v481 v482 v501 v502 v504 v535 v536 v602 v605 v632 v634 v635 v714 v716 v717 v719 v731 v732 v739 v740 v741 v744 v750 v751 v756 
v761 v762 v769 v770 v777 v778 v779 v780 v781 v783 v785 v793 v820 v822 v823 v824 v825 v826 v849 v384a v384b v384c v3b25a v3b25b v743b v743c v743d v743f v743g v747a v747b v767a v833a
v123 v124 v125 v139 v153 v364 v367 v376 v621 v623 v624 v701 v704 v705 v721 v729 v746 v763 v831 /*v384*/ v3a07 v769a v850a v850b v3a08 v467; 
run;

data projet.individus;
set projet.individus;
label
cv000 = "Sexe"
cv004 = "Ultimate area unit"
cv023 = "domaine de l'�chantillon"
cv029 = "Identifiant cl�"
cv101 = "R�gion"
cv102 = "Type de lieu de r�sidence"
cv106 = "Plus haut niveau d'�ducation"
cv123 = "a un v�lo" 
cv124 = "a un scooter"
cv125 = "a une voiture"
cv130 = "Religion"
cv139 = "R�gion de r�sidence de jure"
cv149 = "Niveau d'�ducation atteint"
cv150 = "Relation avec le chef de m�nage"
cv151 = "Sexe du chef de m�nage"
cv153 = "a le t�l�phone"
cv155 = "alphab�tisation"
cv156 = "a d�j� particip� � un programme d'alphab�tisation en dehors du primaire"
cv157 = "Fr�quence de lecture de journaux ou magazines"
cv158 = "Fr�quence d'�coute de la radio"
cv159 = "Fr�quence de visionnage de la t�l�vision"
cv301 = "connaissance de n'importe quelle m�thode"
cv302 = "a d�j� utilis� n'importe quelle m�thode"
cv312 = "m�thode de contraception actuelle"
cv313 = "Utilisation actuelle par type de m�thode"
cv364 = "Utilisation de la contraception et intention"
cv367 = "dernier enfant voulu"
cv376 = "Principale raison pour ne pas se prot�ger"
cv463 = "Fume"
cv467 = "va chercher de l'aide m�dical pour soi"
cv481 = "couvert par l'assurance maladie"
cv482 = "Type de couverture d'assurance maladie"
cv501 = "Statut marital actuel"
cv502 = "actuellement/anciennement/jamais mari�"
cv504 = "Femme/partenaire vie � la maison"
cv535 = "dur�e du mariage"
cv536 = "R�cente activit� sexuelle"
cv602 = "Pr�f�rence de fertilit�"
cv605 = "d�sir pour plus d'enfants"
cv621 = "d�sir de la femme pour les enfants" 
cv623 = "exposition"
cv624 = "besoin non satisfait"
cv632 = "d�cideur pour l'utilisation de la contraception"
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
cv731 = "a travaill� ces 12 derni�res heures"
cv732 = "Travail annuel/saisonnier"
cv739 = "Qui d�cide comment d�penser l'argent"
cv740 = "Type de terre o� le responsable travaille"
cv741 = "Type de revenu du travail"
cv744 = "battre sa femme est justifi� si"
cv746 = "Gagne plus que le partenaire"
cv750 = "a entendu parler des mST"
cv751 = "a entendu parler du SIda"
cv756 = "est-ce qu'une personnne en bonne sant� peut avoir le SIda"
cv761 = "derni�re fois qu'un pr�servatif a �t� utilis�"
cv762 = "Provenance des pr�servatifs"
cv763 = "Provenance des pr�servatifs f�minins"
cv769 = "Peut obtenir un pr�servatif"
cv770 = "a cherch� des conseils pour la derni�re maladie"
cv777 = "Il est autoris� de garder une infection du SIda secr�te"
cv778 = "Pr�t � s'occuper de proches infect�s par le SIda"
cv779 = "Les personnes infect�es par le SIda sont autoris�es � continuer � enseigner"
cv780 = "Les enfants devraient apprendre � propos des pr�servatifs"
cv781 = "a d�j� �t� test� pour le SIda"
cv783 = "connait une place pour passer un test SIda"
cv785 = "a entendu parler d'autres mST"
cv793 = "a eu une relation sexuelle tarif�e ces derniers mois"
cv820 = "a utilis� un pr�servatif lors du premier rapport sexuel"
cv822 = "La femme a le droit de demander au mari d'utiliser un pr�servatif s'il a une mST"
cv823 = "Il est possible d'�tre infect� par le SIda par magie ou moyens supernaturels"
cv824 = "m�dicaments pour �viter la transmission du SIda au b�b� durant la grossesse"
cv825 = "acheteriez-vous des l�gumes � un vendeur ayant le SIda ?"
cv826 = "Quelle est la derni�re fois � vous �tre fait tester ?"
cv831 = "Premier partenaire sexeul plus jeune, m�me �ge ou plus �g�"
cv849 = "Les enfants de 12-14 ans devraient attendre jusqu'au mariage pour le sexe"
cv384a = "a entendu parler du PF � la radio les derniers mois"
cv384b = "a entendu parler du PF � la t�l�vision les derniers mois"
cv384c = "a entendu parler du PF dans les journaux les derniers mois"
cv3a07 = "Premi�re source pour la m�thode actuelle"
cv3a08 = "Raisons pour ne pas se prot�ger"
cv3b17 = "Porvenance des pr�servatifs"
cv3b25a = "La contraception est une affaire de femmes, l'homme n'a pas � s'y inqui�ter"
cv3b25b = "Les femmes qui se prot�gent d�veloppent des moeurs l�g�res" 
cv743b = "dernier mot sur les achats importants du m�nage"
cv743c = "dernier mot sur les achats journaliers du m�nage"
cv743d = "dernier mot pour rendre visite � de la famille ou des proches"
cv743f = "dernier mot sur quoi faire avec le revenu de la femme"
cv743g = "dernier mot sur le nombre d'enfants � avoir"
cv747a = "La procr�ation est une affaire de femme"
cv747b = "Important pour la sant� de la m�re/de l'enfant d'avoir une aide lors de l'accouchement"
cv767a = "Relation avec le dernier partenaire sexuel"
cv769a = "Peut obtenir un pr�servatif f�minin"
cv833a = "a utiliser un pr�servatif � chaque fois avec son dernier partenaire sexuel"
cv850a = "La r�pondante peut refuser une relation sexuelle"
cv850b = "elle peut demander � son partenaire d'uiliser un pr�servatif"
;
run;


ods pdf file = "\\salsa.univ-amu.fr\dfs\Profilsetud\b17026985\mes documents\TeR\code\table.pdf";
proc contents data = projet.individus;
run;
ods pdf close;

proc freq data = projet.individus;
run;

data projet.individus;
set projet.individus;
label
v001 = "Num�ro de cluster"
v002 = "Identifiant m�nage"
v005 = "Poids"
v012 = "age actuel du r�pondant"
v020 = "echantillon d�j� mari�"
v034 = "Num�ro de ligne du mari"
v040 = "altitude du cluster"
v107 = "Plus haute ann�e d'�ducation"
v133 = "education (ann�es)"
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
v319 = "ann�es depuis la st�rilisation"
v320 = "age � la st�rilisation"
v321 = "ann�es de mariage � la st�rilisation"
v446 = "Indice de Rohrer du r�pondant"
v457 = "Niveau d'an�mie"
v464 = "Nombre de cigarettes fum�es ces derni�res 24 heures"
v503 = "Nombre d'unions"
v505 = "Nombre d'autres femmes"
v506 = "Rang de la femme"
v511 = "age au premier mariage"
v513 = "dur�e du mariage (group�)"
v613 = "Nombre id�al d'enfants"
v627 = "Nombre id�al de gar�ons"
v628 = "Nombre id�al de filles"
v629 = "Nombre id�al des deux sexes"
v702 = "Plus haute ann�e d'�tude"
v715 = "ann�es d'�tudes du mari"
v730 = "age du partenaire"
v830 = "age du premier partenaire sexuel"
v836 = "Nombre total de partenaires sexuels au crous de la vie"
v325a = "co�t de la m�thode contraceptive actuelle"
v834a = "age du dernier partenaire sexuel"
v325b = "co�t des derniers pr�servatifs achet�s"
v3a09b = "combien de pr�servatifs obtenus la derni�re fois"
;
run;
