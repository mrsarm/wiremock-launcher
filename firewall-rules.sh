#!/usr/bin/env bash
#
# Recommend set of rules for a secure firewall configuration,
# by default incoming connections from outside are blocked while
# allowing outgoing connections.
#
# Some of the rules use IP ranges from Docker, so containers
# can be accessed from outside Docker, either from only
# your local device or devices from your local network,
# depending on the IP range used.
#
# NOTE: the last rule actually doesn't work, and in The
#       comments below is explained why, and how to fix it
#       from Docker itself.
#
# To delete any of the rules, execute the same
# but replacing ' ... allow ...' with '... delete allow ...'

set -ex

# The following are normally the default rules once you
# enable ufw without making any change before, so applying
# them again won't have any effect, same for the rest
# of the rules if they were already set:

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw default deny routed


# Allow dockerized apps in this device to start connections
# to this device or outside docker containers/this device

sudo ufw allow proto tcp from 172.18.0.0/16
sudo ufw allow proto tcp from 172.17.0.0/16


# Allow my local network including this device to start
# connections to this device/itself. The IP range
# in the rule can be replaced with the exact IP of
# the device, e.g. the wlan0 interface IP address

sudo ufw allow proto tcp from 192.168.1.12
# sudo ufw allow proto tcp from 192.168.1.0/24
#        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#        This only works for local apps and port-forwarded apps
#        not running with Docker, because the Docker daemon setups
#        its own firewall rules with iptables that allow by default
#        any incoming connection to start, and cannot be prevented
#        with ufw.
#        To block connections to Docker containers from outside,
#        you have to setup the port forwarding from Docker
#        differently. Instead of:
#
#           docker run -p 8080:8080 ...
#
#        Use:
#
#           docker run -p 127.0.0.1:8080:8080 ...
#
#        Or in a compose.yaml file:
#
#           ports:
#             - "127.0.0.1:8080:8080"
#
