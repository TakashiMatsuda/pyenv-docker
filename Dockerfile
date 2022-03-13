# Python Development Environment
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git vim -y

RUN curl https://pyenv.run | bash
RUN echo "export PATH=\"$HOME/.pyenv/bin:$PATH\"" >> ~/.bashrc \
  echo "eval \"\$(pyenv init --path)\"" >> ~/.bashrc \
  echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.bashrc

ENV PYTHON_VERSION=3.6.13
RUN export PATH="$HOME/.pyenv/bin:$PATH" && \
  eval "$(pyenv init --path)" && \
  eval "$(pyenv virtualenv-init -)" && \
  pyenv install ${PYTHON_VERSION} && pyenv global ${PYTHON_VERSION} \
  && pip install --upgrade pip
