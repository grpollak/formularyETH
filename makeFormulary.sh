#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
url="git@gitlab.vis.ethz.ch:pollakg/formularyETH.git"

mkdir $formularyName
cd $formularyName
mkdir src

git init
git submodule add $url formularyETH
if [ $? -eq 0 ]; then
    echo Added submoduel
else
    echo Could not add submodule $url
fi

cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./$formularyName.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty .
cp formularyETH/.gitignore .
echo Finished
