FROM ubuntu:20.04

LABEL maintainer="yumminhuang"

# Install texlive 2019 and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fonts-font-awesome \
        texlive-fonts-recommended \
        texlive-formats-extra \
        texlive-lang-chinese \
        texlive-latex-extra && \
    rm -rf /var/lib/apt/lists/*

# Install tlmgr package
# RUN tlmgr init-usertree && \
#     tlmgr option repository ftp://tug.org/historic/systems/texlive/2019/tlnet-final

ENTRYPOINT [ "xelatex", "-interaction=nonstopmode"]
