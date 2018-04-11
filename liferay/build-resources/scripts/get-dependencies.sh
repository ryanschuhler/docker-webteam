#!/bin/bash

CREDENTIALS=""

if [ -f "${BUILD_RESOURCES_DIR}/.username" ] && [ -f "${BUILD_RESOURCES_DIR}/.password" ]; then
  CREDENTIALS="-u $(cat ${BUILD_RESOURCES_DIR}/.username):$(cat ${BUILD_RESOURCES_DIR}/.password)"
fi

downloadFile() {
    URL=$1
    DEST=$2

    if [ ! -f ${DEST} ]; then
      echo "Downloading ${URL} to ${DEST}"

      curl ${CREDENTIALS} -o ${DEST} -fSL ${URL}
    else
      echo "Skipping download because ${DEST} already exists."
    fi
}

downloadFile ${BUNDLE_URL} ${BUILD_RESOURCES_DIR}/bundle.zip
downloadFile ${LICENSE_URL} ${LIFERAY_HOME}/bin/startup/license.xml

for PATCH in $(echo ${PATCH_URLS} | sed "s/,/ /g")
do
    downloadFile ${PATCH} ${BUILD_RESOURCES_DIR}/patches/${PATCH##*/}
done
