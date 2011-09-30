#!/bin/sh

cp *.zip /var/www/scls/realisations/harmon
cp screenshot*.* /var/www/scls/realisations/harmon

ncftpput -u s.cls ftpperso.free.fr realisations/harmon harmon_cpp_qt.zip screenshot*.*