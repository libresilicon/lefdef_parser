grammar def;

import defkeywords, lefdefbases ;

point: POPEN num num PCLOSE;
basepolygon: POLYGON point point point+;
baserect: RECT point point;
baserect_or_polygon: ( basepolygon | baserect );

property: (PLUS PROPERTY (propName=id propVal)+)+;
propVal: ( num | STRING );

def: defstatements+;
defstatements: version
             | dividerchar
             | busbitchars
             | design
             | technology
             | units
             | history
             | propertydefinitions
             | diearea
             | rows
             | tracks
             | gcellgrid
             | vias
             | styles
             | nondefaultrules
             | regions
             | componentmaskshift
             | components
             | pins
             | pinproperties
             | blockages
             | slots
             | fills
             | specialnet
             | nets
             | scanchain
             | groups
             | beginext
             | END DESIGN statement=id;

version: VERSION num sem;
dividerchar: DIVIDERCHAR STRING sem;
busbitchars: BUSBITCHARS STRING sem;
design: DESIGN id sem;
rows: ROW rowName=id siteName=id origX=num origY=num siteOrient=ORIENTATION
      (DO numX=num BY numY=num (STEP stepX=num stepY=num)?)? property? sem;
diearea: DIEAREA point point+ sem;
history: HISTORY .*? sem;
tracks: TRACKS ((X_CORD | Y_CORD) start=num DO numtracks=num STEP space=num (MASK maskNum=num (SAMEMASK)?)? (LAYER layerName=id+)? sem)+;
technology: TECHNOLOGY id sem;
units: UNITS DISTANCE MICRONS dbuPerMicron=num sem;
//this rule is rare from the docs, dont know how to set it up properly
gcellgrid : GCELLGRID ((X_CORD start=num DO numColumns=num STEP space=num) | (Y_CORD start=num DO numRows=num STEP space=num)) sem;
propertydefinitions: PROPERTYDEFINITIONS
    (objectType propName=id propType (RANGE min=id max=id) propVal? sem)+
    END PROPERTYDEFINITIONS;
objectType: (COMPONENT | COMPONENTPIN | DESIGN | GROUP | NET | NONDEFAULTRULE | REGION | ROW | SPECIALNET);
propType: (INTEGER | REAL | STRING);
cutPattern: cutPatternBase ('_' cutPatternBase)*;
cutPatternBase: num '_' (HEXNUM)+;
shapeType: (RING | PADRING | BLOCKRING | STRIPE | FOLLOWPIN | IOWIRE | COREWIRE | BLOCKWIRE | BLOCKAGEWIRE | FILLWIRE | FILLWIREOPC | DRCFILL);

vias: VIAS numVias=num sem via* END VIAS ;
via: (generatedvia | fixedvia);
generatedvia: MINUS viaName=id PLUS VIARULE viaRuleName=id
    PLUS CUTSIZE xSize=num ySize=num
    PLUS LAYERS botmetalLayer=id cutLayer=id topMetalLayer=id
    PLUS CUTSPACING xCutSpacing=num yCutSpacing=num
    PLUS ENCLOSURE xBotEnc=num yBotEnc=num xTopEnc=num yTopEnc=num
    (PLUS ROWCOL numCutRows=num numCutCols=num)?
    (PLUS ORIGIN xOffset=num yOffset=num)?
    (PLUS OFFSET xBotOffset=num yBotOffset=num xTopOffset=num yTopOffset=num)?
    (PLUS PATTERN cutPattern)?;
fixedvia
     : PLUS RECT layerName=id (PLUS MASK maskNum=num)? point point
     | PLUS POLYGON layerName=id (PLUS MASK maskNum=num)? point point point+;

styles: STYLES numStyles=num sem MINUS STYLE styleNum=num point point+ sem END STYLES;

nondefaultrules: NONDEFAULTRULES numRules=num sem nondefaultrule+ END NONDEFAULTRULES;
nondefaultrule: MINUS ruleName=id (PLUS HARDSPACING)?
     (PLUS LAYER layerName=id WIDTH minWidth=num
     (DIAGWIDTH diagWidth=num)? (SPACING minSpacing=num)? (WIREEXT wireExt=num)? )+
     (PLUS VIA viaName=id)*
     (PLUS VIARULE viaRuleName=id)*
     (PLUS MINCUTS cutLayerName=id numCuts=num)*
     property? sem;

regions: REGIONS numRegions=num sem region+ END REGIONS;
region: MINUS regionName=id baserect+ (PLUS TYPE (FENCE | GUIDE))? sem;

componentmaskshift: COMPONENTMASKSHIFT layers=id+ sem;

