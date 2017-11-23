FROM alpine

MAINTAINER Ryan Schuhler <ryan.schuhler@liferay.com>

RUN apk update \
  && apk upgrade \
  && apk add --no-cache bash curl openjdk8 tree unzip \
  && addgroup -S liferay \
  && adduser -S -g liferay liferay

ARG LIFERAY_HOME
ARG LIFERAY_TOMCAT_URL
ARG MODULES_URL

ENV LIFERAY_CONFIG_DIR=/tmp/liferay/configs
ENV LIFERAY_DEPLOY_DIR=/tmp/liferay/deploy
ENV LIFERAY_HOME=$LIFERAY_HOME
ENV LIFERAY_SHARED=/storage/liferay
ENV LIFERAY_WEB_SERVER_PROTOCOL=https
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-8.0.32

ENV PATH=$PATH:$CATALINA_HOME/bin

WORKDIR /usr/local

RUN mkdir -p "$LIFERAY_HOME" \
  && set -x \
  && curl -fSL "$LIFERAY_TOMCAT_URL" -o bundle.zip \
  && unzip bundle.zip \
  && rm bundle.zip \
  && chown -R liferay:liferay $LIFERAY_HOME

RUN if [ "$MODULES_URL" != "" ]; then \
    set -x \
    && curl -fSL "$MODULES_URL" -o /tmp/workspace.zip \
    && unzip /tmp/workspace.zip -d /tmp \
    && rm /tmp/workspace.zip \
    && chown -R liferay:liferay /tmp/www-workspace-master \
    && chmod +x /tmp/www-workspace-master/gradlew \
    && /tmp/www-workspace-master/gradlew build; \
    #&& /tmp/www-workspace-master/gradlew deploy; \
  fi

COPY ./entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080/tcp
EXPOSE 11311/tcp

COPY ./configs/ $LIFERAY_CONFIG_DIR
COPY ./deploy/ $LIFERAY_DEPLOY_DIR

ENTRYPOINT ["entrypoint.sh"]
CMD ["catalina.sh", "run"]