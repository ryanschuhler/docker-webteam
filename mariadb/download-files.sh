#!/bin/bash

MIRROR=http://mirrors/files.liferay.com/private

DATABASE_DEST=resources/docker-entrypoint-initdb.d/db.sql.gz
DATABASE_URL=${MIRROR}/lrdcom/www_lportal-2018-04-08_19-00-PDT.sql.gz

downloadFile() {
    URL=$1
    DEST=$2

    echo "Downloading ${URL} to ${DEST}"

    curl -o ${DEST} -fSL ${URL}
}

downloadFile ${DATABASE_URL} ${DATABASE_DEST}