components: COMPONENTS numComps=num sem component+ END COMPONENTS;
component:
     MINUS compName=id modelName=id
     (PLUS EEQMASTER macroName=id)?
     (PLUS SOURCE (NETLIST | DIST | USER | TIMING))?
     (PLUS (((FIXED | COVER | PLACED) point orient=ORIENTATION) | UNPLACED) )?
     (PLUS MASKSHIFT shiftLayerMasks=num)?
     (PLUS HALO (SOFT)? left=num bottom=num right=num top=num)?
     (PLUS ROUTEHALO haloDist=num minLayer=id maxLayer=id)?
     (PLUS WEIGHT weight=num)?
     (PLUS REGION regionName=id)?
     property? sem;

pinproperties: PINPROPERTIES num sem
    (MINUS (compName=id pinName=id | PIN pinName=id) property)+
    END PINPROPERTIES;

blockages: BLOCKAGES numBlockages=num sem blockage+ END BLOCKAGES sem;
blockage:(layerblockage|placementblockage);
layerblockage
     : MINUS LAYER layerName=id
     (PLUS (SLOTS | FILLS))? ( PLUS PUSHDOWN)? ( PLUS EXCEPTPGNET)?
     ( PLUS COMPONENT compName=id)?
     ( PLUS (SPACING minSpacing=num | DESIGNRULEWIDTH effectiveWidth=num))?
     ( PLUS MASK maskNum=num)? baserect_or_polygon+ sem;

placementblockage
    : MINUS PLACEMENT (PLUS (SOFT | PARTIAL maxDensity=num))?
    ( PLUS PUSHDOWN)? ( PLUS COMPONENT compName=id)? baserect+ sem;

slots: SLOTS numSlots=num sem
      (MINUS LAYER layerName=id baserect_or_polygon+ sem)+
      END SLOTS;

fills: FILLS numFills=num sem fill* END FILLS;
fill: MINUS LAYER layerName=id (PLUS MASK maskNum=num)? (PLUS OPC)? baserect_or_polygon+ sem
    | MINUS VIA viaName=id (PLUS MASK viaMaskNum=num)?  (PLUS OPC)? point+ sem;

specialnets: SPECIALNETS numNets=num sem specialnet END SPECIALNETS;
specialnet: MINUS netName=id (((compName=id pinName=id) | (PIN pinName=id)) (PLUS SYNTHESIZED))+
     (PLUS VOLTAGE volts=num)? (specialWiring+)?
     (PLUS SOURCE (DIST | NETLIST | TIMING | USER))?
     (PLUS FIXEDBUMP)?
     (PLUS ORIGINAL netName=id)?
     (PLUS USE (ANALOG | CLOCK | GROUND | POWER | RESET | SCAN | SIGNAL | TIEOFF))?
     (PLUS PATTERN (BALANCED | STEINER | TRUNK | WIREDLOGIC))?
     (PLUS ESTCAP wireCapacitance=num)?
     (PLUS WEIGHT weight=num)?
     ((PLUS property)+)? sem;

specialWiring
    : ((PLUS COVER) | (PLUS FIXED) | (PLUS ROUTED) | (PLUS SHIELD shieldNetName=id))
         (PLUS SHAPE shapeType)? (PLUS MASK maskNum=num)? basepolygon+
    | PLUS RECT layerName=id point point
    | PLUS VIA viaName=id ORIENTATION? point+
    |((PLUS COVER) | (PLUS FIXED) | (PLUS ROUTED) | (PLUS SHIELD shieldNetName=id))
      layerName=id routeWidth=num specialwireshape?
         (PLUS STYLE styleNum=num)? routingPoints
         (NEW layerName=id routeWidth=num specialwireshape?
            (PLUS STYLE styleNum=num)? routingPoints)+;

routingPoints: routingPoint+;
routingPoint: POPEN x=num y=num (extValue=num)? PCLOSE routingMask;
routingMask: (MASK maskNum=num)? POPEN x=num y=num (extValue=num)? PCLOSE
        | (MASK viaMaskNum=num)? viaName=id (orient=ORIENTATION)?
        | (MASK maskNum=num)? RECT POPEN deltax1=num deltay1=num deltax2=num deltay2=num PCLOSE
        | VIRTUAL POPEN x=num y=num PCLOSE;
specialwireshape: PLUS SHAPE ( RING | PADRING | BLOCKRING | STRIPE | FOLLOWPIN |
  IOWIRE | COREWIRE | BLOCKWIRE |BLOCKAGEWIRE | FILLWIRE | FILLWIREOPC | DRCFILL);

