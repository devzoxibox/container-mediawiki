# Builds docker image for mediawiki
FROM zoxi/container-debian:latest

MAINTAINER zoxi

# Installation des dépendances et de Mediawiki
ADD /script/install.sh /tmp/install.sh
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

# Ajout des droits à "/config"
RUN chown -R nobody:users /config

# Ajout du script de démarrage 
ADD start.sh /start.sh
RUN chmod +x /*.sh

# Passage en user "nobody"
USER nobody

ENTRYPOINT ["/start.sh"]
