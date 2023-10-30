FROM debian:latest

SHELL ["/bin/bash", "-c"]

# update the repository sources list
# and install dependencies
RUN apt-get update \
&& apt-get install -y curl git

RUN apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev

# PyEnv
RUN curl https://pyenv.run | bash
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN source ~/.bashrc && pyenv install -v 3.10
RUN pyenv global 3.10
RUN pyenv shell 3.10
