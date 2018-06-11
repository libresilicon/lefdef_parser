grammar lef;

WS: [ \t\r\n]+ -> channel(HIDDEN);
Comment: '#'.*?'\n' -> channel(HIDDEN);

fragment INT: '-'? [0-9]+;
fragment FLOAT: '-'? [0-9]*'.'?[0-9]+ ;
fragment A : [aA]; // match either an 'a' or 'A'
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];


VERSION:                    V E R S I O N;
BUSBITCHARS:                B U S B I T C H A R S;
DIVIDERCHAR:                D I V I D E R C H A R;
//units keywords
UNITS:                      U N I T S;
TIME:                       T I M E;
NANOSECONDS:                N A N O S E C O N D S;
CAPACITANCE:                C A P A C I T A N C E;
PICOFARADS:                 P I C O F A R A D S;
RESISTANCE:                 R E S I S T A N C E;
OHMS:                       O H M S;
POWER:                      P O W E R;
MILLIWATTS:                 M I L L I W  A T T S;
CURRENT:                    C U R R E N T;
MILLIAMPS:                  M I L L I A M P S;
VOLTAGE:                    V O L T A G E;
VOLTS:                      V O L T S;
DATABASE:                   D A T A B A S E;
MICRONS:                    M I C R O N S;
FREQUENCY:                  F R E Q U E N C Y;
MEGAHERTZ:                  M E G A H E R T Z;
//units end
END:                        E N D;
MANUFACTURINGGRID:          M A N U F A C T U R I N G G R I D;
USEMINSPACING:              U S E M I N S  P A C I N G;
CLEARANCEMEASURE:           C L E A R A N C E M E A S U R E;
PROPERTYDEFINITIONS:        P R O P E R T Y D E F I N I T I O N S;
PROPERTY:                   P R O P E R T Y;
FIXEDMASK:                  F I X E D M A S K;
//layer keywords
LAYER:                      L A Y E R;
TYPE:                       T Y P E;
MASK:                       M A S K;
SPACING:                    S P A C I N G;
CENTERTOCENTER:             C E N T E R T O C E N T E R;
SAMENET:                    S A M E N E T;
STACK:                      S T A C K;
ADJACENTCUTS:               A D J A C E N T C U T S;
WITHIN:                     W I T H I N;
EXCEPTSAMEPGNET:            E X C E P T S A M E P G N E T;
PARALLELOVERLAP:            P A R A L L E L O V E R L A P;
AREA:                       A R E A;
SPACINGTABLE:               S P A C I N G T A B L E;
ARRAYSPACING:               A R R A Y S P A C I N G;
LONGARRAY:                  L O N G A R R A Y;
WIDTH:                      W I D T H ;
CUTSPACING:                 C U T S P A C I N G;
ARRAYCUTS:                  A R R A Y C U T S;
ENCLOSURE:                  E N C L O S U R E;
ABOVE:                      A B O V E ;
BELOW:                      B E L O W ;
EXCEPTEXTRACUT:             E X C E P T E X T R A C U T;
LENGTH:                     L E N G T H ;
PREFERENCLOSURE:            P R E F E R E N C L O S U R E;
ACCURRENTDENSITY:           A C C U R R E N T D E N S I T Y;
PEAK:                       P E A K ;
AVERAGE:                    A V E R A G E;
RMS:                        R M S ;
CUTAREA:                    C U T A R E A;
TABLEENTRIES:               T A B L E E N T R I E S;
DCCURRENTDENSITY:           D C C U R R E N T D E N S I T Y;
ANTENNAMODEL:               A N T E N N A M O D E L;
ANTENNAAREARATIO:           A N T E N N A A R E A R A T I O;
ANTENNADIFFAREARATIO:       A N T E N N A D I F F A R E A R A T I O;
ANTENNACUMAREARATIO:        A N T E N N A C U M A R E A R A T I O;
ANTENNACUMDIFFAREARATIO:    A N T E N N A C U M D I F F A R E A R A T I O;
ANTENNAAREAFACTOR:          A N T E N N A A R E A F A C T O R;
ANTENNACUMROUTINGPLUSCUT:   A N T E N N A C U M R O U T I N G P L U S C U T;
ANTENNAGATEPLUSDIFF:        A N T E N N A G A T E P L U S D I F F;
ANTENNAAREAMINUSDIFF:       A N T E N N A A R E A M I N U S D I F F;
ANTENNAAREADIFFREDUCEPWL:   A N T E N N A A R E A D I F F R E D U C E P W L;
OXIDE:                      O X I D E [1-4];
MASTERSLICE:                M A S T E R S L I C E;
OVERLAP:                    O V E R L A P;
LEF58_TYPE:                 L E F '58_' T Y P E;
NWELL:                      N W E L L ;
PWELL:                      P W E L L ;
ABOVEDIEEDGE:               A B O V E D I E E D G E;
BELOWDIEEDGE:               B E L O W D I E E D G E;
DIFFUSION:                  D I F F U S I O N;
TRIMPOLY:                   T R I M P O L  Y;
TRIMMETAL:                  T R I M M E T A L;
ROUTING:                    R O U T I N   G;
POLYROUTING:                P O L Y R O U T I N  G;
HORIZONTAL:                 H O R I Z O N T A   L;
VERTICAL:                   V E R T I C A  L;
DIAG45:                     D I A G '45' ;
DIAG135:                    D I A G '135';
DIAGPITCH:                  D I A G P I T C H;
OFFSET:                     O F F S E T ;
DIAGWIDTH:                  D I A G W I D T H;
DIAGSPACING:                D I A G S P A C I N G;
DIAGMINEDGELENGTH:          D I A G M I N E D G E L E N G T H;
MINSIZE:                    M I N S I Z E;
RANGE:                      R A N G E ;
USELENGTHTHRESHOLD:         U S E L E N G T H T H R E S H O L D;
INFLUENCE:                  I N F L U E N C E;
LENGTHTHRESHOLD:            L E N G T H T H R E S H O L D;
ENDOFLINE:                  E N D O F L I N E;
PARALLELEDGE:               P A R A L L E L E D G E;
TWOEDGES:                   T W O E D G E S;
NOTCHLENGTH:                N O T C H L E N G T H;
ENDOFNOTCHWIDTH:            E N D O F N O T C H W I D T H;
NOTCHSPACING:               N O T C H S P A C I N G;
PITCH:                      P I T C H;
RECT:                       R E C T;
PATH:                       P A T H;
POLYGON:                    P O L Y G O N;
CLASS:                      C L A S S;
NAMESCASESENSITIVE:         N A M E S C A S E S E N S I T I V E;
MAXVIASTACK:                M A X V I A S T A C K;
VIARULE:                    V I A R U L E;
NONDEFAULTRULE:             N O N D E F A U L T R U L E;
SITE:                       S I T E;
MACRO:                      M A C R O;
DEFAULT:                    D E F A U L T;
FOREIGN:                    F O R E I G N;
ORIGIN:                     O R I G I N;
EEQ:                        E E Q;
SIZE:                       S I Z E;
SYMMETRY:                   S Y M M E T R Y;
DO:                         D O;
BY:                         B Y;
STEP:                       S T E P;
PIN:                        P I N;
OBS:                        O B S;
DIRECTION:                  D I R E C T I O N;
USE:                        U S E;
PORT:                       P O R T;
EXPECTPGNET:                E X P E C T P G N E T;
DESIGNRULEWIDTH:            D E S I G N R U L E W I D T H;
BEGINEXT:                   B E G I N E X T;
MAXWIDTH:                   M A X W I D T H;
PWL:                        P W L;
ON:                         O N;
OFF:                        O F F;
DIFFUSEONLY:                D I F F U S E O N L Y;
ORTHOGONAL:                 O R T H O G O N A L;
IMPLANT:                    I M P L A N T;
CUT:                        C U T;
EUCLIDEAN:                  E U C L I D E A N;
MAXXY:                      M A X X Y;
PARALLELRUNLENGTH:          P A R A L L E L R U N L E N G T H;
TWOWIDTHS:                  T W O W I D T H S;
PRL:                        P R L;
WIREEXTENSION:              W I R E E X T E N S I O N ;
MINIMUMCUT:                 M I N I M U M C U T;
FROMABOVE:                  F R O M A B O V E;
FROMBELOW:                  F R O M B E L O W;
MINWIDTH:                   M I N W I D T H ;
MINSTEP:                    M I N S T E P;
INSIDECORNER:               I N S I D E C O R N E R ;
OUTSIDECORNER:              O U T S I D E C O R N E R ;
LENGTHSUM:                  L E N G T H S U M;
MAXEDGES:                   M A X E D G E S ;
MINENCLOSEDAREA:            M I N E N C L O S E D A R E A;
PROTRUSIONWIDTH:            P R O T R U S I O N W I D T H;
RPERSQ:                     R P E R S Q ;
CPERSQDIST:                 C P E R S Q D I S T;
HEIGHT:                     H E I G H T ;
THICKNESS:                  T H I C K N E S S;
SHRINKAGE:                  S H R I N K A G E;
CAPMULTIPLIER:              C A P M U L T I P L I E R ;
EDGECAPACITANCE:            E D G E C A P A C I T A N C E;
MINIMUMDENSITY:             M I N I M U M D E N S I T Y;
MAXIMUMDENSITY:             M A X I M U M D E N S I T Y;
DENSITYCHECKWINDOW:         D E N S I T Y C H E C K W I N D O W;
DENSITYCHECKSTEP:           D E N S I T Y C H E C K S T E P;
FILLACTIVESPACING:          F I L L A C T I V E S P A C I N G;
ANTENNASIDEAREARATIO:       A N T E N N A S I D E A R E A R A T I O;
ANTENNADIFFSIDEAREARATIO:   A N T E N N A D I F F S I D E A R E A R A T I O;
ANTENNACUMSIDEAREARATIO:    A N T E N N A C U M S I D E A R E A R A T I O;
ANTENNACUMDIFFSIDEAREARATIO:A N T E N N A C U M D I F F S I D E A R E A R A T I O;
ANTENNASIDEAREAFACTOR:      A N T E N N A S I D E A R E A F A C T O R;
PGONLY:                     P G O N L Y ;
VIA:                        V I A;
CUTSIZE:                    C U T S I Z E;
LAYERS:                     L A Y E R S ;
ROWCOL:                     R O W C O L ;
PATTERN:                    P A T T E R N;
COVER:                      C O V E R ;
BUMP:                       B U M P ;
RING:                       R I N G ;
BLOCK:                      B L O C K ;
BLACKBOX:                   B L A C K B O X;
SOFT:                       S O F T ;
PAD:                        P A D ;
INPUT:                      I N P U T ;
OUTPUT:                     O U T P U T;
INOUT:                      I N O U T ;
SPACER:                     S P A C E R;
AREAIO:                     A R E A I O;
CORE:                       C O R E ;
FEEDTHRU:                   F E E D T H R U;
TIEHIGH:                    T I E H I G H;
TIELOW:                     T I E L O W;
ANTENNACELL:                A N T E N N A C E L L;
WELLTAP:                    W E L L T A P;
ENDCAP:                     E N D C A P;
PRE:                        P R E ;
POST:                       P O S T ;
TOPLEFT:                    T O P L E F T;
TOPRIGHT:                   T O P R I G H T;
BOTTOMLEFT:                 B O T T O M L E F T;
BOTTOMRIGHT:                B O T T O M R I G H T;
DENSITY:                    D E N S I T Y;
SYM_X:                      X;
SYM_Y:                      Y;
SYM_R90:                    R '90';
EXCEPTPGNET:                E X C E P T P G N E T;
ITERATE:                    I T E R A T E;
TAPERRULE:                    T A P E R R U L E;
TRISTATE:                     T R I S T A T E;
SIGNAL:                       S I G N A L ;
ANALOG:                       A N A L O G ;
GROUND:                       G R O U N D ;
CLOCK:                        C L O C K ;
NETEXPR:                      N E T E X P R;
SUPPLYSENSITIVITY:            S U P P L Y S E N S I T I V I T Y;
GROUNDSENSITIVITY:            G R O U N D S E N S I T I V I T Y;
SHAPE:                        S H A P E ;
ABUTMENT:                     A B U T M E N T;
MUSTJOIN:                     M U S T J O I N;
NONE:                         N O N E ;
ANTENNAPARTIALMETALAREA:      A N T E N N A P A R T I A L M E T A L A R E A;
ANTENNAPARTIALMETALSIDEAREA:  A N T E N N A P A R T I A L M E T A L S I D E A R E A;
ANTENNAPARTIALCUTAREA:        A N T E N N A P A R T I A L C U T A R E A ;
ANTENNADIFFAREA:              A N T E N N A D I F F A R E A ;
ANTENNAGATEAREA:              A N T E N N A G A T E A R E A ;
ANTENNAMAXAREACAR:            A N T E N N A M A X A R E A C A R;
ANTENNAMAXSIDEAREACAR:        A N T E N N A M A X S I D E A R E A C A R;
ANTENNAMAXCUTCAR:             A N T E N N A M A X C U T C A R;


