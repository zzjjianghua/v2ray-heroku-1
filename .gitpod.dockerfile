FROM gitpod/workspace-full-vnc

USER root
# Install firefox btclient mega.nz tools
RUN apt-get update \
    && apt-get install -yq firefox deluge deluge-gtk megatools fonts-droid-fallback fluxbox \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

ENV WINDOW_MANAGER="fluxbox"

RUN sed -ri 's/1920x1080/1366x830/g' /usr/bin/start-vnc-session.sh
