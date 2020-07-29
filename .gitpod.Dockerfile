FROM gitpod/workspace-full
USER gitpod
RUN sudo apt-get install -yq python-setuptools
RUN sudo apt-get install -yq python-pip
RUN git clone https://github.com/mzbench/mzbench
RUN sudo pip install -r mzbench/requirements.txt
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get update
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install erlang
RUN sudo apt install -yq rsync grsync
RUN sudo apt-get install -yq net-tools
RUN sudo apt update
RUN sudo apt -yq install maven
RUN mvn --version
RUN mkdir ~/m2-repository
RUN sudo apt-get install -y figlet toilet
RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk list java \
             && sdk install java 8.0.242-zulu \
             && sdk default java 8.0.242-zulu"
             
RUN wget https://golang.org/dl/go1.14.6.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.14.6.linux-amd64.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin    
    
