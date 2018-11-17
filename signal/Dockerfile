from orangejulius/gentoo-baseimage:2018-11-17.0

COPY files/package.use /etc/portage/package.use/signal

RUN FEATURES="-sandbox -usersandbox" emerge-wrapper -1 gobject-introspection -j2
RUN emerge-wrapper nodejs gtk+:2 cups nss pulseaudio gconf libXScrnSaver dev-vcs/git -j3

RUN useradd -m dockeruser
WORKDIR /home/dockeruser

ARG VERSION=1.17.3

RUN wget https://github.com/WhisperSystems/Signal-Desktop/archive/v${VERSION}.tar.gz

RUN tar xvf v${VERSION}.tar.gz

WORKDIR Signal-Desktop-$VERSION

RUN npm install

USER dockeruser

CMD ["npm", "start"]
