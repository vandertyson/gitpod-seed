FROM gitpod/workspace-full

USER gitpod
RUN sudo apt-get install -yq python-setuptools
RUN sudo apt-get install -yq python-pip
RUN git clone https://github.com/machinezone/mzbench
RUN sudo pip install -r mzbench/requirements.txt

