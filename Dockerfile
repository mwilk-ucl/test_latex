FROM debian:latest 

# Install all TeX and LaTeX dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-lang-french \
    texlive-xetex && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
VOLUME . /app
RUN xelatex /app/document.tex