//end layer keywords
ENDLIB:             E N D ' ' L I B R A R Y;

NUMBER: (INT | FLOAT) ;
IDSTRING:  [a-zA-Z_] [a-zA-Z0-9_]*;
STRING : '"' ( '\\"' | . )*? '"' ;
ORIENTATION: (N|E|S|W|(F N)|(F E)|(F S)|(F W));

lef: version
  namescasesensitive?
  busbitchars?
  dividerchar?
  units?
  manufacturinggrid?
  useminspacing?
  clearancemeasure?
  propertydefinitions?
  fixedmask?
  layer*
  maxviastack?
  viarulegen*
  via*
  viarule*
  nondefaultrule*
  site*
  macro*
  beginext*
  ENDLIB
  ;

sem: ';' ;
property: 'PROPERTY' id STRING sem;
point: num num;
numorpwl
    : num
    | PWL (d=num r=num)+
    ;
id: IDSTRING | CORE ;
num: NUMBER;


version: VERSION num sem;
namescasesensitive: NAMESCASESENSITIVE ('ON'|'OFF') sem ;
busbitchars: BUSBITCHARS STRING sem ;
dividerchar: DIVIDERCHAR STRING sem ;
units: UNITS unitprops+ END UNITS;
unitprops
  : TIME NANOSECONDS num sem
  | CAPACITANCE PICOFARADS num sem
  | RESISTANCE OHMS num sem
  | POWER MILLIWATTS num sem
  | CURRENT MILLIAMPS num sem
  | VOLTAGE VOLTS num sem
  | DATABASE MICRONS num sem
  | FREQUENCY MEGAHERTZ num sem
  ;
