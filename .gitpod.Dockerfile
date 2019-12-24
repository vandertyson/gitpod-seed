FROM gitpod/workspace-full

USER gitpod
RUN sudo apt-get install -yq python-setuptools
RUN sudo easy_install pip
RUN git clone https://github.com/machinezone/mzbench
RUN sudo pip install -r mzbench/requirements.txt

