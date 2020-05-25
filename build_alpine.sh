apk update
apk add go rsync make git gcc musl-dev alpine-sdk tree
adduser --disabled-password  jobber
sh -c "echo 'jobber ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"
cd /tmp
git clone https://github.com/odidev/jobber/
chmod -R a+w jobber
rm -rf /var/cache/distfiles
mkdir -p /var/cache/distfiles
chmod a+w /var/cache/distfiles
chgrp abuild /var/cache/distfiles
chmod g+w /var/cache/distfiles
addgroup jobber abuild
su - jobber -c "abuild-keygen -a -i"
su - jobber -c "cd /tmp/jobber; make -C packaging/alpine pkg-local"
tree /home/jobber/packages/packaging/
