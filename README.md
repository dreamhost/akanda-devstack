akanda-devstack
===============

Devstack plugin for Akanda specific configuration.
This repository use Devstack
[plugins mechanism] (http://devstack.org/plugins.html) to allow Akanda project
installation and configuration with the goal to provide an easy way to set up
a complete development environment.

To make Devstack aware of the plugin you need to:
* link or copy the akanda-devstack/akanda file into the devstack/lib folder
* link or copy the akanda-devstack/20-akanda.sh into the devstack/extras.d folder
