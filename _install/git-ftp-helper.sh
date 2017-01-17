#!/usr/bin/env bash

FTP_CONFIG_URI=./_install/ftp-config.sh

GIT_FTP_SH_URI=./_install/git-ftp.sh


if [ ! -f ${FTP_CONFIG_URI} ]; then
    echo "FTP Configuration file not found"
else


    source ${FTP_CONFIG_URI}


    echo "Configuring for FTP: ${FTP_URL}"

    git config git-ftp.url ${FTP_URL}
    git config git-ftp.user ${FTP_USERNAME}
    git config git-ftp.password ${FTP_PASSWORD}

    # Upload all files
    sh ${GIT_FTP_SH_URI} $1

    # Or if the files are already there
    #sh ${GIT_FTP_SH_URI} catchup

fi
