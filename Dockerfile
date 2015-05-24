FROM alpine:3.1

COPY ./bin/nsenter /usr/bin/nsenter

# perl is required by git-submodule
RUN apk add --update bash coreutils openssh-client git perl make vim && \
    echo 'PS1='"'"'\[\e[01;33m\][\h \u:\[\e[01;34m\]\w\[\e[01;33m\]]\[\e[00m\]\$ '"'" >> /root/.bashrc && \
    echo -e 'eval `dircolors -b`\nalias ls="ls --color=auto"\nalias l="ls -lah"\nalias ll="ls -lh"' >> /root/.bashrc && \
    rm /usr/bin/vi && \
    ln -s vim /usr/bin/vi && \
    rm -rf /var/cache/apk/*
