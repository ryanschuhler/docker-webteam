#!/bin/bash -x

GIT_BRANCH=7.0.x-private
GIT_REPO=git@github.com:ryanschuhler/liferay-portal-ee.git
REPO_DIR=${BUILD_RESOURCES_DIR}/repo

[ -d ${REPO_DIR} ] || mkdir ${REPO_DIR}

cd ${REPO_DIR}

ssh-add -K ${BUILD_RESOURCES}/.ssh/id_rsa

git clone -b ${GIT_BRANCH} ${GIT_REPO}
