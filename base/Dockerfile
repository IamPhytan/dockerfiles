FROM ubuntu:jammy

LABEL org.phicoltan.authors="phicoltan@gmail.com"

# Update system
RUN apt-get update
RUN apt-get -y install \
    sudo \
    git \
    curl \
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

# RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
# RUN systemctl restart sshd

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

WORKDIR /home/docker
USER docker

ENV TERM "xterm-256color"
COPY dotfiles/.gitconfig /home/docker/.gitconfig
COPY dotfiles/.tmux.conf /home/docker/.tmux.conf
COPY dotfiles/.bash_aliases /home/docker/.bash_aliases

# SSH
# Info : https://stackoverflow.com/a/25977750/7767136
RUN mkdir /home/docker/.ssh
ADD --chown=docker dotfiles/.ssh/docker.key /home/docker/.ssh/docker.key
ADD --chown=docker dotfiles/.ssh/docker.key.pub /home/docker/.ssh/docker.key.pub
RUN touch /home/docker/.ssh/known_hosts
RUN ssh-keyscan github.com >> /home/docker/.ssh/known_hosts
# check if ssh agent is running or not, if not, run
RUN eval `ssh-agent -s` && ssh-add /home/docker/.ssh/docker.key
# RUN eval "$(ssh-agent -s)"
# RUN ssh-add -k /home/docker/.ssh/docker.key

SHELL ["/bin/bash", "-c"]
CMD /bin/bash -l