manufacturinggrid: MANUFACTURINGGRID num sem;
useminspacing: USEMINSPACING OBS (ON | OFF) sem;
clearancemeasure: CLEARANCEMEASURE (MAXXY | EUCLIDEAN) sem
;
propertydefinitions: PROPERTYDEFINITIONS .*? sem
;
fixedmask: FIXEDMASK sem;

layer: LAYER id layertype END id;
layertype
  : TYPE CUT sem cutlayerprops+
  | TYPE IMPLANT sem implementlayerprops+
  | TYPE (MASTERSLICE | OVERLAP) sem mastersliceoroverlaplayerprops+
  | TYPE ROUTING sem routinglayerprops+
  ;

cutlayerprops
    : MASK num sem                               #cutlayermask
    | cutlayerspacing sem                        #cutlayerspacingrule
    | SPACINGTABLE ORTHOGONAL (WITHIN num SPACING num)* sem #cutlayerspacingtablerule
    | ARRAYSPACING LONGARRAY? (WIDTH num)? CUTSPACING num (ARRAYCUTS num SPACING num)+ sem #cutlayerarrayspacingrule
    | WIDTH num sem                              #cutlayerwidthrule
    | ENCLOSURE (ABOVE | BELOW) num num (WIDTH num (EXCEPTEXTRACUT num)? | LENGTH num) sem #cutlayerenclosurerule
    | PREFERENCLOSURE (ABOVE | BELOW)? num num (WIDTH num)? sem #cutlayerpreferenceenclosurerule
    | RESISTANCE num sem                         #cutlayerresistencerule
    | property                                   #cutlayerpropertyrule
    | layeraccurrentdensity sem                  #cutlayeraccurrentdensityrule
    | layerdccurrentdensity sem                  #cutlayeraccurrentdensityrule
    | ANTENNAMODEL OXIDE sem                     #antennamodelrule
    | ANTENNAAREARATIO num sem                   #antennaarearatiorule
    | cutlayerantennadiffarearatio sem           #antennadiffarearatiorule
    | ANTENNACUMAREARATIO num sem                #antennacumarearatiorule
    | cutlayerantennacumdiffarearatio sem        #antennacumdiffarearatiorule
    | ANTENNAAREAFACTOR num (DIFFUSEONLY)? sem   #antennaareafactorrule
    | ANTENNACUMROUTINGPLUSCUT sem               #antennacumroutingpluscutrule
    | ANTENNAGATEPLUSDIFF num sem                #antennagateplusdiffrule
    | ANTENNAAREAMINUSDIFF num sem               #antennaareaminusdiffrule
    | ANTENNAAREADIFFREDUCEPWL (num num)+ sem    #antennaareadiffreducepwlrule
    ;
