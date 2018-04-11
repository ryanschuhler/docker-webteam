FROM alpine:latest AS liferay-build

ARG BUILD_RESOURCES_DIR=/tmp/build-resources
ARG BUILD_SCRIPTS
ARG BUNDLE_URL
ARG JAVA_PACKAGE
ARG LICENSE_URL
ARG LIFERAY_BUNDLE_NAME=bundle.zip
ARG PATCH_URLS

ENV LIFERAY_HOME /opt/java/liferay

RUN apk update \
  && apk upgrade \
  && apk add bash curl git $JAVA_PACKAGE unzip zip

COPY ./build-resources/ ${BUILD_RESOURCES_DIR}/

RUN ${BUILD_RESOURCES_DIR}/scripts/get-dependencies.sh

RUN if [ -f "${BUILD_RESOURCES_DIR}/${LIFERAY_BUNDLE_NAME}" ] \
  ; then \
    set -x \
    && mkdir -p /opt/java \
    && unzip ${BUILD_RESOURCES_DIR}/${LIFERAY_BUNDLE_NAME} -d /opt/java \
    && find /opt/java -depth -maxdepth 1 -type d -name "liferay-*" -exec mv {} /opt/java/liferay \; \
    && mkdir -p /opt/java/liferay/deploy \
    && find /opt/java/liferay -depth -maxdepth 1 -type d -name "tomcat-*" -exec mv {} /opt/java/liferay/tomcat \; \
    && mkdir -p ${LIFERAY_HOME}/bin/startup \
    && cp ${BUILD_RESOURCES_DIR}/license.xml ${LIFERAY_HOME}/bin/startup/license.xml \
  ; fi

RUN chmod +x ${BUILD_RESOURCES_DIR}/scripts/*.sh \
  && for script in $(echo ${BUILD_SCRIPTS} | sed "s/,/ /g") \
    ; do \
       if [ -f ${BUILD_RESOURCES_DIR}/scripts/${script} ] \
       ; then \
         echo "Running ${script}"; \
         bash -x "${BUILD_RESOURCES_DIR}/scripts/${script}" \
       ; fi \
    ; done

COPY ./resources/ ${LIFERAY_HOME}/

FROM alpine:latest

ARG JAVA_PACKAGE

RUN apk update \
  && apk upgrade \
  && apk add --no-cache bash $JAVA_PACKAGE \
  && addgroup -S liferay \
  && adduser -S -G liferay liferay

ENV LIFERAY_HOME /opt/java/liferay

USER liferay:liferay

COPY --chown=liferay:liferay --from=liferay-build $LIFERAY_HOME $LIFERAY_HOME

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 8080
EXPOSE 11311

ENTRYPOINT ["entrypoint.sh"]
CMD ["/opt/java/liferay/tomcat/bin/catalina.sh", "run"]
