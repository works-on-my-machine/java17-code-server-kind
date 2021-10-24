FROM linuxserver/code-server@sha256:995c198ad5d08f17ca3dbeabc4fcc00b779f974138ffb1459d8c59f793733f90

ARG JAVA_VERSION="17.0.0-oracle"
ARG MAVEN_VERSION="3.8.3"

RUN apt-get update && \
  apt-get install -y --no-install-recommends git zip unzip curl ca-certificates sed && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

USER abc:abc

RUN git clone git://github.com/ohmybash/oh-my-bash.git $HOME/.oh-my-bash \
  && cp $HOME/.bashrc $HOME/.bashrc.orig \
  && cp $HOME/.oh-my-bash/templates/bashrc.osh-template $HOME/.bashrc

RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
  yes | sdk install java $JAVA_VERSION && \
  yes | sdk install maven $MAVEN_VERSION && \
  rm -rf $HOME/.sdkman/archives/* && \
  rm -rf $HOME/.sdkman/tmp/*"