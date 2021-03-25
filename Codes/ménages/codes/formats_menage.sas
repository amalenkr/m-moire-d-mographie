/* Rappel des macrovariables, repertoires, formats et pieds de page */
%let pathAmaleUniv = C:\Users\n17017415\Desktop\Ter\codes;
%let pathAmalePerso = /folders/myfolders/TER;
%let pathTheoPerso = /folders/myfolders/Madagascar/data/menage;

/* creation repertoire */
libname ter "&pathAmaleUniv";

/***************************/
/* Variables quantitatives */
/***************************/
proc format library = ter;
value hv220a
	low-4 = "moins de 5 ans"	
	5-9 = "5 a 9 ans"	
	10-14 = "10 a 14 ans"	
	15-19 = "15 a 19 ans"	
	20-24 = "20 a 24 ans"	
	25-29 = "25 a 29 ans"
	30-34 = "30 a 34 ans"	
	35-39 = "35 a 39 ans"	
	40-44 = "40 a 44 ans"	
	45-49 = "45 a 49 ans"
	50-54 = "50 a 54 ans"	
	55-59 = "55 a 59 ans"
	60-64 = "60 a 64 ans"	
	65-69 = "65 a 69 ans"
	70-74 = "70 a 74 ans"	
	75-79 = "75 a 79 ans"
	80-high = "plus de 80 ans";

value hv204a
   	996 = "Sur les lieux" 
   	998 = "Ne sait pas";

value hv245a
     0 = "Moins d'un hectare" 
     95 = "Plus de 95" 
     98 = "Inconnu";

value hv246a
     0 = "Aucun" 
     95 = "Plus de 95" 
     98 = "Inconnu";
 
value hml1a
    98 = "Ne sait pas";

value hv238a
    95 = "10 ou +" 
    98 = "Ne sait pas"; 
run;
      
/***************************/
/* Variables qualitatives  */
/***************************/
proc format library = ter;
value $hv024a
    11 = "Analamanga" 
    12 = "Vakinankaratra" 
    13 = "Itasy" 
    14 = "Bongolava" 
    21 = "Haute Matsiatra" 
    22 = "Anamoroni'i Mania"
    23 = "Vatovavy Fitovinany" 
    24 = "Ihorombe" 
    25 = "Atsimo Atsinanana" 
    31 = "Atsinanana"  
    32 = "Analanjirofo" 
    33 = "Alaotra Mangoro"
    41 = "Boeny" 
    42 = "Sofia" 
    43 = "Betsiboka" 
    44 = "Melaky" 
    51 = "Atsimo Andrefana" 
    52 = "Androy" 
    53 = "Anosy"
    54 = "Menabe" 
    71 = "Diana" 
    72 = "Sava";

value $hv025a
	1 = "Urbain" 
	2 = "Rural" ;
 
value $hv201a
	10 = "EAU COURANTE"	
	11 = "Courante dans le domicile"	
	12 = "Courante dans la cour/terrain"	
	13 = "Courante par robinet public"
	20 = "EAU PUITS EN TUBE"	
	21 = "Puits tube ou forage"
	30 = "PUIT CREUSE"	
	31 = "Puits protege" 
	32 = "Puits non protege"
	40 = "EAU EN SURFACE"	
	41 = "Source protegee"	
	42 = "Source non protegee"	
	43 = "Riviere/barrage/lac/etang/courant/canal"
	51 = "Eau de pluie"	
	61 = "Camion citerne"	
	62 = "Chariot avec un petit reservoir"
	71 = "Eau en bouteille"
	96 = "Autre";
  
value $hv205a
	10 = "A CHASSE D'EAU"
    11 = "Chasse vers des canalisations reliees aux egouts"
    12 = "Chasse vers une fosse sceptique"
    13 = "Chasse vers une latrine a fosse"
    14 = "Chasse autre part"
    15 = "Ne sait pas ou est chasse"
    20 = "LATRINE A FOSSE"
    21 = "Latrine amelioree a fosse ventilee"
    22 = "Latrine a fosse avec dalle lavable"
    23 = "Latrine a fosse sans dalle lavable"
    24 = "Latrine a fosse sans dalle/a ciel ouvert"
    30 = "PAS DE SANITAIRE"
    31 = "Pas de sanitaire/buisson/terrain"
    41 = "Toilettes seches"
    42 = "Seau"
    43 = "Toilette suspendue, latrine"
    96 = "AUTRE";

value $hv213a
	10 = "NATUREL"
    11 = "Terre, sable"
    12 = "Fumier"
    20 = "RUDIMENRTAIRE"
    21 = "Planches de bois"
    22 = "Palme, bambou"
    23 = "Tapis"
    30 = "FINI"
    31 = "Parquet ou bois poli"
    32 = "Vinyle ou bandes d'asphalte"
    33 = "Tuiles en ceramique"
    34 = "Ciment"
    35 = "Tapis"
    96 = "AUTRE";

value $hv214a
    10 = "NATUREL"	
    11 = "Pas de murs"	
    12 = "Canne/palme/tronc/herbe/baton"	
    13 = "Terre/boue/fumier"
	20 = "RUDIMENTAIRE"	
	21 = "Bambou et boue"	
	22 = "Pierre et boue"	
	23 = "Adobe nue"	
	24 = "Contre-plaque"	
	25 = "Carton"	
	26 = "Bois reutilise"	
	27 = "Tole"
	30 = "FINI"	
	31 = "Ciment"	
	32 = "Pierre et ciment/chaux"	
	33 = "Briques"	
	34 = "Blocs de ciment"	
	35 = "Adobe habillee"	
	36 = "Planches de bois/bardeaux"
	96 = "Autre";

