FROM ubuntu:22.04

# Set temp work directory
# for package configuration
WORKDIR /usr/src/cache

ENV PYTHON_VERSION = 3.11
ENV DEBIAN_FRONTEND noninteractive

# Update apt packages
RUN apt update
#RUN apt upgrade -y

# Install vim
#RUN apt install vim -y
#RUN apt install nano -y

# Install python PYTHON_VERSION
RUN apt-get install build-essential software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update && apt-get install -y python3.11

# Make python PYTHON_VERSION the default
#RUN echo "alias python=python${PYTHON_VERSION}" >> ~/.bashrc
#RUN export PATH=${PATH}:/usr/bin/python${PYTHON_VERSION}
#RUN /bin/bash -c "source ~/.bashrc"

# Install pip
#RUN apt install python3-pip -y
#RUN python -m pip install --upgrade pip

