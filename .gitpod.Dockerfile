FROM gitpod/workspace-full
USER gitpod
RUN sudo apt-get install -yq python-setuptools
RUN sudo apt-get install -yq python-pip
RUN git clone https://github.com/mzbench/mzbench
RUN sudo pip install -r mzbench/requirements.txt
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get update
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install erlang
RUN sudo apt install -yq rsync grsync
RUN git clone git://github.com/erlio/vernemq.git
RUN cd vernemq; make rel
RUN sudo apt-get install -yq net-tools
RUN sudo apt update
RUN sudo apt -yq install maven
RUN mvn --version
RUN mkdir ~/m2-repository
RUN sudo add-apt-repository ppa:webupd8team/java
RUN sudo apt-get update
RUN sudo apt-get -yq install oracle-java8-installer
RUN echo JAVA_HOME="/usr/lib/jvm/java-8-oracle" >> /etc/environment
RUN source /etc/environment
RUN echo $JAVA_HOME
RUN hg clone http://hg.openjdk.java.net/code-tools/jmh/ openjdk-jmh; \
    cd openjdk-jmh; \
    mvn -Dmaven.repo.local=~/m2-repository install; \
    cd ~; \
    mvn archetype:generate \
    -DinteractiveMode=false \
    -DarchetypeGroupId=org.openjdk.jmh \
    -DarchetypeArtifactId=jmh-java-benchmark-archetype \
    -DgroupId=com.mycompany \
    -DartifactId=benchmarks \
    -Dversion=1.0-SNAPSHOT
