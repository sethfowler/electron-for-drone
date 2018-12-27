FROM node:11-stretch

# Dependencies for Electron itself.
ENV ELECTRON_DEPS="libasound2 libgconf-2-4 libgtk2.0-0 libgtk-3-0 libnss3 libxss1 libxtst6"

# Dependencies for Xvfb, which you almost certainly need if you're running
# Electron or Spectron inside Docker.
ENV XVFB_DEPS="xauth xvfb"

# Avoid proxy-related issues that can cause Spectron to silently fail.
# See: https://github.com/electron/spectron/issues/144
ENV no_proxy=127.0.0.1,localhost
ENV NO_PROXY=127.0.0.1,localhost

RUN apt-get -qy update && \
    DEBIAN_FRONTEND=noninteractive && \
    apt-get -qy --no-install-recommends --no-install-suggests \
            install $ELECTRON_DEPS $XVFB_DEPS && \
    find /var/cache/apt/archives /var/lib/apt/lists -not -name lock -type f -delete