cutlayerspacing
    : SPACING num CENTERTOCENTER? SAMENET? (LAYER id STACK? | ADJACENTCUTS num WITHIN num EXCEPTSAMEPGNET? | PARALLELOVERLAP | AREA num )?
    ;
layeraccurrentdensity
    : ACCURRENTDENSITY (PEAK | AVERAGE | RMS) num
    | ACCURRENTDENSITY (PEAK | AVERAGE | RMS) FREQUENCY (num)+ sem (CUTAREA num+ sem)? TABLEENTRIES num+
    ;
layerdccurrentdensity
    : DCCURRENTDENSITY AVERAGE num
    |  DCCURRENTDENSITY AVERAGE CUTAREA num* sem TABLEENTRIES num*
    ;
cutlayerantennadiffarearatio: ANTENNADIFFAREARATIO numorpwl;
cutlayerantennacumdiffarearatio: ANTENNACUMDIFFAREARATIO numorpwl;

implementlayerprops: .+?
    ;
mastersliceoroverlaplayerprops: .+?
    ;
routinglayerprops
    : MASK maskNum=num sem
    | DIRECTION (HORIZONTAL | VERTICAL | DIAG45 | DIAG135) sem
    | PITCH (distance=num | xDistance=num yDistance=num) sem
    | DIAGPITCH (distance=num | diag45Distance=num diag135Distance=num) sem
    | WIDTH defaultWidth=num sem
    | OFFSET (distance=num | xDistance=num yDistance=num) sem
    | DIAGWIDTH diagWidth=num sem
    | DIAGSPACING diagSpacing=num sem
    | DIAGMINEDGELENGTH diagLength=num sem
    | AREA minArea=num sem
    | MINSIZE (minWidth=num minLength=num)+ sem
    | routinglayerspacing sem
    | SPACINGTABLE PARALLELRUNLENGTH length=num+ (WIDTH width=num spacing=num+)+ sem
    | SPACINGTABLE INFLUENCE (WIDTH width=num WITHIN distance=num SPACING spacing=num)+ sem
    | TWOWIDTHS (WIDTH width=num (PRL runLength=num)? spacing=num+ )+ sem
    | WIREEXTENSION value=num sem
    | MINIMUMCUT numCuts=num WIDTH width=num (WITHIN cutDistance=num)? singleconnectionside=(FROMABOVE | FROMBELOW)? (LENGTH length=num WITHIN distance=num)? sem
    | MAXWIDTH width=num sem
    | MINWIDTH width=num sem
    | MINSTEP minStepLength=num  (((INSIDECORNER | OUTSIDECORNER | STEP) (LENGTHSUM maxLength=num)) | (MAXEDGES maxEdges=num)) sem
    | MINENCLOSEDAREA area=num (WIDTH width=num)? sem
    | PROTRUSIONWIDTH width1=num LENGTH length=num WIDTH width2=num sem
    | RESISTANCE RPERSQ value=num sem
    | CAPACITANCE CPERSQDIST value=num sem
    | HEIGHT distance=num sem
    | THICKNESS distance=num sem
    | SHRINKAGE distance=num sem
    | CAPMULTIPLIER value=num sem
    | EDGECAPACITANCE value=num sem
    | MINIMUMDENSITY minDensity=num sem
    | MAXIMUMDENSITY maxDensity=num sem
    | DENSITYCHECKWINDOW windowLength=num windowWidth=num sem
    | DENSITYCHECKSTEP stepValue=num sem
    | FILLACTIVESPACING spacing=num sem
    | ANTENNAMODEL OXIDE sem
    | ANTENNAAREARATIO value=num sem
    | ANTENNADIFFAREARATIO numorpwl sem
    | ANTENNACUMAREARATIO value=num sem
    | ANTENNACUMDIFFAREARATIO numorpwl sem
    | ANTENNAAREAFACTOR value=num DIFFUSEONLY? sem
    | ANTENNASIDEAREARATIO value=num sem
    | ANTENNADIFFSIDEAREARATIO numorpwl sem
    | ANTENNACUMSIDEAREARATIO value=num sem
    | ANTENNACUMDIFFSIDEAREARATIO numorpwl sem
    | ANTENNASIDEAREAFACTOR value=num DIFFUSEONLY? sem
    | ANTENNACUMROUTINGPLUSCUT sem
    | ANTENNAGATEPLUSDIFF plusDiffFactor=num sem
    | ANTENNAAREAMINUSDIFF minusDiffFactor=num sem
    | ANTENNAAREADIFFREDUCEPWL (diffArea1=num diffArea2=num)+ sem
    | property
    | layeraccurrentdensity sem
    | layerdccurrentdensity sem
    ;

