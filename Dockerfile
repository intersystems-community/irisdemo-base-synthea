FROM openjdk:8-jdk-alpine

VOLUME /output

LABEL maintainer="Phillip Booth <phillip.booth@intersystems.com>"

ADD ./synthea_dist/synthea.tar /

ENV APP_HOME=/synthea

ENTRYPOINT [ "/synthea/bin/synthea"]
