FROM gradle:jdk8

LABEL maintainer="Phillip Booth <phillip.booth@intersystems.com>"

ADD ./synthea-entrypoint.sh /bash/

RUN chmod 755 /bash/synthea-entrypoint.sh

WORKDIR /

RUN git clone https://github.com/synthetichealth/synthea.git

WORKDIR /synthea

#Generating the executable synthea-with-dependencies.jar so that Patients can be generated as needed.
RUN gradle uberJar

WORKDIR /

# 1) Create an app directory to leave the generated jar
# 2) Copy the necessary jar files over to this app directory
# 3) Remove all of the synthea source code. Only thing necessary is the generated jar file.
RUN mkdir app && \
    cp ./synthea/build/libs/*.jar /app/ && \
    rm -rf ./synthea

ENTRYPOINT ["/bash/synthea-entrypoint.sh"]
