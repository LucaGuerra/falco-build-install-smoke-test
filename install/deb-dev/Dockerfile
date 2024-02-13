FROM debian:12

RUN apt-get update && apt-get -y install curl gpg

RUN curl -fsSL https://falco.org/repo/falcosecurity-packages.asc | \
  gpg --dearmor -o /usr/share/keyrings/falco-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/falco-archive-keyring.gpg] https://download.falco.org/packages/deb-dev stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list

RUN apt-get update -y

RUN FALCO_FRONTEND=noninteractive apt-get install -y falco=0.38.0-12+f66780e

RUN falco --version
