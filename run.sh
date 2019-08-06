#!/bin/zsh

if [ -z $1 ];then
    cmd="/opt/pix4dmapper/bin/pix4dmapper"
else
    cmd="$*"
fi

[ -d data ] || mkdir data

docker run -it --rm \
    -v $PWD/data:/app/data \
    -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
    cleberzavadniak/pix4dmapper \
    "$cmd"
