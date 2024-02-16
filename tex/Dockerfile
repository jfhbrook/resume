# syntax=docker/dockerfile:1

FROM ubuntu:rolling

RUN apt-get update && apt-get install -y \
    build-essential \
    texlive-base \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-fonts-extra \
    texlive-luatex \
    fonts-mononoki \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN mktexlsr

RUN mkdir -p /opt/resume
WORKDIR /opt/resume
ENTRYPOINT make