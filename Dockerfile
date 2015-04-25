# Builds docker image for mediawiki
FROM zoxi/container-debian:latest

MAINTAINER zoxi

# Installation des dépendances et de Mediawiki
ADD /scripts/install.sh /tmp/install.sh
RUN chmod +x /tmp/*.sh && \
    /bin/bash /tmp/install.sh
    

# Config apache2
ADD /apache/phpmyadmin.conf /etc/apache2/conf.d/phpmyadmin.conf
ADD /apache/mediawiki.conf /etc/apache2/conf.d/mediawiki.conf

# Ports
EXPOSE 8081
EXPOSE 8088

# Volume
VOLUME /config

# Ajout des droits
RUN chown -R nobody:users /config
RUN chown -R nobody:users /etc/apache2
RUN chown -R nobody:users /usr/share/mediawiki

# Ajout du script de démarrage 
ADD /scripts/start.sh /start.sh
RUN chmod +x /*.sh

USER nobody

ENTRYPOINT ["/start.sh"]
