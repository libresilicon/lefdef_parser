R='\033[0;31m'
G='\033[0;32m'
NC='\033[0m' # No Color
#gen test grammer
antlr4 $PWD/../grammer/lef.g4 -o lef_grammer/
cd lef_grammer
javac *.java
#test sub rules
keywords="layer via viarule macro"
#loop over all files for each subrule
for k in $keywords; do
    for file in `ls ../lef/${k}_*`; do
      unset t_std t_err
      #redirect stdout and stderr to vars
      eval "$( ( cat $file | grun lef $k -tree ) \
            2> >(t_err=$(cat); typeset -p t_err) \
             > >(t_std=$(cat); typeset -p t_std) )"
      #checks if stderr is empty, if not print file with error
      if [[ $t_err ]]; then
        printf "${R}$file failes parsing${NC}\n $t_err\n"
      else
        printf "${G}$file passes parsing${NC}\n"
      fi
    done
done

###
#Two bigger testfiles
###
eval "$( ( cat ../lefref.lef | grun lef lef -tree ) \
      2> >(t_err=$(cat); typeset -p t_err) \
       > >(t_std=$(cat); typeset -p t_std) )"
#checks if stderr is empty, if not print file with error
if [[ $t_err ]]; then
  printf "${R}lefref.lef failes parsing${NC}\n $t_err\n"
else
  printf "${G}lefref.lef passes parsing${NC}\n"
fi

eval "$( ( cat ../cells.lef | grun lef lef -tree ) \
      2> >(t_err=$(cat); typeset -p t_err) \
       > >(t_std=$(cat); typeset -p t_std) )"
#checks if stderr is empty, if not print file with error
if [[ $t_err ]]; then
  printf "${R}cells.lef failes parsing${NC}\n $t_err\n"
else
  printf "${G}cells.lef passes parsing${NC}\n"
fi
