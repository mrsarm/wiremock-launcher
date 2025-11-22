WireMock Launcher
=================

[WireMock](https://wiremock.org/docs/standalone/) Launcher scripts.

The launcher uses by default Docker to run WireMock, but
if you have Java 11+ installed, you can run WireMock directly,
just edit the scripts uncommenting the part that starts WireMock
with Java and comment out the Docker part. It would make
your life easier because running it with Java you easily can
mock services running locally using `localhost`, while
with Docker you have to use `172.18.0.1` (or `host.docker.internal`
in Linux), but not always work depending on your Docker and
network configurations (a script is also provided to setup the firewall,
but is not required to run WireMock).

The following scripts are provided:

- `wiremock-record.sh`: Launches WireMock to record requests, e.g.
   `./wiremock-record.sh http://172.18.0.1:5000`. Use the option
   `-h` to see how to use it.
- `wiremock-play.sh`: Launches WireMock in playback mode. Just run
   `./wiremock-play.sh`.
- `firewall-rules.sh`: if you use `ufw` to setup your firewall, these
   are a set of commands to allow traffic in a secure way, specially
   if you run WireMock with Docker, although read the rules to
   see if they apply to you local setup.



### About

- Author: Mariano Ruiz (2025)
- Project: https://github.com/mrsarm/wiremock-launcher
- License: Apache-2.0
