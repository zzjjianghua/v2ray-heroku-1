FROM gitpod/workspace-full-vnc

USER root
# Install firefox btclient mega.nz tools
RUN apt-get update \
    && apt-get install -yq firefox deluge deluge-gtk megatools fonts-droid-fallback fluxbox \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

ENV WINDOW_MANAGER="fluxbox"

RUN __GOST_VERSION__="2.7.2" \
 && mkdir /tmp/gost \
 && cd /tmp/gost \
 && curl -L https://github.com/ginuerzh/gost/releases/download/v${__GOST_VERSION__}/gost_${__GOST_VERSION__}_linux_amd64.tar.gz | tar xz \
 && cd gost_${__GOST_VERSION__}_linux_amd64 \
 && mv gost /usr/bin/ \
 && chmod +x /usr/bin/gost \
 && rm -rf /tmp/gost

RUN sed -ri "s/1920x1080/1366x830/g" /usr/bin/start-vnc-session.sh \
 && echo "gost -L socks+ws://:1080 >/dev/null 2>&1 &" >>/usr/bin/start-vnc-session.sh
