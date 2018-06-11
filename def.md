# DEF

[ VERSION statement ]
    [ DIVIDERCHAR statement ]
    [ BUSBITCHARS statement ]
    DESIGN statement
    [ TECHNOLOGY statement ]
    [ UNITS statement ]
    [ HISTORY statement ]...
    [ PROPERTYDEFINITIONS section ]
    [ DIEAREA statement ]
    [ ROWS statement ]...
    [ TRACKS statement ]...
    [ GCELLGRID statement ]...
    [ VIAS statement ]
    [ STYLES statement ]
    [ NONDEFAULTRULES statement ]
    [ REGIONS statement ]
    [ COMPONENTMASKSHIFT statement ]
    [ COMPONENTS section ]
    [ PINS section ]
    [ PINPROPERTIES section ]
    [ BLOCKAGES section ]
    [ SLOTS section ]
    [ FILLS section ]
    [ SPECIALNETS section ]
    [ NETS section ]
    [ SCANCHAINS section ]
    [ GROUPS section ]
    [ BEGINEXT section ]...
END DESIGN statement

## DIVIDERCHAR

DIVIDERCHAR "character" ;

## BUSBITCHARS

BUSBITCHARS "delimiterPair" ;

## DESIGN

DESIGN designName ;

## TECHNOLOGY

[TECHNOLOGY technologyName ;]

## UNITS

[UNITS DISTANCE MICRONS dbuPerMicron ;]

## HISTORY

[HISTORY anyText ;]...

## PROPERTYDEFINITIONS

[PROPERTYDEFINITIONS [objectType propName propType [RANGE min max] [value | stringValue] ;] ... END PROPERTYDEFINITIONS]

## DIEAREA

[DIEAREA pt pt [pt]...;]


## ROWS

[ROW rowName siteName origX origY siteOrient [DO numX BY numY [STEP stepX stepY]][+ PROPERTY {propName propVal} ...] ... ;] ..

## TRACKS

[TRACKS [{X | Y} start DO numtracks STEP space [MASK maskNum [SAMEMASK]] [LAYER layerName ...] ;] ...]


## GCELLGRID

[GCELLGRID {X start DO numColumns+1 STEP space} ... {Y start DO numRows+1 STEP space ;} ...]


## VIAS

[VIAS numVias ;
 [– viaName [ + VIARULE viaRuleName + CUTSIZE xSize ySize + LAYERS botmetalLayer cutLayer topMetalLayer + CUTSPACING xCutSpacing yCutSpacing + ENCLOSURE xBotEnc yBotEnc xTopEnc yTopEnc
[+ ROWCOL numCutRows NumCutCols]
 [+ ORIGIN xOffset yOffset]
 [+ OFFSET xBotOffset yBotOffset xTopOffset yTopOffset]
 [+ PATTERN cutPattern]
 ]
 | [ + RECT layerName [+ MASK maskNum]
 pt pt | + POLYGON layerName [+ MASK maskNum]
 pt pt pt]
 ...
]
 ;
]
 ...
 END VIAS]


## STYLES

[STYLES numStyles ;
 {- STYLE styleNum pt pt ...
 ;
} ...
 END STYLES]


## NONDEFAULTRULES

NONDEFAULTRULES numRules ;
 {- ruleName [+ HARDSPACING]
 {+ LAYER layerName WIDTH minWidth [DIAGWIDTH diagWidth]
 [SPACING minSpacing]
 [WIREEXT wireExt]
 } ...
 [+ VIA viaName]
 ...
 [+ VIARULE viaRuleName]
 ...
 [+ MINCUTS cutLayerName numCuts]
 ...
 [+ PROPERTY {propName propVal} ...
]
 ...
 ;
} ...
 END NONDEFAULTRULES

## REGIONS

[REGIONS numRegions ;
 [- regionName {pt pt} ...
 [+ TYPE {FENCE | GUIDE}]
 [+ PROPERTY {propName propVal} ...
]
 ...
 ;
]
 ...
 END REGIONS]


## COMPONENTMASKSHIFT


## COMPONENTS

COMPONENTS numComps ;
 [– compName modelName [+ EEQMASTER macroName]
 [+ SOURCE {NETLIST | DIST | USER | TIMING}]
 [+ {FIXED pt orient | COVER pt orient | PLACED pt orient | UNPLACED} ]
 [+ MASKSHIFT shiftLayerMasks]
 [+ HALO [SOFT]
 left bottom right top]
 [+ ROUTEHALO haloDist minLayer maxLayer]
 [+ WEIGHT weight]
 [+ REGION regionName]
 [+ PROPERTY {propName propVal} ...
]
...
 ;
]
 ...
 END COMPONENTS

## PINS

