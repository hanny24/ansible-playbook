#!/bin/bash
TARGET=/mnt/strnad
uid=$(id -u)
gid=$(id -g)
#pkexec mkdir -p ${TARGET}

pkexec mount.cifs //files-users.srv.int.avast.com/users/strnad ${TARGET} -o user=strnad,uid=$uid,gid=$gid,vers=2.1