routinglayerspacing
   : SPACING minSpacing=num (RANGE minWidth=num maxWidth=num (USELENGTHTHRESHOLD | INFLUENCE influenceLength=num (RANGE stubMinWidth=num stubMaxWidth=num)?)? | RANGE minWidth=num maxWidth=num)?
   | SPACING minSpacing=num LENGTHTHRESHOLD maxLength=num (RANGE minWidth=num maxWidth=num)?
   | SPACING minSpacing=num ENDOFLINE eolWidth=num WITHIN eolWithin=num (PARALLELEDGE parSpace=num WITHIN parWithin=num (TWOEDGES)?)?
   | SPACING minSpacing=num SAMENET (PGONLY)?
   | SPACING minSpacing=num NOTCHLENGTH minNotchLength=num
   | SPACING minSpacing=num ENDOFNOTCHWIDTH endOfNotchWidth=num NOTCHSPACING minNotchSpacing=num NOTCHLENGTH minNotchLength=num
   ;
maxviastack: value=num  (RANGE bottomLayer=num topLayer=num)? sem;
viarulegen: VIARULE id END id;

via: VIA viaName=id DEFAULT? (generatedvia | fixedvia) propertydefinitions? END id;
fixedvia: fixedviaprops*;
fixedviaprops
    : RESISTANCE resistValue=num sem
    | LAYER layerName=id sem (rect | polygon)+
    ;

