  # LEF_TECH

[VERSION statement]
[BUSBITCHARS statement]
[DIVIDERCHAR statement]
[UNITS statement]
[MANUFACTURINGGRID statement]
[USEMINSPACING statement]
[CLEARANCEMEASURE statement ;]
[PROPERTYDEFINITIONS statement]
[FIXEDMASK ;]
[LAYER (Nonrouting) statement
| LAYER (Routing) statement] ...
[MAXVIASTACK statement]
[VIA statement] ...
[VIARULE statement] ...
[VIARULE GENERATE statement] ...
[NONDEFAULTRULE statement] ...
[SITE statement] ...
[BEGINEXT statement] ...
[END LIBRARY]

# LEF_LIB

[VERSION statement]
    [BUSBITCHARS statement]
    [DIVIDERCHAR statement]
    [VIA statement] ...
    [SITE statement]
    [MACRO statement
    [PIN statement] ...
    [OBS statement ...] ] ...
    [BEGINEXT statement] ...
[END LIBRARY]

## BUSBITCHARS

[BUSBITCHARS "delimiterPair" ;]

## DIVIDERCHAR
[DIVIDERCHAR "character" ;]

## UNITS

[UNITS
    [TIME NANOSECONDS convertFactor ;]
    [CAPACITANCE PICOFARADS convertFactor ;]
    [RESISTANCE OHMS convertFactor ;]
    [POWER MILLIWATTS convertFactor ;]
    [CURRENT MILLIAMPS convertFactor ;]
    [VOLTAGE VOLTS convertFactor ;]
    [DATABASE MICRONS LEFconvertFactor ;]
    [FREQUENCY MEGAHERTZ convertFactor ;]
END UNITS]

## MANUFACTURINGGRID
[MANUFACTURINGGRID value ;]

## USEMINSPACING

[USEMINSPACING OBS { ON | OFF } ;]

## CLEARANCEMEASURE

[CLEARANCEMEASURE {MAXXY | EUCLIDEAN} ;]

## PROPERTYDEFINITIONS

[PROPERTYDEFINITIONS
[objectType propName propType [RANGE min max]
[value | "stringValue"]
;] ...
END PROPERTYDEFINITIONS]

## FIXEDMASK
[FIXEDMASK ;]

## LAYER

### CUT

LAYER layerName
    TYPE CUT ;
    [MASK maskNum ;]
    [SPACING cutSpacing
    [CENTERTOCENTER]
    [SAMENET]
    [ LAYER secondLayerName [STACK]
    | ADJACENTCUTS {2 | 3 | 4} WITHIN cutWithin [EXCEPTSAMEPGNET]
    | PARALLELOVERLAP
    | AREA cutArea
    ]
    ;] ...
    [SPACINGTABLE ORTHOGONAL
    {WITHIN cutWithin SPACING orthoSpacing} ... ;]
    [ARRAYSPACING [LONGARRAY] [WIDTH viaWidth] CUTSPACING cutSpacing
    {ARRAYCUTS arrayCuts SPACING arraySpacing} ... ;]
    [WIDTH minWidth ;]
    [ENCLOSURE [ABOVE | BELOW] overhang1 overhang2
    [ WIDTH minWidth [EXCEPTEXTRACUT cutWithin]
    | LENGTH minLength]
    ;] ...
    [PREFERENCLOSURE [ABOVE | BELOW] overhang1 overhang2 [WIDTH minWidth] ;] ...
    [RESISTANCE resistancePerCut ;]
    [PROPERTY propName propVal ;] ...
    [ACCURRENTDENSITY {PEAK | AVERAGE | RMS}
    { value
    | FREQUENCY freq_1 freq_2 ... ;
    [CUTAREA cutArea_1 cutArea_2 ... ;]
    TABLEENTRIES
    v_freq_1_cutArea_1 v_freq_1_cutArea_2 ...
    v_freq_2_cutArea_1 v_freq_2_cutArea_2 ...
    ...
    } ;]
    [DCCURRENTDENSITY AVERAGE
    { value
    | CUTAREA cutArea_1 cutArea_2 ... ;
    TABLEENTRIES value_1 value_2 ...
    } ;]
    [ANTENNAMODEL {OXIDE1 | OXIDE2 | OXIDE3 | OXIDE4} ;] ...
    [ANTENNAAREARATIO value ;] ...
    [ANTENNADIFFAREARATIO {value | PWL ( ( d1 r1 ) ( d2 r2 ) ...)} ;] ...
    [ANTENNACUMAREARATIO value ;] ...
    [ANTENNACUMDIFFAREARATIO {value | PWL ( ( d1 r1 ) ( d2 r2 ) ...)} ;] ...
    [ANTENNAAREAFACTOR value [DIFFUSEONLY] ;] ...
    [ANTENNACUMROUTINGPLUSCUT ;]
    [ANTENNAGATEPLUSDIFF plusDiffFactor ;]
    [ANTENNAAREAMINUSDIFF minusDiffFactor ;]
    [ANTENNAAREADIFFREDUCEPWL
    ( ( diffArea1 diffAreaFactor1 ) ( diffArea2 diffAreaFactor2 ) ...) ; ]
