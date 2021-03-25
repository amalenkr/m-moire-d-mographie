/*	creation du repertoire et des macrovariables de chemins associes */
	/*	macrovariables de chemins */

%let pathAmaleUniv = C:\Users\n17017415\Desktop\Ter\codes;
%let pathAmalePerso = /folders/myfolders/TER;
%let pathTheoPerso = /folders/myfolders/Madagascar/data/menage;

	/*	creation repertoire */
libname ter "&pathAmaleUniv";

	/*	importation des formats */
options fmtsearch = (ter);

/*	creation de la table definitive menage a partir de la table MDHR51FL */
data ter.menage; 
set ter.MDHR51FL;
keep 
	HHID  
	hv005 
	hv009
	hv014
	hv024-hv025
	hv201
	hv202
	hv204-hv217
	hv219-hv221
	hv226-hv227
	hv235-hv241
	hv245-hv247 
	HA68_1-HA68_8 
	HB68_1-HB68_8 
	HC61_1-HC61_6
	hv106_01-hv106_24 
	hv109_01-hv109_24 
	hv243A 
	hv243B 
	hv243C 
	hv243D 
	hv246A;
run;
	
data ter.menage;
set ter.menage;
/* 	creation nouvelles variables*/
hv106 = max(of hv106_01-hv106_24);	
hv109 = max(of hv109_01-hv109_24);
HA68 = max(of ha68_01-ha68_8);
HB68 = max(of hb68_01-hb68_8);
HC61 = max(of hc61_01-hc61_7);	

chv106 = put(hv106, 1.); 
chv109 = put(hv109, 1.); 
chb68 = put(hb68, 1.); 
cha68 = put(ha68, 1.); 
chc61 = put(hc61, 2.); 

if (chv106 = "8") then chv106 = "n";
if (chv109 = "8") then chv109 = "n";
if (cha68 = "8") then cha68 = "n";
if (chb68 = "8") then chb68 = "n";
if (chc61 = "98") then chc61 = "n";
run;

/*suppression des anciennes variables regroupees */
data ter.menage; 
set ter.menage;
drop 
	hv237
	hc61_01-hc61_7 
	ha68_01-ha68_8 
	hb68_01-hb68_8 
	hv109_01-hv109_24 
	hv106_01-hv106_24; 
run;


/*	creation de nouvelles variables avec le bon type (alphanumerique) */
data ter.menage; 
set ter.menage;
chv024 = put(hv024, 2.); 
chv025 = put(hv025, 1.); 
chv201 = put(hv201, 2.); 
chv202 = put(hv202, 2.); 
chv205 = put(hv205, 2.);
chv206 = put(hv206, 1.); 
chv207 = put(hv207, 1.);
chv208 = put(hv208, 1.);
chv209 = put(hv209, 1.); 
chv210 = put(hv210, 1.); 
chv211 = put(hv211, 1.); 
chv212 = put(hv212, 1.); 
chv213 = put(hv213, 2.); 
chv214 = put(hv214, 2.); 
chv215 = put(hv215, 2.); 
chv217 = put(hv217, 1.);  
chv219 = put(hv219, 1.); 
chv221 = put(hv221, 1.);
chv226 = put(hv226, 2.); 
chv227 = put(hv227, 1.); 
chv235 = put(hv235, 1.); 
chv236 = put(hv236, 1.); 
chv239 = put(hv239, 1.);
chv240 = put(hv240, 1.); 
chv241 = put(hv241, 1.);
chv243a = put(hv243a, 1.); 
chv247 = put(hv247, 1.); 
chv243b = put(hv243b, 1.);
chv243c = put(hv243c, 1.); 
chv243d = put(hv243d, 1.); 
chv106 = put(hv106, 1.); 
chv109 = put(hv109, 1.); 
chb68 = put(hb68, 1.); 
cha68 = put(ha68, 1.); 
chc61 = put(hc61, 1.); 
run;

