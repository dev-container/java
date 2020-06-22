# Develop in Container - Java
A setup for working on Java in a vscode or gitpod container.

## VS Code

Using Dockerfile from https://github.com/microsoft/vscode-dev-containers/tree/master/containers/java-8
  - `FROM openjdk:8-jdk` - [Dockerfile](https://github.com/docker-library/openjdk/blob/master/8/jdk/Dockerfile)
  - `FROM buildpack-deps:buster-scm` - [Dockerfile](https://github.com/docker-library/buildpack-deps/tree/master/debian/buster)
  - Debian “buster” based.
  
[VS Code Remote Development Container Docker Hub](https://hub.docker.com/_/microsoft-vscode-devcontainers)

## Gitpod

Using Gitpod workspace full `gitpod/workspace-full` https://github.com/gitpod-io/workspace-images/tree/master/full 
  - `FROM buildpack-deps:focal` - [Dockerfile](https://github.com/docker-library/buildpack-deps/tree/master/ubuntu/focal)
  - Ubuntu Focal based. 

## SDKMAN

Use SDKMAN! to change Java version

See available Java versions
```
sdk list java
```
Install and set as default
```
sdk install java 8.0.252-amzn
sdk install java 11.0.7-amzn
sdk default java 11.0.7-amzn
```
