FROM gitpod/workspace-full-vnc

USER root
# Install firefox btclient mega.nz tools
RUN apt-get update \
    && apt-get install -yq firefox deluge deluge-gtk megatools \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
