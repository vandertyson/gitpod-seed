FROM gitpod/workspace-full

USER gitpod
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get update
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install erlang
