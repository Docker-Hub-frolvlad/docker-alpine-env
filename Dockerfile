FROM alpine:3.3

COPY ./bin/nsenter /usr/bin/nsenter
COPY ./etc/inputrc /etc/inputrc

# perl is required by git-submodule
# less makes git log/diff colorful
RUN apk add --no-cache bash bash-completion coreutils sed openssh-client git perl make vim less htop iftop && \
    echo '. /etc/profile' >> /root/.bashrc && \
    echo 'PS1='"'"'\[\e[01;33m\][\h \u:\[\e[01;34m\]\w\[\e[01;33m\]]\[\e[00m\]\$ '"'" >> /root/.bashrc && \
    echo -e 'eval `dircolors -b`\nalias ls="ls --color=auto"\nalias l="ls -lah"\nalias ll="ls -lh"' >> /root/.bashrc && \
    rm /usr/bin/vi && \
    ln -s vim /usr/bin/vi
