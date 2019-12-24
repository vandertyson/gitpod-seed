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
RUN cd vernemq
RUN make rel
RUN sudo apt-get install -yq net-tools