[PINS numPins ;
 [ [– pinName + NET netName]
 [+ SPECIAL]
 [+ DIRECTION {INPUT | OUTPUT | INOUT | FEEDTHRU}]
 [+ NETEXPR "netExprPropName defaultNetName"]
 [+ SUPPLYSENSITIVITY powerPinName]
 [+ GROUNDSENSITIVITY groundPinName]
 [+ USE {SIGNAL | POWER | GROUND | CLOCK | TIEOFF | ANALOG | SCAN | RESET}]
 [+ ANTENNAPINPARTIALMETALAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINPARTIALMETALSIDEAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINPARTIALCUTAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINDIFFAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAMODEL {OXIDE1 | OXIDE2 | OXIDE3 | OXIDE4}]
 ...
 [+ ANTENNAPINGATEAREA value [LAYER layerName]
]
 ...

[+ ANTENNAPINMAXAREACAR value LAYER layerName]
 ...
 [+ ANTENNAPINMAXSIDEAREACAR value LAYER layerName]
 ...
 [+ ANTENNAPINMAXCUTCAR value LAYER layerName]
 ...
 [[+ PORT]
 [+ LAYER layerName [MASK maskNum]
 [SPACING minSpacing | DESIGNRULEWIDTH effectiveWidth]
 pt pt |+ POLYGON layerName [MASK maskNum]
 [SPACING minSpacing | DESIGNRULEWIDTH effectiveWidth]
 pt pt pt ...
 |+ VIA viaName [MASK viaMaskNum]
 pt]
 ...
 [+ COVER pt orient | FIXED pt orient | PLACED pt orient]
 ]
...
 ;
 ]
 ...
 END PINS]


