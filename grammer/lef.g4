grammar lef;

import lefkeywords, lefdefbases ;

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

numorpwl
    : num
    | PWL (d=num r=num)+
    ;

property: 'PROPERTY' id STRING sem;
namescasesensitive: NAMESCASESENSITIVE ('ON'|'OFF') sem ;
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
    |  baserect sem            #OrdRect
    ;
polygon
    :  POLYGON MASK num point point point+ sem   #Maskpolygon
    |  basepolygon sem            #OrdPolygon
    ;
stepPattern: DO numX=num BY numY=num STEP spaceX=num spaceY=num;
beginext: BEGINEXT;
