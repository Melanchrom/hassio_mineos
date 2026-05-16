ARG BUILD_FROM=ghcr.io/hassio-addons/base:20.1.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# RUN apk update
RUN apk add git rdiff-backup screen rsync python3 g++ make wget nodejs npm
RUN apk add openjdk25 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/

WORKDIR "/usr/games"
RUN git clone https://github.com/Melanchrom/mineos-node.git minecraft

WORKDIR "/usr/games/minecraft"
RUN git config core.filemode false
RUN chmod +x generate-sslcert.sh mineos_console.js webui.js


RUN npm install -g pnpm
RUN pnpm install

# Copy data for add-on
COPY mineos.conf /etc/mineos.conf
COPY run.sh /opt/
RUN chmod a+x /opt/run.sh

CMD [ "/opt/run.sh" ]