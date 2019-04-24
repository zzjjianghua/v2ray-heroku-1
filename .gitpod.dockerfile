FROM gitpod/workspace-full-vnc

USER root
# Install firefox btclient mega.nz tools
RUN apt-get update \
    && apt-get install -yq firefox deluge deluge-gtk megatools fonts-droid-fallback \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