value $hv215a
    10 = "NATUREL"
    11 = "Pas de toit"
    12 = "Chaume, palme, feuille"
    13 = "Terre tassee"
    20 = "RUDUMENTAIRE"
    21 = "Rustic mat"
    22 = "Palme, bambou"
    23 = "Planches de bois"
    24 = "Carton"
    30 = "FINI"
    31 = "Metal"
    32 = "Bois"
    33 = "Calamine, fibre de ciment"
    34 = "Tuiles en ceramique"
    35 = "Ciment"
    36 = "Bardeaux"
    96 = "Autre";

value $hv217a
    0 = "Aucun adulte"	
    1 = "Un adulte"	
    2 = "Deux adultes de meme sexe"	
    3 = "Deux adultes de sexes differents"	
    4 = "Trois ou plus adultes de la meme famille"	
    5 = "Adultes sans lien de parente";

value $hv219a
    1 = "Homme" 
    2 = "Femme";

value $binaire
    0 = "Non" 
    1 = "Oui";

value $hv226a
	" 1" = "Electricite"
	" 2" = "Gaz petrole liquefie"
	" 3" = "Gaz naturel"
	" 4" = "Biogas"
	" 5" = "Kerosene"
	" 6" = "Charbon, lignite"
	" 7" = "Charbon de bois"
	" 8" = "Bois"
	" 9" = "Paille, arbustes, herbe"
	10 = "Recolte agricole"
    11 = "Fumier"
    95 = "Pas de nourriture cuisinee dans le menage"
    96 = "Autre";
    
value $hv228a
    0 = "Non"	
    1 = "Tous les enfants"	
    2 = "Quelques enfants"	
    3 = "Pas de moustiquaire dans le menage"	
    9 = "Donnees manquantes";

value $hv235a
  	1 = "Dans son propre logement" 
  	2 = "Dans sa cour" 
  	3 = "Autre part";
     
value $hv236a
  	1 = "Femme adulte" 
  	2 = "Homme adulte" 
  	3 = "Fille de moins de 15 ans" 
  	4 = "Garcon de moins de 15 ans" 
  	6 = "Autre";
   
value $hv237a
	0 = "Non" 
  	1 = "Oui" 
  	8 = "Ne sait pas";

value $hv239a
    1 = "Cheminee" 
    2 = "Four" 
    3 = "Poele" 
    6 = "Autre";

value $hv240a
    0 = "Aucun des deux" 
    1 = "Cheminee" 
    2 = "Hotte";
     
value $hv241a
	1 = "Dans la maison" 
	2 = "Dans un betiment separe" 
	3 = "A l'exterieur" 
	6 = "Autre";
  
value $hv106a
    0 = "Pas d'education" 
    1 = "Primaire" 
    2 = "Secondaire" 
    3 = "Niveau plus eleve" 
    8 = "Ne sait pas";
 
value $hv109a
    0 = "Pas d'education" 
    1 = "Primaire incomplete" 
    2 = "Primaire complete" 
    3 = "Secondaire incomplete" 
    4 = "Secondaire complete" 
    5 = "Niveau plus eleve" 
    8 = "Ne sait pas";
    
value $hb68a
    0 = "Pas d'education" 
    1 = "Primaire" 
    2 = "Secondaire 1" 
    3 = "Secondaire 2" 
    4 = "Niveau plus eleve" 
    8 = "Ne sait pas";
run;


/***************************/
/* variables ACM           */
/***************************/

proc format library = ter;
value $hv201acm	/* hv201 */
10 = "E+"	11 = "E+"	12 = "E+"	13 = "E+"	20 = "E"	21 = "E"	30 = "E"	31 = "E"	32 = "E"	40 = "E-"	41 = "E-"	42 = "E-"	43 = "E-"	51 = "E-"	61 = "E"	62 = "E"	71 = "E+";

value $hv205acm	/* hv205 */
10 = "T+"	11 = "T+"	12 = "T+"	13 = "T+"	14 = "T+"	15 = "T+"	20 = "T"	21 = "T"	22 = "T"	23 = "T"	24 = "T"	30 = "T-"	31 = "T-"	41 = "T"	42 = "T-"	43 = "T+";

value $hv213acm /* hv213 */
10 = "S-"	11 = "S-"	12 = "S-"	20 = "S-"	21 = "S-"	22 = "S-"	23 = "S-"	30 = "S+"	31 = "S+"	32 = "S+"	33 = "S+"	34 = "S+"	35 = "S+";

value $hv226acm	/* hv226 */
" 1" = "C+"	" 2" = "C+"	 " 3" = "C+"	 " 4" = "C+"	" 5" = "C-"	" 6" = "C"	" 7" = "C"	" 8" = "C"	" 9" = "C-"	"10" = "C-"	"11" = "C-";

value $hv206acm	/* hv206 */
0 = "L-"	1 = "L+";

value $hv207acm	/* hv207 */
0 = "R-"	1 = "R+";

value $hv208acm	/*hv208	*/
0 = "V-"	1 = "V+";

value $hv209acm	/* hv209 */
0 = "F-"	1 = "F+";

value $hv219acm	/* hv219 */
1 = "X1"	2 = "X2";

value $hv221acm	/* hv221 */
0 = "P-"	1 = "P+";

value $hv227acm	/* hv227 */
0 = "M-"	1 = "M+";

value $hv247acm /* hv247 */
0 = "C-"	1="C+";

value $hv243aacm /* hv243a */
0 = "TM-"	1 = "TM+";

value $hv243bacm /* hv243b */
0 = "MO-"	1 = "MO+";

value $hv243cacm /* hv243c */
0 = "CH-"	1 = "CH+";

value $hv243dacm /* hv243d */
0 = "B-"	1 = "B+";

value $hv229acm
0 = "D-"	1 = "D+";

value $hv230acm
0 = "O-"	1 = "0+";
run;

