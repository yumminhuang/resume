#!/bin/bash

# THIS SCRIPT IS USED TO AUTO-BUILD ON TRAVIS-CI

# install texlive 2015 and dependencies
apt-get update && \
apt-get install -y --no-install-recommends \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-lang-chinese \
    texlive-formats-extra \
    lmodern \
    wget \
    xzdec

cd resume/
# intsall latex packages
wget http://ctan.mackichan.com/macros/plain/contrib/misc/ulem.sty
# run xelatex
xelatex Resume.tex -interaction=nonstopmode
xelatex Resume_ZH.tex -interaction=nonstopmode

rm *.aux *.log *.out
