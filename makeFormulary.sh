#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
mkdir src
mkdir figures

cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./$formularyName.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty ./formularyMacros.sty
cp formularyETH/.gitignore .
echo Finished
