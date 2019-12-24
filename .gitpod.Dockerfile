FROM gitpod/workspace-full

USER gitpod
RUN sudo apt-get update
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get -yq install erlang
