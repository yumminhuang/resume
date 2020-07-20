#!/usr/bin/env bash

# THIS SCRIPT IS USED TO AUTO-BUILD

# install texlive 2019 and dependencies
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
        fonts-font-awesome \
        texlive-fonts-recommended \
        texlive-formats-extra \
        texlive-lang-chinese \
        texlive-latex-extra

# run xelatex
xelatex Resume.tex -interaction=nonstopmode
xelatex Resume_ZH.tex -interaction=nonstopmode

rm *.aux *.log *.out
