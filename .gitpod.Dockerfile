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
RUN sudo apt update
RUN sudo apt install -y openjdk-8-jdk
RUN sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
RUN java -version
RUN sudo apt-get update; \
    sudo apt-get install -yq postgresql postgresql-contrib; \
    sudo service postgresql start
RUN cd ~
RUN git clone https://github.com/thingsboard/thingsboard.git
RUN cd thingsboard
RUN mvn clean install -X


    
