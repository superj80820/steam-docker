docker build . -t=steam
docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix steam