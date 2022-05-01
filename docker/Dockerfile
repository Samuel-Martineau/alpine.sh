FROM alpine:3.15.4

ARG HOST_UID

ENV SUDO doas

COPY build-iso /usr/local/bin

RUN apk add --no-cache alpine-sdk alpine-conf syslinux xorriso squashfs-tools mtools dosfstools grub-efi git doas && \
    adduser -u ${HOST_UID} -S builder && \
    addgroup builder abuild

COPY doas.conf /etc/doas.d

USER builder

WORKDIR /home/builder

RUN abuild-keygen -a -i -n && \
    git clone --depth 1 https://gitlab.alpinelinux.org/alpine/aports.git

COPY --chown=builder mkimg.custom.sh /home/builder/aports/scripts

ENTRYPOINT ["build-iso"]
