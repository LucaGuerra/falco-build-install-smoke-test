FROM docker.io/library/fedora:39

RUN rpm --import https://falco.org/repo/falcosecurity-packages.asc

RUN curl -s -o /etc/yum.repos.d/falcosecurity.repo https://falco.org/repo/falcosecurity-rpm.repo

RUN dnf update -y

RUN dnf install -y falco

RUN falco --version
