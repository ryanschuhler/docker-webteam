#!/bin/bash

MIRROR=http://mirrors/files.liferay.com/private

BUNDLE_URL=${MIRROR}/ee/portal/7.0.10/liferay-dxp-digital-enterprise-tomcat-7.0-ga1-20160617092557801.zip
DATABASE_URL=${MIRROR}/lrdcom/www_lportal-2018-04-08_19-00-PDT.sql.gz
LICENSE_URL=${MIRROR}/ee/liferay-up/License/7.0/license.xml
PATCH_URLS=${MIRROR}/ee/fix-packs/7.0.10/de/liferay-fix-pack-de-44-7010.zip

BUNDLE_DEST=liferay/build-resources/bundle.zip
DATABASE_DEST=mariadb/resources/docker-entrypoint-initdb.d/${DATABASE_URL##*/}
LICENSE_DEST=liferay/resources/bin/startup/license.xml
PATCHES_DEST=liferay/build-resources/patches

downloadFile() {
    URL=$1
    DEST=$2

    echo "Downloading ${URL} to ${DEST}"

    curl -o ${DEST} -fSL ${URL}
}

rm ${BUNDLE_DEST}
rm ${DATABASE_DEST}
rm ${LICENSE_DEST}
rm ${PATCHES_DEST}/*.zip

downloadFile ${BUNDLE_URL} ${BUNDLE_DEST}
downloadFile ${DATABASE_URL} ${DATABASE_DEST}
downloadFile ${LICENSE_URL} ${LICENSE_DEST}

for PATCH in $(echo ${PATCH_URLS} | sed "s/,/ /g")
do
    downloadFile ${PATCH} ${PATCHES_DEST}/${PATCH##*/}
done
