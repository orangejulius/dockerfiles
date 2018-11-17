FROM orangejulius/gentoo-baseimage:2018-05-09

RUN FEATURES="-sandbox -usersandbox" emerge-wrapper -1 -j2 gobject-introspection

COPY files/package.use /etc/portage/package.use/firefox
COPY files/package.accept_keywords /etc/portage/package.accept_keywords/firefox

RUN emerge-wrapper firefox -j2

RUN useradd -m dockeruser

USER dockeruser

CMD ["firefox"]
