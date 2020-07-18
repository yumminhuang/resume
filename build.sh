#!/bin/bash

# THIS SCRIPT IS USED TO AUTO-BUILD ON TRAVIS-CI

# install texlive 2016 and dependencies
apt-get update && \
apt-get install -y --no-install-recommends \
    texlive-latex-extra \
    texlive-lang-chinese \
    texlive-formats-extra \
    texlive-fonts-recommended \
    fonts-font-awesome

# run xelatex
xelatex Resume.tex -interaction=nonstopmode
xelatex Resume_ZH.tex -interaction=nonstopmode

rm *.aux *.log *.out
