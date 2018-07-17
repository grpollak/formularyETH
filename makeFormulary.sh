#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
mkdir src
mkdir figures

# -n checks if argument is $1 non-empty
while [ -n "$1" ]
# while loop starts
do
    case "$1" in
    # -p option: add projectile project file ./projectile
    -p) cp formularyETH/TEMPLATES/.projectile ./.projectile;;
    # -m option: add math formulary: git@gitlab.vis.ethz.ch:formularies/math.git
    -m) git submodule add git@gitlab.vis.ethz.ch:formularies/math.git;;
    # unrecognized optioni
    *) echo "Option $1 not recognized" ;;
    esac # Stop program
    shift # Shift $1 to the next input argument
done

cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./formulary.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty ./formularyMacros.sty
cp formularyETH/TEMPLATES/README.org ./README.org
# Stream EDitor: in OSX -i expect some argument => empty ''
sed -i '' -e 's/placeholder/'"$formularyName"'/' README.org
cp formularyETH/.gitignore .
echo Finished
