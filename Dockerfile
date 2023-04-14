FROM amazoncorretto:17-al2023-jdk

ARG RAM_MAX=6G
ARG RAM_MIN=4G

WORKDIR /minecraft

VOLUME ["/minecraft/world", "/minecraft/logs"]

ARG MINECRAFT_VERSION=1.19.2
ARG FORGE_VERSION=43.1.55
ARG WORLD=world
ARG PORT=25565

ENV RAM_MAX=6G
ENV RAM_MIN=4G
ENV SERVER_PORT=${PORT}
ENV WORLD_NAME=${WORLD}
ENV VERSION=${MINECRAFT_VERSION}-${FORGE_VERSION}

COPY . /minecraft/

RUN echo "Install Forge Installer" \
    && java -jar forge-installer.jar --installServer \
    && rm forge-installer.jar forge-installer.jar.log

ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint.sh"]