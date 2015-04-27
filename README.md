#MediaWiki

##Description :

MediaWiki is a free software open source wiki package written in PHP, originally for use on Wikipedia. It is now also used by several other projects of the non-profit Wikimedia Foundation and by many other wikis, including this website, the home of MediaWiki.

![Alt text](http://upload.wikimedia.org/wikipedia/commons/0/01/MediaWiki-smaller-logo.png "")


##Montage pre-build :

```shell
$ docker pull zoxi/container-mediawiki
```

##Volumes :

####/config
Pour les fichiers de configuration de mediawiki

####/database
Pour la persistence des bases de données mysql


##Attention :
Le mot de passe par défaut pour root (mysql,phpmyadmin) est "password".
Je vous conseils de le modifier dans phpmyadmin (http://ip_unraid_server:8081/phpmyadmin), avant de configurer MediaWiki.


