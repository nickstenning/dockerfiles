# Synology Cloud Station Drive
#
# docker run --rm -it \
#	-v /etc/localtime:/etc/localtime:ro \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	--name cloud-station-drive \
#	nickstenning/cloud-station-drive "$@"

FROM debian:stretch
MAINTAINER Nick Stenning <nick@whiteink.com>

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y \
	psmisc \
	ca-certificates \
	libglib2.0-0 \
	libgtk2.0-0 \
	libqt5gui5 \
	locales \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV CLOUD_STATION_DRIVE_VERSION=4.2.2-4379
ENV CLOUD_STATION_DRIVE_REVISION=4379
ENV CLOUD_STATION_DRIVE_MD5SUM=0405af24dd85ffc004919ea79a26fb03
ENV LD_LIBRARY_PATH=/opt/Synology/CloudStation/lib

RUN buildDeps=' \
		curl \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL -o synology-cloud-station-drive.deb https://global.download.synology.com/download/Tools/CloudStationDrive/${CLOUD_STATION_DRIVE_VERSION}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${CLOUD_STATION_DRIVE_REVISION}.x86_64.deb \
	&& echo "${CLOUD_STATION_DRIVE_MD5SUM} *synology-cloud-station-drive.deb" | md5sum -c - \
	&& dpkg -i synology-cloud-station-drive.deb \
	&& rm synology-cloud-station-drive.deb \
	&& apt-get purge -y --auto-remove $buildDeps

RUN groupadd -g 1000 nick && useradd -m -s /bin/bash -u 1000 -g 1000 -N nick
USER nick
ENTRYPOINT ["/bin/sh", "-c", "/opt/Synology/CloudStation/bin/launcher; sleep infinity"]
