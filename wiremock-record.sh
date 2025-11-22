#!/usr/bin/env bash
#
# https://wiremock.org/docs/standalone/java-jar/
# https://wiremock.org/docs/request-matching/
#
if [ "$#" -ne 1 -o "$1" = "-h" -o "$1" = "--help" ]; then
  echo 'wiremock-record.sh: record site with WireMock.'
  echo
  echo "Use: ./wiremock-record.sh SITE"
  echo
  echo "Access to the site through http://localhost:5555/[RESOURCE]"
  echo
  echo "Once started you can check-out the mappings"
  echo "at http://localhost:5555/__admin/"
  echo
  echo "NOTE: do not include in the SITE URL the path prefix, e.g. instead"
  echo "      of  ./wiremock-record.sh http://api.site.com:3000/api/v1/"
  echo "      use ./wiremock-record.sh http://api.site.com:3000"
  exit 2
fi

. set-version.sh

#### start with java
# JAR="wiremock-standalone-$VERSION.jar"
# if [ ! -f "wiremock-standalone-$VERSION.jar" ]; then
#   echo "Downloading WireMock $VERSION ..."
#   curl --max-time 120 "https://repo1.maven.org/maven2/org/wiremock/wiremock-standalone/$VERSION/$JAR" -o "$JAR"
# fi

# java -jar $JAR --port 5555 --verbose --record-mappings --proxy-all "$1"
#### end start with java

#### start with docker
docker run -it --rm \
       -p 5555:5555 \
       --name wiremock \
       -v $PWD:/home/wiremock \
       --add-host=host.docker.internal:host-gateway \
       "wiremock/wiremock:$VERSION" \
       --port 5555 --verbose --record-mappings --proxy-all "$1"
#### end start with docker
