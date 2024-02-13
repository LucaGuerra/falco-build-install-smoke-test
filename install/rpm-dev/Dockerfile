FROM docker.io/library/fedora:39

RUN rpm --import https://falco.org/repo/falcosecurity-packages.asc

RUN curl -s -o /etc/yum.repos.d/falcosecurity-dev.repo https://falco.org/repo/falcosecurity-rpm-dev.repo

RUN dnf update -y

RUN dnf install -y falco

RUN falco --version
