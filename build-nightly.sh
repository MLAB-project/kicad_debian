#!/bin/sh
# KiCad nightly doesn't include the global symbol lib table:
#cp /usr/share/kicad/template/sym-lib-table .
#cp /usr/share/kicad/template/fp-lib-table .
docker build -f Dockerfile-nightly -t mlabproject/kicad_debian:bullseye-5.99-20200922 .
docker build -f Dockerfile-nightly -t mlabproject/kicad_debian:nightly .
