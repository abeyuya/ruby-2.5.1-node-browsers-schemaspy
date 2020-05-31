# https://github.com/CircleCI-Public/circleci-dockerfiles/blob/master/ruby/images/2.5.1-stretch/node-browsers/Dockerfile
FROM circleci/ruby:2.5.1-node-browsers

# https://github.com/schemaspy/schemaspy/blob/master/Dockerfile
ENV LC_ALL=C

ARG GIT_BRANCH=local
ARG GIT_REVISION=local

ENV POSTGRESQL_VERSION=42.1.1

LABEL POSTGRESQL_VERSION=$POSTGRESQL_VERSION
LABEL GIT_BRANCH=$GIT_BRANCH
LABEL GIT_REVISION=$GIT_REVISION

USER root

RUN apt-get install graphviz && \
    mkdir /drivers_inc && \
    cd /drivers_inc && \
    curl -JLO http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/$POSTGRESQL_VERSION.jre7/postgresql-$POSTGRESQL_VERSION.jre7.jar && \
    mkdir /output

ADD docker/jar/schema*.jar /usr/local/lib/schemaspy/
