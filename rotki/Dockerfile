# set the base image to Debian
# https://hub.docker.com/_/debian/
FROM ubuntu:22.04
# FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive
# Set Python and Pip versions
ENV PYTHON_VERSION=3.10.10
ENV PYTHON_PIP_VERSION=21.3.1

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 18.18.2

SHELL ["/bin/bash", "-c"]

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
&& apt-get install -y curl git \
&& apt-get -y autoclean

#PYENV
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev
RUN curl https://pyenv.run | bash
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN source ~/.bashrc && pyenv install -v 3.10
RUN pyenv global 3.10
RUN pyenv shell 3.10


#PYTHON
RUN apt-get install build-essential software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update && apt-get install -y python3.11 python3-pip

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
 && nvm install $NODE_VERSION \
 && nvm alias default $NODE_VERSION \
 && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

COPY . /app

WORKDIR /app/frontend/

# RUN npm install -g pnpm@8 && pnpm install --no-optional --frozen-lockfile

# RUN apt install -y python3-virtualenvwrapper
# COPY ./requirements.txt /app/requirements.txt
# WORKDIR /app/
# RUN pip3 install -r requirements.txt

# ARG REVISION
# ARG ROTKI_VERSION
# ENV REVISION=$REVISION
# ENV ROTKI_VERSION=$ROTKI_VERSION
# nvm environment variables
VOLUME ["/data", "/logs", "/config"]

EXPOSE 80

# CMD ["pnpm run dev"]
# CMD ["pnpm run dev:web"]

# HEALTHCHECK CMD curl --fail http://localhost/api/1/ping || exit 1
