# Slack desktop
#
# Based heavily on the original from https://github.com/jessfraz/dockerfiles.
# Thank you Jessie, you're amazing!
#
# docker run --rm -it \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	--device /dev/snd \
#	--device /dev/dri \
#	--device /dev/video0 \
#	--group-add audio \
#	--group-add video \
#	-v "${HOME}/.slack:/root/.config/Slack" \
#	--ipc="host" \
#	--name slack \
#	nickstenning/slack "$@"

FROM debian:stretch
MAINTAINER Nick Stenning <nick@whiteink.com>

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	gconf2 \
	gconf-service \
	gir1.2-gnomekeyring-1.0 \
	gvfs-bin \
	hunspell-en-us \
	libappindicator1 \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libgnome-keyring0 \
	libgtk2.0-0 \
	libnotify4 \
	libnss3 \
	libxss1 \
	libxtst6 \
	locales \
	python \
	xdg-utils \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV SLACK_VERSION 2.4.2

RUN buildDeps=' \
		curl \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL "https://downloads.slack-edge.com/linux_releases/slack-desktop-${SLACK_VERSION}-amd64.deb" > /tmp/slack-desktop.deb \
	&& dpkg -i /tmp/slack-desktop.deb \
	&& rm -rf /tmp/slack-desktop.deb \
	&& apt-get purge -y --auto-remove $buildDeps

RUN groupadd -g 1000 nick && useradd -m -s /bin/bash -u 1000 -g 1000 -N nick
USER nick
ENTRYPOINT ["/usr/lib/slack/slack"]
