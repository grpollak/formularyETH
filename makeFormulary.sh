#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
mkdir src
mkdir figures

cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./formulary.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty ./formularyMacros.sty
cp formularyETH/TEMPLATES/README.org ./README.org
# Stream EDitor: in OSX -i expect some argument => empty ''
sed -i '' -e 's/placeholder/'"$formularyName"'/' README.org
cp formularyETH/.gitignore .
echo Finished
