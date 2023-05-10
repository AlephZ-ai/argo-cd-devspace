# argo-cd-devspace
A Dev Container Workspace with Argo CD running powered by Kind

# devspace-setup
- Install Docker Desktop
  - https://www.docker.com/products/docker-desktop/
- Install VSCode
  - https://code.visualstudio.com/download
- Install VSCode Remote Development Extension
  - https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack
- Run `code .` from the root of the repo
- Press `Ctrl+Shift+P` (Windows) `Command+Shift+P` (Mac) to view the VSCode Command Palette
  - https://code.visualstudio.com/docs/getstarted/userinterface#:~:text=VS%20Code%20is%20equally%20accessible,brings%20up%20the%20Command%20Palette.
- Type `Dev Containers: Reopen in Container` in the Command Palette then Click `Dev Containers: Reopen in Container...`
- After it finishes building you will be in a dev container containing all tools needed to build, debug, and checkin code
- There will also be a 3 node Citus cluster running locally for development in docker
- Press `Ctrl+Shift+`\` to open a `zsh` terminal into the dev container
  - `bash` and `pwsh` are also suported
  - `PowerShell` is supported on Windows
- Write Code, Debug Code, Checkin Code

# troubleshooting
- Install Node and NPM
  - https://nodejs.org/en/download
- Install DevContainers CLI NPM package
  - https://code.visualstudio.com/docs/devcontainers/devcontainer-cli
<!-- https://github.com/microsoft/vscode-remote-release/issues/2133 -->
<!-- - First command for troubleshooting is `devcontainer open` -->
- First command for troubleshooting is `devcontainer up --workspace-folder .`
  - If this fails then fall back to `devcontainer build . --workspace-folder .`
    - If this fails then fall back to `docker run -it --rm cr.alephz.ai/devcontainers/argo-cd-devspace`
      - If this fails then fall back to `docker run -it --rm cr.alephz.ai/devcontainers/argo-cd-devspace zsh`
        - If this fails then fall back to `docker run -it --rm cr.alephz.ai/devcontainers/argo-cd-devspace --entry-point /bin/bash`
          - If this fails then fall back to `docker run -it --rm cr.alephz.ai/devcontainers/argo-cd-devspace --entry-point /bin/bash zsh`
- TODO: What is next?  Add More Info.  What are common errors from each troubleshooting step?  What can you learn from each failure?  When you encounter a failure what steps should you take to mitigate?

# references
- https://en.wikipedia.org/wiki/Occam%27s_razor
- https://kind.sigs.k8s.io/docs/user/ingress/#using-ingress
- https://argo-cd.readthedocs.io/en/stable/getting_started
- https://code.visualstudio.com/docs/devcontainers/containers
- https://github.com/devcontainers/ci
- https://github.com/features/codespaces
- https://github.com/github/branch-deploy
