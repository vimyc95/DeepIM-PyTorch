# FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
FROM nvidia/cudagl:11.1.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y python3-dev python3-pip git vim make cmake pkg-config build-essential curl

RUN ln -s /usr/bin/python3 /usr/bin/python
# RUN ln -s /usr/bin/pip3 /usr/bin/pip

# Install ROS noetic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update && apt install -y ros-noetic-desktop-full
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# RUN source ~/.bashrc
RUN apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN rosdep init && rosdep update


RUN pip install --upgrade pip
RUN pip install torch==1.8.2 torchvision==0.9.2 torchaudio==0.8.2 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cu111
RUN python -m pip install detectron2 -f \
    https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html
RUN pip install cupy-cuda111

RUN pip install numpy==1.23
RUN pip install scipy pyassimp==4.1.3 easydict transforms3d

# Fix some assimp bug, we need remove ori assimp, then reinstall assimp from source code at version 4.1.0
RUN apt remove -y libassimp-dev && apt install wget
RUN mkdir CMAKE && cd /CMAKE \
   && wget https://github.com/assimp/assimp/archive/refs/tags/v4.1.0.zip \
   && unzip v4.1.0.zip \
   && cd assimp-4.1.0  \
   && mkdir build && cd build \
   && cmake .. \
   && make -j8 && make install 


WORKDIR /DeepIM

# build some lib 
# RUN cd /DeepIM && ./build.sh
# RUN cd /DeepIM/lib/point_matching_loss/ && python setup.py install

ENV DISPLAY :0
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute
ENV TERM=xterm
# Some QT-Apps don't show controls without this
ENV QT_X11_NO_MITSHM 1
