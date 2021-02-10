apk update
apk upgrade
apk add make alpine-sdk go su-exec
adduser -G abuild -D jobber
su jobber -c "abuild-keygen -an"
find "/home/jobber/.abuild" -name '*.rsa.pub' -exec mv {} /etc/apk/keys/ ';'
chown root:root /etc/apk/keys/*
chmod a+w . packaging/alpine
su jobber -c "echo "$PWD" && make -C packaging/alpine pkg-local DESTDIR=$PWD/pkgs/"
