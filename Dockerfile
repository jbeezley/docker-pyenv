FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev python-openssl git python3-pip
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

ENV PYENV_ROOT=/root/.pyenv
ENV PATH="/root/.pyenv/bin:$PATH"

RUN pyenv install 3.6.9
RUN pyenv install 3.7.5
RUN pyenv install 3.8.0
RUN pyenv global 3.6.9 3.7.5 3.8.0
RUN pip3 install tox tox-pyenv
