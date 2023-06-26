# syntax=docker/dockerfile:1
FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

# region=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# apt use tsinghua source
RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

# install python 3.8 and other deps
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install python3.8 -y
RUN apt install python3-pip -y

# copy code
WORKDIR /app
COPY . /app

# pip use tsinghua source
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# install packages
RUN pip install -r requirements.txt
RUN pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --extra-index-url https://download.pytorch.org/whl/cu118
RUN pip install imageio==2.4.1
RUN pip install moviepy

# Build monotonic align
WORKDIR /app/monotonic_align
RUN mkdir monotonic_align
RUN python3 setup.py build_ext --inplace
WORKDIR /app

# Pre-precess and train
ENTRYPOINT ["./preproc-train.sh"]
