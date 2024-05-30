FROM ghcr.io/emblem-66/miniblue:latest
COPY rootfs/ /
RUN rpm-ostree install \
      https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
      https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN rpm-ostree install steam
RUN rpm-ostree install heroic-games-launcher-bin
RUN rpm-ostree install bottles
RUN rpm-ostree install prismlauncher
RUN rpm-ostree install goverlay mangohud protonplus protontricks
RUN rpm-ostree override remove $(< /tmp/base-packages)
RUN rpm-ostree cleanup -m \
&&  rm -rf /tmp /var
