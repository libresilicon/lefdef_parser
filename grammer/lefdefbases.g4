grammar lefdefbases;

import caseinsenstivefragments;

VERSION:                    V E R S I O N;
BUSBITCHARS:                B U S B I T C H A R S;
DIVIDERCHAR:                D I V I D E R C H A R;

fragment INT: '-'? [0-9]+;
fragment FLOAT: '-'? [0-9]*'.'?[0-9]+ ;
fragment HEX: [0-9A-Fa-f];

WS: [ \t\r\n]+ -> channel(HIDDEN);
Comment: '#'.*?'\n' -> channel(HIDDEN);

RECT:                       R E C T;
POLYGON:                    P O L Y G O N;

ORIENTATION: (N|E|S|W|(F N)|(F E)|(F S)|(F W));
NUMBER: (INT | FLOAT) ;
IDSTRING:  [a-zA-Z_] [a-zA-Z0-9_]*;
STRING : '"' ( '\\"' | . )*? '"' ;
OXIDE:                      O X I D E [1-4];
CORE: C O R E;

version: VERSION num sem;
busbitchars: BUSBITCHARS STRING sem ;
dividerchar: DIVIDERCHAR STRING sem ;
sem: ';' ;
id: IDSTRING | ORIENTATION | CORE;
num: NUMBER;
HEXNUM: HEX+;

point: num num;

basepolygon: POLYGON point point point+;
baserect:    RECT point point;
baserect_or_polygon: (rect|polygon);
