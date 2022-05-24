#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
dir_name=$(basename "$PWD")

mkdir src
mkdir figures
mkdir macros
mkdir colors

# -n checks if argument is $1 non-empty
while [ -n "$1" ]
# while loop starts
do
    case "$1" in
    # -pr option: add projectile project file ./projectile
    -pr) cp formularyETH/TEMPLATES/.projectile ./.projectile;;
    # -p option: add python formulary as submodule
    -py) git submodule add git@gitlab.ethz.ch:formularies/python/python_submodule.git;;
    # -m option: add math formulary as submodule
    -m) git submodule add git@gitlab.ethz.ch:formularies/math_submodule.git;;
    # -c option: add c++ formulary as submodule
    -ml) git submodule add git@gitlab.ethz.ch:formularies/machine-learning/ml_submodule.git;;
    # -ml option: add machine learning formulary as submodule
    -dl) git submodule add git@gitlab.ethz.ch:formularies/deep-learning/dl_submodule.git;;
    # -dl option: add deep learning formulary as submodule
    -c) git submodule add git@gitlab.ethz.ch:formularies/cpp/cpp_submodule.git;;
    # -g option: add git formulary as submodule
    -g) git submodule add git@gitlab.ethz.ch:formularies/git/git_submodule.git;;
    # -b option: add bash formulary as submodule
    -b) git submodule add git@gitlab.ethz.ch:formularies/bash/bash_submodule.git;;
    # -l option: add latex formulary as submodule
    -l) git submodule add git@gitlab.ethz.ch:formularies/latex/latex_submodule.git;;
    # unrecognized optioni
    *) echo "Option $1 not recognized" ;;
    esac # Stop program
    shift # Shift $1 to the next input argument
done

cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./formulary.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty ./formularyMacros.sty
cp formularyETH/TEMPLATES/README.md ./README.md
cp formularyETH/.gitignore ./.gitignore
# Stream EDitor: in OSX -i expect some argument => empty ''
sed -i "s/placeholder/$dir_name/g" README.md
echo Finished
