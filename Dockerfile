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
RUN chown -R nobody:users /usr/share/mediawiki

RUN \
echo www-data > /etc/container_environment/APACHE_RUN_USER && \
echo www-data > /etc/container_environment/APACHE_RUN_GROUP && \
echo /var/log/apache2 > /etc/container_environment/APACHE_LOG_DIR && \
echo /var/lock/apache2 > /etc/container_environment/APACHE_LOCK_DIR && \
echo /var/run/apache2.pid > /etc/container_environment/APACHE_PID_FILE && \
echo /var/run/apache2 > /etc/container_environment/APACHE_RUN_DIR

# Ajout du script de démarrage 
ADD /scripts/start.sh /start.sh
RUN chmod +x /*.sh

# Passage en user "nobody"
USER nobody

ENTRYPOINT ["/start.sh"]
