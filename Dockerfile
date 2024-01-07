# syntax=docker/dockerfile:1

FROM ubuntu:rolling

RUN apt-get update && apt-get install -y curl \
  && curl -fsSL https://apt.cli.rs/pubkey.asc | tee -a /usr/share/keyrings/rust-tools.asc \
  && curl -fsSL https://apt.cli.rs/rust-tools.list | tee /etc/apt/sources.list.d/rust-tools.list \
  && apt-get update && apt-get install -y \
    build-essential \
    texlive-base \
    texlive-lang-english \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-fonts-extra \
    texlive-luatex \
    fonts-mononoki \
    watchexec-cli \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/
  
RUN mkdir -p /opt/resume
WORKDIR /opt/resume
CMD watchexec -e tex make