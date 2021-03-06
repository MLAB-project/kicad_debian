# kicad_debian

Docker image for KiCad on Debian GNU/Linux.

The main objetive is to use it as a base for [KiCad automation in CI/CD environments](https://github.com/INTI-CMNB/kicad_ci_test).

The images are uploaded to [Docker Hub](https://hub.docker.com/repository/docker/setsoft/kicad_debian).

The current tags are:

* **10.3-5.0.2** is Debian 10.3 + KiCad 5.0.2 (default stable)
* **10.3-5.1.5** is Debian 10.3 + KiCad 5.1.5 (backport)
* **10.4-5.1.6** (same as **latest**) is Debian 10.4 + KiCad 5.1.6 (backport)
* **bullseye-5.99-20200922** (same as **nightly**) is Debian bullseye (will be 11) + KiCad 5.99 (20200922). An unstable beta.

The installations are minimal, but contains schematic and footprint libraries.
The 3D models aren't included, they weight 10 times the size of these images.

If you want to run interactively use:

```
export USER_ID=$(id -u)
export GROUP_ID=$(id -g)
docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    --user $USER_ID:$GROUP_ID \
    --env NO_AT_BRIDGE=1 \
    --workdir="/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/home/$USER:/home/$USER:rw" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/home/$USER:/home/$USER:rw" \
    setsoft/kicad_auto:10.3-5.1.5 kicad
```

The following scripts are provided as examples:

* [build.sh](https://github.com/INTI-CMNB/kicad_debian/blob/master/build.sh) creates the image from the [Dockerfile](https://github.com/INTI-CMNB/kicad_debian/blob/master/Dockerfile)
* [run_kicad_same_user.sh](https://github.com/INTI-CMNB/kicad_debian/blob/master/run_kicad_same_user.sh) runs KiCad using the same user you are using in the host system, your home directory is shared with the docker image.
* [run_shell_same_user.sh](https://github.com/INTI-CMNB/kicad_debian/blob/master/run_shell_same_user.sh) runs a shell using the same user you are using in the host system, your home directory is shared with the docker image.




