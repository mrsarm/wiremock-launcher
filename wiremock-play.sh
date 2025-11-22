#!/usr/bin/env bash

if [ "$#" -ne 0 ]; then
  echo 'wiremock-play.sh: play site recorded with WireMock.'
  echo
  echo "Use: ./wiremock-play.sh"
  echo
  echo "Once started you can check-out the mappings"
  echo "at http://localhost:5555/__admin/"
  exit 2
fi

. set-version.sh

#### start with java
# JAR="wiremock-standalone-$VERSION.jar"
# if [ ! -f "wiremock-standalone-$VERSION.jar" ]; then
#   echo "Downloading WireMock $VERSION ..."
#   curl --max-time 120 "https://repo1.maven.org/maven2/org/wiremock/wiremock-standalone/$VERSION/$JAR" -o "$JAR"
# fi

# java -jar $JAR --port 5555 --verbose
#### end start with java

#### start with docker
docker run -it --rm \
       -p 5555:5555 \
       --name wiremock \
       -v $PWD:/home/wiremock \
       "wiremock/wiremock:$VERSION" \
       --port 5555 --verbose
#### end start with docker
