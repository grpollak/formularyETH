#!/bin/bash
# Create Formulary Structure
url="git@gitlab.vis.ethz.ch:pollakg/formularyETH.git"
mkdir formulary
cd formulary
mkdir src
git init
git submodule add $url formularyETH
if [ $? -eq 0 ]; then
    echo Added submoduel
else
    echo Could not add submodule $url
fi
cp formularyETH/formulary.tex .
cp formularyETH/formularyMacros.tex .
cp formularyETH/.gitignore .
echo Finished
