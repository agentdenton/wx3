FROM ubuntu:22.04

ARG USERNAME

# Set non-interactive frontend for apt-get to skip any user confirmations
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --no-install-recommends -y git cmake ninja-build gperf ccache \
 dfu-util device-tree-compiler wget python3-dev python3-pip python3-setuptools \
 python3-tk python3-wheel python3-venv xz-utils file make gcc gcc-multilib \
 g++-multilib libsdl2-dev libmagic1 curl locales sudo vim usbutils \
 libusb-1.0-0-dev

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN useradd --shell=/bin/bash --create-home $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME
ENV PATH="${PATH}:/home/$USERNAME/.local/bin"

RUN pip3 install west
RUN west init ~/zephyrproject && cd ~/zephyrproject && west update
RUN cd ~/zephyrproject/zephyr && west zephyr-export

RUN python3 -m venv ~/zephyrproject/.venv
RUN pip install -r ~/zephyrproject/zephyr/scripts/requirements.txt

RUN cd ~/zephyrproject && \
 wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.15.2/zephyr-sdk-0.15.2_linux-x86_64.tar.gz && \
 wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.15.2/sha256.sum | shasum --check --ignore-missing && \
 tar xvf zephyr-sdk-0.15.2_linux-x86_64.tar.gz && \
 rm zephyr-sdk-0.15.2_linux-x86_64.tar.gz

RUN ~/zephyrproject/zephyr-sdk-0.15.2/setup.sh -t all -h -c

CMD ["bash"]
