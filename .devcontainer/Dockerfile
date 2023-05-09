# https://docs.docker.com/engine/reference/builder/
# https://github.com/devcontainers/images/tree/main/src/base-debian
ARG IMAGE=mcr.microsoft.com/devcontainers/base:bullseye
FROM ${IMAGE}
# https://code.visualstudio.com/remote/advancedcontainers/start-processes#_adding-startup-commands-to-the-docker-image-instead
COPY --chown=vscode:vscode scripts/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
# Overrides default command so things don't shut down after the process ends.
CMD [ "sleep", "infinity" ]
