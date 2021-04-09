#!/bin/sh

echo "Create sharing directory"
mkdir -p /media/storage
chmod 0777 /media/storage
echo "shared content" > /media/storage/shared-file.txt

echo "Create local group and user"
addgroup -g 1000 smbgroup
adduser --no-create-home --disabled-password --uid 1000 --shell /bin/false --ingroup smbgroup smbuser

echo "Create samba user"
echo -e "pass\npass" | smbpasswd -a -s smbuser

echo "Setup finished"
