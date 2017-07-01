#!/bin/bash

set -e

# URL of Font-Awesome repository on Github
FONTAWESOME_URL='https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master'
FONTAWESOME_CSS="$FONTAWESOME_URL/css/font-awesome.css"
FONTAWESOME_TTF="$FONTAWESOME_URL/fonts/fontawesome-webfont.ttf"

echo 'Downloading Font-Awesome...'
curl -O $FONTAWESOME_CSS -O $FONTAWESOME_TTF

# Local path
script_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
resume_root=$(dirname "${script_root}")

echo 'Brewing fontawesome.sty...'
python "${script_root}/fs_sty.py" 'font-awesome.css' > "${script_root}/fontawesome.sty"

echo 'Moving output files...'
[ -f "${resume_root}/fontawesome.sty" ] && $(rm "${resume_root}/fontawesome.sty")
[ -r "${resume_root}/fonts" ] && $(rm -rf "${resume_root}/fonts")
mkdir -p "${resume_root}/fonts"
mv fontawesome-webfont.ttf "${resume_root}/fonts/"
mv fontawesome.sty "${resume_root}"

echo 'Removing font-awesome.css'
rm font-awesome.css
