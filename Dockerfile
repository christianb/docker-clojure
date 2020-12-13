FROM ubuntu:20.04

WORKDIR /home

# To avoid "tzdata" asking for geographic area
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
	bash \
	curl \
	rlwrap \
	openjdk-14-jre \
 	&& rm -rf /var/lib/apt/lists/*

# Install Clojure
RUN curl -O https://download.clojure.org/install/linux-install-1.10.1.754.sh \
	&& chmod +x linux-install-1.10.1.754.sh \
	&& ./linux-install-1.10.1.754.sh \
	&& rm ./linux-install-1.10.1.754.sh

# This makes the first launch of REPL faster, as it downloads some dependencies
RUN clj
