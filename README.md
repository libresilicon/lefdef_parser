# lefdef_parser

lefdef parser implementation

## Status

* [ ] lef
    * [x] extract lef rules from ref manual
    * [x] grammer defined and tested
    * [ ] setting up c++ datastructures
      * [x] pasted motifed qtflow datastructures
      * [ ] enhance datastructures and put them in database object
      * [ ] setup cmake
    * [ ] populating the database struct with the parsed lef (visitor functions)    
* [ ] def
    * [x] extract def rules from ref manual
    * [x] grammer defined
        * [ ] and tested (a lot of rules are still broken)
    * [ ] setting up c++ datastructures
      * [x] pasted motifed qtflow datastructures
      * [ ] enhance datastructures and put them in database object
      * [ ] setup cmake
    * [ ] populating the database struct with the parsed def (visitor functions)

## Test

```bash
cd tests
bash lef_grammer_test.sh
bash def_grammer_test.sh
```

## Requirements

antlr4 and grun as alias like this

```bash
>>> cat `which antlr4`
#!/bin/sh
java -jar /usr/share/java/antlr-complete.jar "$@"
>>> cat `which grun`
#!/bin/sh
java -cp .:/usr/share/java/antlr-complete.jar org.antlr.v4.gui.TestRig "$@"
```
