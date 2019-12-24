FROM gitpod/workspace-full

USER gitpod
RUN sudo apt install -yq g++
RUN git clone https://github.com/machinezone/mzbench
RUN sudo pip install -r mzbench/requirements.txt
RUN sudo apt-get install -yq python-setuptools
