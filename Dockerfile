FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

ARG INSTALL_DEPENDENCIES
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends ${INSTALL_DEPENDENCIES} \
    starman \
    libcatalyst-perl \
    libcatalyst-devel-perl \
    libmoose-perl \
    libcatalyst-plugin-static-simple-perl \
    libcatalyst-plugin-configloader-perl \
    libcatalyst-action-renderview-perl \
    xotcl-shells expect-dev \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

WORKDIR /SearchMusic
COPY project/SearchMusic /SearchMusic
COPY start_catalyst /start_catalyst

CMD /start_catalyst/cmd.sh /SearchMusic/script/server.pl

