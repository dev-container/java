FROM gitpod/workspace-full

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
              && sdk update && sdk list java && sdk install java 8.0.265-amzn && sdk install java 11.0.8-amzn && sdk default java 11.0.8-amzn"

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
