FROM pddthinh/ubuntu-latex:latest
MAINTAINER DuyThinh <phandangduythinh@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN apt-get update -q

RUN apt-get install -qy --no-install-recommends \
    ibus-unikey

RUN gsettings set org.gnome.desktop.input-sources sources "[('ibus', 'Unikey'), ('xkb', 'us')]"

RUN dconf write /desktop/ibus/engine/unikey/input-method "'Vni'"

ENTRYPOINT [ "texmaker" ]