nets: NETS numNets=num sem net+ END NETS;
net: pin_or_join
     (PLUS SHIELDNET shieldNetName=id)*
     (PLUS VPIN vpinName=id (LAYER layerName=id)? point point ((PLACED | FIXED | COVER) point orient=ORIENTATION)?)?
     subnet*
     (PLUS XTALK class_num=num)?
     (PLUS NONDEFAULTRULE ruleName=id)?
     regularWiring*
     (PLUS SOURCE (DIST | NETLIST | TEST | TIMING | USER))?
     (PLUS FIXEDBUMP)?
     (PLUS FREQUENCY frequency=num)?
     (PLUS ORIGINAL netName=id)?
     (PLUS USE (ANALOG | CLOCK | GROUND | POWER | RESET | SCAN | SIGNAL | TIEOFF))?
     (PLUS PATTERN (BALANCED | STEINER | TRUNK | WIREDLOGIC))?
     (PLUS ESTCAP wireCapacitance=num)?
     (PLUS WEIGHT weight=num)?
     (property)? sem;

regularWiring: PLUS (COVER | FIXED |  ROUTED | NOSHIELD)
        layerName=id ((TAPER) | (TAPERRULE ruleName=id))? (STYLE styleNum=num)?
        routingPoints (NEW layerName=id ((TAPER) | (TAPERRULE ruleName=id))? (STYLE styleNum=num)? routingPoints )+ sem;

pin_or_join: MINUS netName=id (POPEN (compName=id pinName=id | PIN pinName=id) (PLUS SYNTHESIZED)? PCLOSE)+
           | MINUS MUSTJOIN ( compName=id pinName=id ) ;

subnet: PLUS SUBNET subnetName=id
    (compName=id pinName=id | PIN pinName=id | VPIN vpinName=id)*
    (NONDEFAULTRULE rulename=id)? regularWiring+;

pins: PINS numPins=num sem pin* END PINS;
pin: MINUS pinName=id PLUS NET netName=id
 (PLUS SPECIAL)?
 (PLUS DIRECTION (INPUT | OUTPUT | INOUT | FEEDTHRU))?
 (PLUS NETEXPR '"' netExprPropName=id defaultNetName=id '"' )?
 (PLUS SUPPLYSENSITIVITY powerPinName=id)?
 (PLUS GROUNDSENSITIVITY groundPinName=id)?
 (PLUS USE (SIGNAL | POWER | GROUND | CLOCK | TIEOFF | ANALOG | SCAN | RESET))?
 (PLUS ANTENNAPINPARTIALMETALAREA value=num (LAYER layerName=id)?)*
 (PLUS ANTENNAPINPARTIALMETALSIDEAREA value=num (LAYER layerName=id)?)*
 (PLUS ANTENNAPINPARTIALCUTAREA value=num (LAYER layerName=id)?)*
 (PLUS ANTENNAPINDIFFAREA value=num (LAYER layerName=id)?)*
 (PLUS ANTENNAMODEL OXIDE)*
 (PLUS ANTENNAPINGATEAREA value=num (LAYER layerName=id)?)*
 (PLUS ANTENNAPINMAXAREACAR value=num LAYER layerName=id)*
 (PLUS ANTENNAPINMAXSIDEAREACAR value=num LAYER layerName=id)*
 (PLUS ANTENNAPINMAXCUTCAR value=num LAYER layerName=id)*
  port+
 (PLUS (COVER | FIXED | PLACED) point orient=ORIENTATION)?;

port: PLUS PORT port_geo+;
port_geo: PLUS LAYER layerName=id   (SPACING minSpacing=num | DESIGNRULEWIDTH effectiveWidth=num)? point point
        | PLUS POLYGON layerName=id (SPACING minSpacing=num | DESIGNRULEWIDTH effectiveWidth=num)? point point point+
        | PLUS VIA viaName=id point+;

scanchains: SCANCHAINS numScanChains=num sem scanchain+ END SCANCHAINS;
scanchain: MINUS chainName=id (PLUS PARTITION partitionName=id (MAXBITS maxbits=num)?)?
 (PLUS COMMONSCANPINS (POPEN IN pin_id=id PCLOSE)? (POPEN OUT pin_id=id PCLOSE)?)?
 PLUS START (fixedInComp=id | PIN) (outPin=id)?
 (PLUS FLOATING (floatingComp=id (POPEN IN pin_id=id PCLOSE)? (POPEN OUT pin_id=id PCLOSE)?  (POPEN BITS numBits=num PCLOSE)? )+ )?
 (PLUS ORDERED (fixedComp=id (POPEN IN pin_id=id PCLOSE)? (POPEN OUT pin_id=id PCLOSE)? (POPEN BITS numBits=num PCLOSE)?)+ )?
 PLUS STOP (fixedOutComp=id | PIN) (inPin=id)? sem ;

groups: GROUPS numGroups=num sem
     (MINUS groupName=id compNamePattern=id+
     (PLUS REGION regionName=id)?
     property sem)+
     END GROUPS;

beginext: BEGINEXT tag=STRING extensionText=.*? ENDEXT;