[PINS numPins ;
 [ [– pinName + NET netName]
 [+ SPECIAL]
 [+ DIRECTION {INPUT | OUTPUT | INOUT | FEEDTHRU}]
 [+ NETEXPR "netExprPropName defaultNetName"]
 [+ SUPPLYSENSITIVITY powerPinName]
 [+ GROUNDSENSITIVITY groundPinName]
 [+ USE {SIGNAL | POWER | GROUND | CLOCK | TIEOFF | ANALOG | SCAN | RESET}]
 [+ ANTENNAPINPARTIALMETALAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINPARTIALMETALSIDEAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINPARTIALCUTAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINDIFFAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAMODEL {OXIDE1 | OXIDE2 | OXIDE3 | OXIDE4}]
 ...
 [+ ANTENNAPINGATEAREA value [LAYER layerName]
]
 ...


## PINPROPERTIES

[PINPROPERTIES num ;
 [- {compName pinName | PIN pinName} [+ PROPERTY {propName propVal} ...
]

 ...
 ;
]
 ...
 END PINPROPERTIES]


## BLOCKAGES

[BLOCKAGES numBlockages ;
 [- LAYER layerName [ + SLOTS | + FILLS]
 [ + PUSHDOWN]
 [ + EXCEPTPGNET]
 [ + COMPONENT compName]
 [ + SPACING minSpacing | + DESIGNRULEWIDTH effectiveWidth]
 [ + MASK maskNum]
 {RECT pt pt | POLYGON pt pt pt ...
} ...
 ;
]
 ...
 [- PLACEMENT [ + SOFT | + PARTIAL maxDensity]
 [ + PUSHDOWN]
 [ + COMPONENT compName {RECT pt pt} ...
 ;
]
 ...
 END BLOCKAGES]


## SLOTS

[SLOTS numSlots ;
 [- LAYER layerName {RECT pt pt | POLYGON pt pt pt ...
 } ...
 ;
]
 ...
 END SLOTS]


## FILLS

[FILLS numFills ;
 [- LAYER layerName [+ MASK maskNum]
 [+ OPC]
 {RECT pt pt | POLYGON pt pt pt ...
} ...
 ;
]
 ...
 [- VIA viaName [+ MASK viaMaskNum]
 [+ OPC]
 pt ...
 ;
]
 ...
 END FILLS]


## SPECIALNETS

[SPECIALNETS numNets ;
 [– netName [ ( {compName pinName | PIN pinName} [+ SYNTHESIZED]
 ) ]
 ...
 [+ VOLTAGE volts]
 [specialWiring]
 ...
 [+ SOURCE {DIST | NETLIST | TIMING | USER}]
 [+ FIXEDBUMP]
 [+ ORIGINAL netName]
 [+ USE {ANALOG | CLOCK | GROUND | POWER | RESET | SCAN | SIGNAL | TIEOFF}]
 [+ PATTERN {BALANCED | STEINER | TRUNK | WIREDLOGIC}]
 [+ ESTCAP wireCapacitance]
 [+ WEIGHT weight]
 [+ PROPERTY {propName propVal} ...
]
 ...
 ;
]
 ...
 END SPECIALNETS]


### SPECIALWIRINGSTATEMENT

[[+ COVER | + FIXED | + ROUTED | + SHIELD shieldNetName]
 [+ SHAPE shapeType]
 [+ MASK maskNum]
 + POLYGON layerName pt pt pt ...
 | + RECT layerName pt pt | + VIA viaName [orient]
 pt ...
 |{+ COVER | + FIXED | + ROUTED | + SHIELD shieldNetName} layerName routeWidth [+ SHAPE {RING | PADRING | BLOCKRING | STRIPE | FOLLOWPIN | IOWIRE | COREWIRE | BLOCKWIRE | BLOCKAGEWIRE | FILLWIRE | FILLWIREOPC | DRCFILL}]
 [+ STYLE styleNum]
 routingPoints [NEW layerName routeWidth [+ SHAPE {RING | PADRING | BLOCKRING | STRIPE | FOLLOWPIN | IOWIRE | COREWIRE | BLOCKWIRE | BLOCKAGEWIRE | FILLWIRE | FILLWIREOPC | DRCFILL}]
 [+ STYLE styleNum]
 routingPoints ]
 ...
 ]
 ...


## NETS

NETS numNets ;
 [– { netName [ ( {compName pinName | PIN pinName} [+ SYNTHESIZED]
 ) ]
 ...
 | MUSTJOIN ( compName pinName ) } [+ SHIELDNET shieldNetName ]
 ...
 [+ VPIN vpinName [LAYER layerName]
 pt pt [PLACED pt orient | FIXED pt orient | COVER pt orient]
 ]
 ...
 [+ SUBNET subnetName [ ( {compName pinName | PIN pinName | VPIN vpinName} ) ]
 ...
 [NONDEFAULTRULE rulename]
 [regularWiring]
 ...
]
 ...
 [+ XTALK class]
 [+ NONDEFAULTRULE ruleName]
 [regularWiring]
 ...
 [+ SOURCE {DIST | NETLIST | TEST | TIMING | USER}]
 [+ FIXEDBUMP]
 [+ FREQUENCY frequency]
 [+ ORIGINAL netName]
 [+ USE {ANALOG | CLOCK | GROUND | POWER | RESET | SCAN | SIGNAL | TIEOFF}]
 [+ PATTERN {BALANCED | STEINER | TRUNK | WIREDLOGIC}]
 [+ ESTCAP wireCapacitance]
 [+ WEIGHT weight]
 [+ PROPERTY {propName propVal} ...
]
 ...
 ;
]
 ...
 END NETS

### PINS

[PINS numPins ;
 [ [– pinName + NET netName]
 [+ SPECIAL]
 [+ DIRECTION {INPUT | OUTPUT | INOUT | FEEDTHRU}]
 [+ NETEXPR "netExprPropName defaultNetName"]
 [+ SUPPLYSENSITIVITY powerPinName]
 [+ GROUNDSENSITIVITY groundPinName]
 [+ USE {SIGNAL | POWER | GROUND | CLOCK | TIEOFF | ANALOG | SCAN | RESET}]
 [+ ANTENNAPINPARTIALMETALAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINPARTIALMETALSIDEAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINPARTIALCUTAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINDIFFAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAMODEL {OXIDE1 | OXIDE2 | OXIDE3 | OXIDE4}]
 ...
 [+ ANTENNAPINGATEAREA value [LAYER layerName]
]
 ...
 [+ ANTENNAPINMAXAREACAR value LAYER layerName]
 ...
 [+ ANTENNAPINMAXSIDEAREACAR value LAYER layerName]
 ...
 [+ ANTENNAPINMAXCUTCAR value LAYER layerName]
 ...
 [[+ PORT]
 [+ LAYER layerName [MASK maskNum]
 [SPACING minSpacing | DESIGNRULEWIDTH effectiveWidth]
 pt pt |+ POLYGON layerName [MASK maskNum]
 [SPACING minSpacing | DESIGNRULEWIDTH effectiveWidth]
 pt pt pt ...
 |+ VIA viaName [MASK viaMaskNum]
 pt]
 ...
 [+ COVER pt orient | FIXED pt orient | PLACED pt orient]
 ]
...
 ;
 ]
 ...
 END PINS]


#### PORT

[[+ PORT]
 [ + LAYER layerName [ SPACING minSpacing | DESIGNRULEWIDTH effectiveWidth]
 pt pt | + POLYGON layerName [ SPACING minSpacing | DESIGNRULEWIDTH effectiveWidth]
 pt pt pt | + VIA viaName pt ]
 ...
 ]


## SCANCHAINS

[SCANCHAINS numScanChains ;
 [- chainName [+ PARTITION partitionName [MAXBITS maxbits]
]
 [+ COMMONSCANPINS [ ( IN pin )]
 [( OUT pin ) ]
 ]
 + START {fixedInComp | PIN} [outPin]
 [+ FLOATING {floatingComp [ ( IN pin ) ]
 [ ( OUT pin ) ]
 [ ( BITS numBits ) ]
} ...
]
 [+ ORDERED {fixedComp [ ( IN pin ) ]
 [ ( OUT pin ) ]
 [ ( BITS numBits ) ]
} ...
 ]
 ...
 + STOP {fixedOutComp | PIN} [inPin]
 ]
 ;
]
 ...
 END SCANCHAINS]


## GROUPS

[GROUPS numGroups ;
 [– groupName compNamePattern ...
 [+ REGION regionNam]
 [+ PROPERTY {propName propVal} ...
]
 ...
 ;
]
 ...
 END GROUPS]


## BEGINEXT

[BEGINEXT "tag" extensionText ENDEXT]
