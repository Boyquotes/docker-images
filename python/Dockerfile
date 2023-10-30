FROM ubuntu:latest

# Set temp work directory
# for package configuration
WORKDIR /usr/src/cache

ENV PYTHON_VERSION = 3.7

# Update apt packages
RUN apt update
RUN apt upgrade -y

# Install vim
RUN apt install vim -y
RUN apt install nano -y

# Install python PYTHON_VERSION
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install pythonPYTHON_VERSION -y

# Make python PYTHON_VERSION the default
RUN echo "alias python=pythonPYTHON_VERSION" >> ~/.bashrc
RUN export PATH=${PATH}:/usr/bin/pythonPYTHON_VERSION
RUN /bin/bash -c "source ~/.bashrc"

# Install pip
RUN apt install python3-pip -y
RUN python -m pip install --upgrade pip

