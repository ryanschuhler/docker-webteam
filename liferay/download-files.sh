#!/bin/bash

MIRROR=http://mirrors/files.liferay.com/private

BUNDLE_DEST=build-resources/bundle.zip
BUNDLE_URL=${MIRROR}/ee/portal/7.0.10/liferay-dxp-digital-enterprise-tomcat-7.0-ga1-20160617092557801.zip
LICENSE_DEST=resources/bin/startup/license.xml
LICENSE_URL=${MIRROR}/ee/liferay-up/License/7.0/license.xml
PATCHES_DEST=build-resources/patches
PATCH_URLS=${MIRROR}/ee/fix-packs/7.0.10/de/liferay-fix-pack-de-44-7010.zip

downloadFile() {
    URL=$1
    DEST=$2

    echo "Downloading ${URL} to ${DEST}"

    curl -o ${DEST} -fSL ${URL}
}

downloadFile ${BUNDLE_URL} ${BUNDLE_DEST}
downloadFile ${LICENSE_URL} ${LICENSE_DEST}

for PATCH in $(echo ${PATCH_URLS} | sed "s/,/ /g")
do
    downloadFile ${PATCH} ${PATCHES_DEST}/${PATCH##*/}
done
