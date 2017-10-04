#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
mkdir src
mkdir figures

cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./formulary.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty ./formularyMacros.sty
cp formularyETH/TEMPLATES/README.org ./README.org
sed -i -e 's/formulary/$formularyName/' README.org
cp formularyETH/.gitignore .
echo Finished
