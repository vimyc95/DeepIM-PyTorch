xhost +local:root
docker run -it --rm --gpus all --privileged --network=host -v $(pwd)/../:/DeepIM/ -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env="DISPLAY" cudagl11.1 /bin/bash

#docker run -it --rm --gpus all -v $(pwd)/../:/DeepIM/ cudagl11.1 /bin/bash
