FROM gitpod/workspace-full
USER gitpod
RUN sudo apt update
RUN sudo apt -yq install maven
RUN mvn --version
RUN mkdir ~/m2-repository
RUN wget https://golang.org/dl/go1.14.6.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.14.6.linux-amd64.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin    
    
