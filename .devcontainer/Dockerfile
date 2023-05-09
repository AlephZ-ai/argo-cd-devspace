# https://docs.docker.com/engine/reference/builder/
# https://github.com/devcontainers/images/tree/main/src/base-debian
ARG IMAGE=mcr.microsoft.com/devcontainers/base:bullseye
FROM ${IMAGE}
# https://code.visualstudio.com/remote/advancedcontainers/start-processes#_adding-startup-commands-to-the-docker-image-instead
COPY --chown=vscode:vscode / /home/vscode/.devcontainer/
# https://docs.docker.com/engine/reference/builder/#entrypoint
# https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
ENTRYPOINT [ "./home/vscode/.devcontainer/scripts/docker-entrypoint.sh" ]
# https://docs.docker.com/engine/reference/builder/#cmd
# https://riptutorial.com/docker/example/11009/cmd-instruction
# Overrides default command so things don't shut down after the process ends.
CMD [ "bash", "-i", "-c", "./home/vscode/.devcontainer/scripts/docker-cmd.sh && sleep infinity" ]
USER vscode