/* On renomme les copies des variables */
data ter.menage; set ter.menage;
label
	HHID = "Identifiant" 
	hv002 = "Numero du menage" 
	hv005 = "Poids sur l'echantillon"	
	hv009 = "Nombre d'habitants dans le menage" 
	hv228 = "Enfants de moins de 5 ans ayant dormi sous une moustiquaire la nuit derniere" 
	hv014 = "Nombre d'enfants de moins de 5 ans"	
	hv204 = "Temps pour aller chercher l'eau"
	hv238 = "Nombre d'individus partageant les toilettes" 
	hv216 = "Nombre de chambres a coucher"	
	hv220 = "Age du chef de menage" 
	hv245 = "Hectares terrain agriculture " 
	chv024 = "Region"	
	chv025 = "Type de lieu de residence"  
	chv201 = "Source d'eau potable"	
	hv246A = "Betail" 
	chv202 = "Source d'eau non potable"	
	chv205 = "Type d'instalation sanitaire" 
	chv206 = "Relie a l'electricite"	
	chv207 = "Equipe d'une radio"	
	chv208 = "Equipe d'une television" 
	chv209 = "Equipe d'un refrigirateur"
	chv210 = "Possede un velo"	 
	chv211 = "Possede un deux-roues motorise" 
	chv212 = "Possede une voiture/camionnette"	
	chv213 = "Materiau principal au sol"	
	chv214 = "Materiau principal au mur"
	chv215 = "Materiau principal sur le toit"	
	chv217 = "Structure du menage"	
	chv218 = "Line number of head of househ." 
	chv219 = "Sexe du chef de menage"	
	chv221 = "Possede le telephone"	
	chv226 = "Carburant utilise pour la cuisson des aliments"	
	chv227 = "Utilisation d'une moustiquaire"	
	chv235 = "Localisation de la source d'eau" 
	chv236 = "Personne qui va chercher l'eau"
	chv239 = "Cuisiner sur une cuisiniere/dehors"  
	chv240 = "Chemine, hotte, aucun des deux"	
	chv241 = "Nourriture cuisine dans le menage, dans un batiment separe, dehors" 
	chv246 = "Betails, troupeaux ou animaux de la ferme"  
	chv247 = "Possede un compte en banque" 
	chv243A = "A un telephone mobile" 
	chv243b = "A une montre" 
	chv243c = "A un chariot tire par des animaux" 
	chv243d = "A un bateau e moteur" 
	chv106 = "Plus haut niveau d'education"
	chv109	= "Niveau d'education atteint" 
	chb68 = "Plus haut niveau d'education hommes" 
	cha68 = "Plus haut niveau d'education femmes" 
	chc61 = "Plus haut niveau d'education meres";
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

/* 	suppression des anciennes variables quantitatives */
data ter.menage;
set ter.menage;
drop 
	hv024-hv025 
	hv201-hv219 
	hv221 
	hv226-hv228 
	hv235-hv237 
	hv239-hv241 
	hv244 
	hv246-hv247 
	hv243b 
	hb68 
	ha68 
	hv243a
	hv243c 
	hv243d 
	hv106 
	hv109 
	hc61; 
run;

/* creation de variables */
data ter.menage;	set ter.menage;
	/* creation variable media	cHV229 */
if (chv207 = 1) or (chv208 = 1) then cHV229 = "1";
if (chv207 = 0) and (chv208 = 0) then cHV229 = "0";
	/* creation variable locomotion	cHV230 */
if (chv210 = 1) or (chv211 = 1) or (chv212 = 1) then cHV230 = "1";
if (chv210 = 0) and (chv211 = 0) and (chv212 = 0) then cHV230 = "0";
format
chv229-chv230 $binaire.;
label
chv229 = "Media"	chv230 = "Moyen de locomotion";	run;

/*	affichage du dictionnaire des variables*/
proc contents data = ter.menage; run;
