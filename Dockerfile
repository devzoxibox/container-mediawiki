# Builds docker image for mediawiki
FROM zoxi/container-debian:latest

MAINTAINER zoxi

# Installation des dépendances et de Mediawiki
ADD install.sh /tmp/install.sh
RUN chmod +x /tmp/*.sh && \
    /bin/bash /tmp/install.sh
