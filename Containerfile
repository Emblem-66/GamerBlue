FROM ghcr.io/emblem-66/miniblue:latest
COPY rootfs/ /
RUN rpm-ostree install \
      https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
      https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN rpm-ostree override remove $(< /tmp/base-packages)
--install=steam
--install=heroic-games-launcher-bin
--install=bottles
--install=prismlauncher
--install=goverlay
--install=mangohud
--install=protonplus
--install=protontricks

RUN rpm-ostree cleanup -m \
&&  rm -rf /tmp /var
