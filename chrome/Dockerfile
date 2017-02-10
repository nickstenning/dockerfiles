# Chrome beta
#
# Based heavily on the original from https://github.com/jessfraz/dockerfiles.
# Thank you Jessie, you're amazing!
#
# docker run -d \
#   --net host \
#   --security-opt seccomp=unconfined \
#   --cpuset-cpus 0 \
#   --memory 512mb \
#   -v /var/run/dbus:/var/run/dbus \
#   -v /etc/machine-id:/etc/machine-id:ro \
#   -v /etc/localtime:/etc/localtime:ro \
#   -v /etc/hosts:/etc/hosts:ro \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   -e DISPLAY=unix$DISPLAY \
#   -v $HOME/Downloads:/home/nick/Downloads \
#   -v $HOME/.config/google-chrome/:/home/nick/.config/google-chrome/ \
#   -v /dev/shm:/dev/shm \
#   --device /dev/snd \
#   --device /dev/dri \
#   --device /dev/video0 \
#   --group-add audio \
#   --group-add video \
#   --name chrome \
#   nickstenning/chrome
#

FROM debian:stretch
MAINTAINER Nick Stenning <nick@whiteink.com>

ADD https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb /src/google-talkplugin_current_amd64.deb

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	dbus-x11 \
	gnupg \
	hicolor-icon-theme \
	libcanberra-gtk-module \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
	libv4l-0 \
	fonts-symbola \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-beta \
	--no-install-recommends \
	&& dpkg -i '/src/google-talkplugin_current_amd64.deb' \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /src/*.deb

COPY local.conf /etc/fonts/local.conf

RUN groupadd -g 1000 nick && useradd -m -s /bin/bash -u 1000 -g 1000 -N nick
USER nick
ENTRYPOINT ["google-chrome"]
