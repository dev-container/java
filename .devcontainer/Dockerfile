FROM buildpack-deps:focal-scm

# Partly from
# https://github.com/microsoft/vscode-dev-containers/blob/master/containers/java-8/.devcontainer/Dockerfile

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND=noninteractive
RUN set -ex; \ 
    apt-get update; \
# Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    groupadd --gid $USER_GID $USERNAME; \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME; \
    # [Optional] Add sudo support for the non-root user
    apt-get install -y sudo; \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME ;\
    chmod 0440 /etc/sudoers.d/$USERNAME; \
    apt-get install -y  --no-install-recommends \
#        apt-utils dialog 
        zip \
        unzip \
        bash-completion \
        build-essential \
        htop \
        jq \
        less \
        locales \
        man-db \
        software-properties-common \
        sudo \
        time \
        vim \
        multitail \
        lsof \
        openssh-client iproute2 lsb-release; \
    #
    curl -fsSL "https://get.sdkman.io" | bash; \
    bash -c ". /root/.sdkman/bin/sdkman-init.sh \
             && sdk list java \
             && sdk install java 8.0.265-amzn \
             && sdk install java 11.0.8-amzn \
             && sdk default java 11.0.8-amzn \
             && sdk install maven \
             && sdk flush archives \
             && sdk flush temp \
             && mkdir /root/.m2 \
             && mkdir /root/.bashrc.d \
             && echo 'export SDKMAN_DIR=\"/root/.sdkman\"' >> /root/.bashrc.d/99-java \
             && echo '[[ -s \"/root/.sdkman/bin/sdkman-init.sh\" ]] && source \"/root/.sdkman/bin/sdkman-init.sh\"' >> /root/.bashrc.d/99-java"; \
# above, we are adding the sdkman init to .bashrc (executing sdkman-init.sh does that), because one is executed on interactive shells, the other for non-interactive shells (e.g. plugin-host)
    # Clean up
    apt-get autoremove -y; \
    apt-get clean -y; \
    rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

ENV NODE_VERSION=12.18.1
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | PROFILE=/dev/null bash; \
    bash -c ". .nvm/nvm.sh \
        && nvm install $NODE_VERSION \
        && nvm alias default $NODE_VERSION \
        && npm install -g npm typescript yarn"; \
    echo ". ~/.nvm/nvm-lazy.sh"  >> /root/.bashrc.d/50-node \
# above, we are adding the lazy nvm init to .bashrc, because one is executed on interactive shells, the other for non-interactive shells (e.g. plugin-host) 
COPY nvm-lazy.sh /root/.nvm/nvm-lazy.sh
ENV PATH=$PATH:/root/.nvm/versions/node/v${NODE_VERSION}/bin