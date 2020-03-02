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
RUN cd ~; \
    mvn archetype:generate \
    -DinteractiveMode=false \
    -DarchetypeGroupId=org.openjdk.jmh \
    -DarchetypeArtifactId=jmh-java-benchmark-archetype \
    -DgroupId=com.mycompany \
    -DartifactId=benchmarks \
    -Dversion=1.0-SNAPSHOT \
    -Dmaven.repo.local=~/m2-repository
RUN sudo apt-get install -y figlet toilet
RUN sudo apt -y update
RUN sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN sudo apt remove docker docker-engine docker.io containerd runc
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN sudo apt update;\
    sudo apt -y install docker-ce docker-ce-cli containerd.io
RUN sudo usermod -aG docker gitpod
RUN newgrp docker
RUN sudo systemctl enable docker
RUN sudo service docker start
RUN sudo gpasswd -a gitpod docker
RUN docker version

    
