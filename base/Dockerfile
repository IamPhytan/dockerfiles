FROM ubuntu:jammy

LABEL org.phicoltan.authors="phicoltan@gmail.com"

# Update system
RUN apt-get update && apt-get -y install \
    sudo \
    git \
    curl \
    wget \
    openssh-server \
    apt-transport-https \
    bash-completion \
    htop \
    tmux \
    tmuxinator \
    neovim \
    net-tools \
    gcc \
    g++ \
    python-is-python3 \
    python3-venv

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
WORKDIR /home/docker
USER docker

COPY dotfiles/.gitconfig /home/docker/.gitconfig
COPY dotfiles/.tmux.conf /home/docker/.tmux.conf
COPY dotfiles/.bash_aliases /home/docker/.bash_aliases

COPY ./entrypoint.sh /

SHELL ["/bin/bash", "-c"]
ENTRYPOINT [ "/entrypoint.sh" ]
CMD /bin/bash -l
