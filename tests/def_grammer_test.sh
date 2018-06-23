R='\033[0;31m'
G='\033[0;32m'
NC='\033[0m' # No Color
#gen test grammer
antlr4 $PWD/../grammer/def.g4 -o def_grammer/
cd def_grammer
javac *.java
#test sub rules
keywords="layer via viarule macro"
#loop over all files for each subrule

for file in ../defref.def ../ispd18_test1.def ../def/*.def ; do
  unset t_std t_err
  #redirect stdout and stderr to vars
  eval "$( ( cat $file | grun def def -tree ) \
        2> >(t_err=$(cat); typeset -p t_err) \
         > >(t_std=$(cat); typeset -p t_std) )"
  #checks if stderr is empty, if not print file with error
  if [[ $t_err ]]; then
    printf "${R}$file failes parsing${NC}\n $t_err\n"
  else
    printf "${G}$file passes parsing${NC}\n"
  fi
done
