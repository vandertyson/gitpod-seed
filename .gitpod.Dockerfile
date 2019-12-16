FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
RUN sudo apt-get -q update
RUN sudo apt-get -yq install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo apt-key fingerprint 0EBFCD88
RUN sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN sudo apt-get update
RUN sudo apt-get install -yq docker-ce docker-ce-cli containerd.io
RUN apt-cache madison docker-ce
RUN sudo apt-get install -yq docker-ce=5:19.03.3~3-0~ubuntu-disco docker-ce-cli=5:19.03.3~3-0~ubuntu-disco containerd.io
RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN sudo chmod +x /usr/local/bin/docker-compose
RUN sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN docker-compose --version
#
# More information: https://www.gitpod.io/docs/42_config_docker/