END layerName

### IMPLANT

LAYER layerName
    TYPE IMPLANT ;
    [MASK maskNum ;]
    [WIDTH minWidth ;]
    [SPACING minSpacing [LAYER layerName2] ;] ...
    [PROPERTY propName propVal ;] ...
END layerName

### MASTERSLICE

LAYER layerName
    TYPE {MASTERSLICE | OVERLAP} ;
    [MASK maskNum ;]
    [PROPERTY propName propVal ;] ...
    [PROPERTY LEF58_TYPE
    "TYPE [NWELL | PWELL | ABOVEDIEEDGE | BELOWDIEEDGE | DIFFUSION | TRIMPOLY
    | TRIMMETAL]
    ];" ;
    [PROPERTY LEF58_TRIMMEDMETAL
    “TRIMMEDMETAL metalLayer [MASK maskNum]
    ]; “ ;
END layerName

### ROUTING

LAYER layerName
     TYPE ROUTING ;
    [MASK maskNum ;]
    [PROPERTY LEF58_TYPE "TYPE {POLYROUTING}] ;" ;
     DIRECTION {HORIZONTAL | VERTICAL | DIAG45 | DIAG135} ;
     PITCH {distance | xDistance yDistance} ;
    [DIAGPITCH {distance | diag45Distance diag135Distance} ;]
     WIDTH defaultWidth ;
    [OFFSET {distance | xDistance yDistance} ;]
    [DIAGWIDTH diagWidth ;]
    [DIAGSPACING diagSpacing ;]
    [DIAGMINEDGELENGTH diagLength ;]
    [AREA minArea ;]
    [MINSIZE minWidth minLength [minWidth2 minLength2] ... ;]
    [[SPACING minSpacing[ RANGE minWidth maxWidth[ USELENGTHTHRESHOLD| INFLUENCE value [RANGE stubMinWidth stubMaxWidth]| RANGE minWidth maxWidth]| LENGTHTHRESHOLD maxLength [RANGE minWidth maxWidth]| ENDOFLINE eolWidth WITHIN eolWithin[PARALLELEDGE parSpace WITHIN parWithin [TWOEDGES]]| SAMENET [PGONLY]| NOTCHLENGTH minNotchLength| ENDOFNOTCHWIDTH endOfNotchWidth NOTCHSPACING minNotchSpacingNOTCHLENGTH minNotchLength];] ...
    [SPACINGTABLE [PARALLELRUNLENGTH {length} ... {WIDTH width {spacing} ...} ... ; [SPACINGTABLE INFLUENCE {WIDTH width WITHIN distance SPACING spacing} ... ;]|TWOWIDTHS {WIDTH width [PRL runLength] {spacing} ...} ... ; ] ;" ;]
    [PROPERTY LEF58_SPANLENGTHTABLE "SPANLENGTHTABLE {spanLength}... [WRONGDIRECTION] [ORTHOGONAL length] [EXCEPTOTHERSPAN otherSpanlength] ; " ;]
    [WIREEXTENSION value ; ]
    [MINIMUMCUT numCuts WIDTH width [WITHIN cutDistance] [FROMABOVE | FROMBELOW] [LENGTH length WITHIN distance] ;]...
    [MAXWIDTH width ;]
    [MINWIDTH width ;]
    [MINSTEP minStepLength [ [INSIDECORNER | OUTSIDECORNER | STEP] [LENGTHSUM maxLength] | [MAXEDGES maxEdges] ;]
    [PROPERTY LEF58_WIDTHTABLE "WIDTHTABLE {width}...[WRONGDIRECTION] [ORTHOGONAL] ];" ;]
    [PROPERTY LEF58_WIDTH "WIDTH minWidth [WRONGDIRECTION] ;" ;]
    [MINENCLOSEDAREA area [WIDTH width] ;]...
    [PROTRUSIONWIDTH width1 LENGTH length WIDTH width2 ;]
    [RESISTANCE RPERSQ value ;]
    [CAPACITANCE CPERSQDIST value ;]
    [HEIGHT distance ;]
    [THICKNESS distance ;]
    [SHRINKAGE distance ;]
    [CAPMULTIPLIER value ;]
    [EDGECAPACITANCE value ;]
    [MINIMUMDENSITY minDensity ;]
    [MAXIMUMDENSITY maxDensity ;]
    [DENSITYCHECKWINDOW windowLength windowWidth ;]
    [DENSITYCHECKSTEP stepValue ;]
    [FILLACTIVESPACING spacing ;]
    [ANTENNAMODEL {OXIDE1 | OXIDE2 | OXIDE3 | OXIDE4} ;]...
    [ANTENNAAREARATIO value ;]...
    [ANTENNADIFFAREARATIO {value | PWL ( ( d1 r1 ) ( d2 r2 ) ...) } ;]...
    [ANTENNACUMAREARATIO value ;]...
    [ANTENNACUMDIFFAREARATIO {value | PWL ( ( d1 r1 ) ( d2 r2 ) ...) } ;]...
    [ANTENNAAREAFACTOR value [DIFFUSEONLY] ;]...
    [ANTENNASIDEAREARATIO value ;]...
    [ANTENNADIFFSIDEAREARATIO {value | PWL ( ( d1 r1 ) ( d2 r2 ) ...) } ;]...
    [ANTENNACUMSIDEAREARATIO value ;]...
    [ANTENNACUMDIFFSIDEAREARATIO {value | PWL ( ( d1 r1 ) ( d2 r2 ) ...) } ;]...
    [ANTENNASIDEAREAFACTOR value [DIFFUSEONLY] ;]...
    [ANTENNACUMROUTINGPLUSCUT ;]
    [ANTENNAGATEPLUSDIFF plusDiffFactor ;]
    [ANTENNAAREAMINUSDIFF minusDiffFactor ;]
    [ANTENNAAREADIFFREDUCEPWL ( ( diffArea1 diffMetalFacto ( diffArea2 diffMetalFactor2 ) ...) ;]
    [PROPERTY propName propVal ;]...
    [ACCURRENTDENSITY {PEAK | AVERAGE | RMS} { value | FREQUENCY freq_1 freq_2 ... ; [WIDTH width_1 width_2 ... ;]TABLEENTRIES v_freq_1_width_1 v_freq_1_width_2 ... v_freq_2_width_1 v_freq_2_width_2 ... ... } ;]
    [DCCURRENTDENSITY AVERAGE { value | WIDTH width_1 width_2 ... ; TABLEENTRIES value_1 value_2 ... } ;]
END layerName

## MAXVIASTACK

[MAXVIASTACK value [RANGE bottomLayer topLayer] ;]

## VIARULE GENERATE

VIARULE viaRuleName GENERATE [DEFAULT]
    LAYER routingLayerName ;
    ENCLOSURE overhang1 overhang2 ;
    [WIDTH minWidth TO maxWidth ;]
    LAYER routingLayerName ;
    ENCLOSURE overhang1 overhang2 ;
    [WIDTH minWidth TO maxWidth ;]
    LAYER cutLayerName ;
    RECT pt pt ;
    SPACING xSpacing BY ySpacing ;
    [RESISTANCE resistancePerCut ;]
END viaRuleName

## VIA

VIA viaName [DEFAULT]
    { VIARULE viaRuleName ;
    CUTSIZE xSize ySize ;
    LAYERS botMetalLayer cutLayer topMetalLayer ;
    CUTSPACING xCutSpacing yCutSpacing ;
    ENCLOSURE xBotEnc yBotEnc xTopEnc yTopEnc ;
    [ROWCOL numCutRows numCutCols ;]
    [ORIGIN xOffset yOffset ;]
    [OFFSET xBotOffset yBotOffset xTopOffset yTopOffset ;]
    [PATTERN cutPattern ;]
    }
    | {[RESISTANCE resistValue ;]
    {LAYER layerName ;
    { RECT [MASK maskNum] pt pt ;
    | POLYGON [MASK maskNum] pt pt pt ...;} ...
    } ...
    }
    [PROPERTY propName propVal ;] ...
END viaName

## VIARULE

VIARULE viaRuleName
    LAYER layerName ;
    DIRECTION {HORIZONTAL | VERTICAL} ;
    [WIDTH minWidth TO maxWidth ;]
    LAYER layerName ;
    DIRECTION {HORIZONTAL | VERTICAL} ;
    [WIDTH minWidth TO maxWidth ;]
    {VIA viaName ;} ...
    [PROPERTY propName propVal ;] ...
END viaRuleName

## Viarule generate

VIARULE viaRuleName GENERATE
    [DEFAULT] LAYER routingLayerName ; ENCLOSURE overhang1 overhang2 ;
    [WIDTH minWidth TO maxWidth ;] LAYER routingLayerName ; ENCLOSURE overhang1 overhang2 ;
    [WIDTH minWidth TO maxWidth ;] LAYER cutLayerName ; RECT pt pt ; SPACING xSpacing BY ySpacing ;
    [RESISTANCE resistancePerCut ;]
END viaRuleName

## NONDEFAULTRULE

[NONDEFAULTRULE ruleName
    [HARDSPACING ;]
    {LAYER layerName
    WIDTH width ;
    [DIAGWIDTH diagWidth ;]
    [SPACING minSpacing ;]
    [WIREEXTENSION value ;]
    END layerName} ...
    [VIA viaStatement] ...
    [USEVIA viaName ;] ...
    [USEVIARULE viaRuleName ;] ...
    [MINCUTS cutLayerName numCuts ;] ...
    [PROPERTY propName propValue ;] ...
END ruleName]

## SITE

SITE siteName
    CLASS {PAD | CORE} ;
    [SYMMETRY {X | Y | R90} ... ;]
    [ROWPATTERN {previousSiteName siteOrient} ... ;]
    SIZE width BY height ;
END siteName

## MACRO

[MACRO macroName
    [CLASS
    { COVER [BUMP]
    | RING
    | BLOCK [BLACKBOX | SOFT]
    | PAD [INPUT | OUTPUT |INOUT | POWER | SPACER | AREAIO]
    | CORE [FEEDTHRU | TIEHIGH | TIELOW | SPACER | ANTENNACELL | WELLTAP]
    | ENDCAP {PRE | POST | TOPLEFT | TOPRIGHT | BOTTOMLEFT | BOTTOMRIGHT}
    }
    ;]
    [FIXEDMASK ;]
    [FOREIGN foreignCellName [pt [orient]] ;] ...
    [ORIGIN pt ;]
    [EEQ macroName ;]
    [SIZE width BY height ;]
    [SYMMETRY {X | Y | R90} ... ;]
    [SITE siteName [sitePattern] ;] ...
    [PIN statement] ...
    [OBS statement] ...
    [DENSITY statement] ...
    [PROPERTY propName propVal ;] ...
END macroName]

### Pin

[PIN pinName
     [TAPERRULE ruleName ;]
     [DIRECTION {INPUT | OUTPUT
     [TRISTATE] | INOUT | FEEDTHRU} ;]
     [USE { SIGNAL | ANALOG | POWER | GROUND | CLOCK } ;]
     [NETEXPR "netExprPropName defaultNetName" ;]
     [SUPPLYSENSITIVITY powerPinName ;]
     [GROUNDSENSITIVITY groundPinName ;]
     [SHAPE {ABUTMENT | RING | FEEDTHRU} ;]
     [MUSTJOIN pinName ;]
     {PORT [CLASS {NONE | CORE | BUMP} ;] {layerGeometries} ... END} ...
     [PROPERTY propName propVal ;] ...
     [ANTENNAPARTIALMETALAREA value
     [LAYER layerName] ;] ...
     [ANTENNAPARTIALMETALSIDEAREA value
     [LAYER layerName] ;] ...
     [ANTENNAPARTIALCUTAREA value
     [LAYER layerName] ;] ...
     [ANTENNADIFFAREA value
     [LAYER layerName] ;] ...
     [ANTENNAMODEL {OXIDE1 | OXIDE2 | OXIDE3 | OXIDE4} ;] ...
     [ANTENNAGATEAREA value
     [LAYER layerName] ;] ...
     [ANTENNAMAXAREACAR value LAYER layerName ;] ...
     [ANTENNAMAXSIDEAREACAR value LAYER layerName ;] ...
     [ANTENNAMAXCUTCAR value LAYER layerName ;] ...
END pinName]

### Layer geometry

{ LAYER layerName
    [EXCEPTPGNET]
    [SPACING minSpacing | DESIGNRULEWIDTH value] ;
    [WIDTH width ;] { PATH
    [MASK maskNum] pt ... ; | PATH
    [MASK maskNum] ITERATE pt ... stepPattern ; | RECT
    [MASK maskNum] pt pt ; | RECT
    [MASK maskNum] ITERATE pt pt stepPattern ; | POLYGON
    [MASK maskNum] pt pt pt pt ... ; | POLYGON
    [MASK maskNum] ITERATE pt pt pt pt ... stepPattern ; } ... | VIA
    [MASK viaMaskNum] pt viaName ; | VIA ITERATE
    [MASK viaMaskNum] pt viaName stepPattern ;
} ...
