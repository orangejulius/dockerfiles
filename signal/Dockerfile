from orangejulius/gentoo-baseimage:20171126.2

COPY files/package.use /etc/portage/package.use/signal

RUN FEATURES="-sandbox -usersandbox" /emerge-wrapper.sh -1 gobject-introspection -j2
RUN /emerge-wrapper.sh nodejs gtk+:2 cups nss pulseaudio gconf libXScrnSaver -j3

RUN useradd -m dockeruser
WORKDIR /home/dockeruser

ARG VERSION=1.0.39

RUN wget https://github.com/WhisperSystems/Signal-Desktop/archive/v${VERSION}.tar.gz

RUN tar xvf v${VERSION}.tar.gz

WORKDIR Signal-Desktop-$VERSION

RUN npm install || sleep 3000

USER dockeruser

CMD ["npm", "start"]
