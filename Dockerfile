FROM ubuntu:20.04

# Install texlive 2016 and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        fonts-font-awesome \
        texlive-fonts-recommended \
        texlive-formats-extra \
        texlive-lang-chinese \
        texlive-latex-extra && \
    rm -rf /var/lib/apt/lists/*

# Install tlmgr package