generatedvia: generatedviaprops*;
generatedviaprops
    : VIARULE viaRuleName=id sem
    | CUTSIZE xSize=num ySize=num sem
    | LAYERS botMetalLayer=id cutLayer=id topMetalLayer=id sem
    | CUTSPACING xCutSpacing=num yCutSpacing=num sem
    | ENCLOSURE xBotEnc=num yBotEnc=num xTopEnc=num yTopEnc=num sem
    | ROWCOL numCutRows=num numCutCols=num sem
    | ORIGIN xOffset=num yOffset=num sem
    | OFFSET xBotOffset=num yBotOffset=num xTopOffset=num yTopOffset=num sem
    | PATTERN cutPattern=id sem
    ;

viaresistence: RESISTANCE num ;
viarule: VIARULE id .*? END id
;
nondefaultrule: NONDEFAULTRULE id .*? END id
;
site: SITE id END id
;

macro: MACRO id macroprops* END id;
macroprops
  : property
  | CLASS (COVER (BUMP)? | RING | BLOCK (BLACKBOX | SOFT)? | PAD (INPUT | OUTPUT |INOUT | POWER | SPACER | AREAIO)? | CORE (FEEDTHRU | TIEHIGH | TIELOW | SPACER | ANTENNACELL | WELLTAP)? | ENDCAP (PRE | POST | TOPLEFT | TOPRIGHT | BOTTOMLEFT | BOTTOMRIGHT)? ) sem
  | FIXEDMASK sem
  | FOREIGN foreignCellName=id (point (ORIENTATION)?)?  sem
  | ORIGIN point sem
  | EEQ macroName=id sem
  | SIZE width=num BY height=num sem
  | SYMMETRY (SYM_X | SYM_Y | SYM_R90)+ sem
  | macrosite
  | macropin
  | OBS layergeometry END
  | DENSITY macrodensity END sem
  ;


