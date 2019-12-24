FROM gitpod/workspace-full

USER gitpod
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get update
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install erlang
RUN git clone https://github.com/machinezone/mzbench
RUN sudo pip install -r mzbench/requirements.txt
