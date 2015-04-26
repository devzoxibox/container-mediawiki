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

ENV APACHE_RUN_USER nobody
ENV APACHE_RUN_GROUP users
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_SERVERADMIN admin@localhost

# Volume
VOLUME /config

# Ajout des droits
RUN chown -R nobody:users /config
RUN chown -R nobody:users /usr/share/mediawiki

EXPOSE 80
EXPOSE 8081

# Ajout du script de démarrage 
ADD /scripts/start.sh /start.sh
RUN chmod +x /*.sh


ENTRYPOINT ["/start.sh"]