macrosite: SITE siteName=id macrositepattern?  sem;
macrositepattern: NUMBER NUMBER ORIENTATION macrosteppattern?;
macrosteppattern: DO num BY num STEP num num;
macropin: PIN id pinprops* END id;
macrodensity: LAYER layername=id sem (RECT point point densityValue=num sem)+ ;

pinprops
    : TAPERRULE ruleName=id sem
    | DIRECTION (INPUT | (OUTPUT TRISTATE?) | INOUT | FEEDTHRU) sem
    | USE ( SIGNAL | ANALOG | POWER | GROUND | CLOCK ) sem
    | NETEXPR '"' netExprPropName=id defaultNetName=id '"' sem
    | SUPPLYSENSITIVITY powerPinName=id sem
    | GROUNDSENSITIVITY groundPinName=id sem
    | SHAPE (ABUTMENT | RING | FEEDTHRU) sem
    | MUSTJOIN pinName=id sem
    | PORT (CLASS (NONE | CORE | BUMP) sem)? layergeometry END
    | property
    | ANTENNAPARTIALMETALAREA value=num (LAYER layerName=id)? sem
    | ANTENNAPARTIALMETALSIDEAREA value=num (LAYER layerName=id)? sem
    | ANTENNAPARTIALCUTAREA value=num (LAYER layerName=id)? sem
    | ANTENNADIFFAREA value=num  (LAYER layerName=id)? sem
    | ANTENNAMODEL OXIDE sem
    | ANTENNAGATEAREA value=num  (LAYER layerName=id)? sem
    | ANTENNAMAXAREACAR value=num LAYER layerName=id sem
    | ANTENNAMAXSIDEAREACAR value=num LAYER layerName=id sem
    | ANTENNAMAXCUTCAR value=num LAYER layerName=id sem
    ;

layergeometry: layergeometries+;
layergeometries: layergeometryshapes+ ;
layergeometryshapes: (layergeometrygeoshapes | layergeometryviashapes);
layergeometrygeoshapes: LAYER layerName=id (EXCEPTPGNET)? (SPACING minSpacing=num | DESIGNRULEWIDTH value=num)? sem  (WIDTH width=num sem)? layergeometrygeoshapesfoot+;
layergeometrygeoshapesfoot
    : PATH (MASK maskNum=num)? point+  sem
    | PATH (MASK maskNum=num)? ITERATE point+ stepPattern sem
    | RECT (MASK maskNum=num)? point point sem
    | RECT (MASK maskNum=num)? ITERATE point point stepPattern sem
    | POLYGON (MASK maskNum=num)? point point point+ sem
    | POLYGON (MASK maskNum=num)? ITERATE point point point+ stepPattern sem
    ;
layergeometryviashapes
    : VIA (MASK viaMaskNum=num)? point viaName=id sem
    | VIA ITERATE (MASK viaMaskNum=num)? point viaName=id stepPattern sem
    ;
layergeometrypart: LAYER id EXPECTPGNET? ((SPACING | DESIGNRULEWIDTH) num)? sem (WIDTH num )? layergeometryforms ;
layergeometryforms
    : rect
    | polygon
    ;
rect
    :  RECT MASK num point point sem  #Maskrect
    |  RECT point point sem            #OrdRect
    ;
polygon
    :  POLYGON MASK num point point point+ sem   #Maskpolygon
    |  POLYGON point point point+ sem            #OrdPolygon
    ;
stepPattern: DO numX=num BY numY=num STEP spaceX=num spaceY=num;
beginext: BEGINEXT;
