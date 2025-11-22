WireMock Launcher
=================

[WireMock](https://wiremock.org/) Launcher scripts.

The launchers use by default Docker to run WireMock, but
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


### Useful links

- [WireMock Standalone Service](https://wiremock.org/docs/standalone/)
- [Request Matching](https://wiremock.org/docs/request-matching/)


### Tips

If running WireMock with Docker (default), the `mappings` and `__files`
folders will be created in this same directory but with `root` permissions
only, so if you want to edit them, just run before:

```sh
sudo chown $USER -R __files/ mappings/
```

### About

- Author: Mariano Ruiz (2025)
- Project: https://github.com/mrsarm/wiremock-launcher
- License: Apache-2.0
