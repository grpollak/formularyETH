#!/bin/bash
# Create Formulary Structure
formularyName=${1:-formulary}
mkdir src
mkdir figures

while [ -n "$1" ]
# while loop starts
do
case "$1" in
# -p option
-p) cp formularyETH/TEMPLATES/.projectile ./.projectile;;
# unrecognized optioni
*) echo "Option $1 not recognized" ;;
esac
shift
done

cp formularyETH/TEMPLATES/formulary_settingsTEMPLATE.tex ./formulary_settings.tex
cp formularyETH/TEMPLATES/formularyTEMPLATE.tex ./formulary.tex
cp formularyETH/TEMPLATES/formularyMacrosTEMPLATE.sty ./formularyMacros.sty
cp formularyETH/TEMPLATES/README.org ./README.org
# Stream EDitor: in OSX -i expect some argument => empty ''
sed -i '' -e 's/placeholder/'"$formularyName"'/' README.org
cp formularyETH/.gitignore .
echo Finished
