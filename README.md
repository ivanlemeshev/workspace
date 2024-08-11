# Workspace

This is a Docker image with Ubuntu 24.04 that can be used as a workspace for
development or a sandbox for experiments.

During the first run, it clones the dotfiles repository with my personal
dotfiles.

## Usage

To run the container, you can use the following command:

```bash
./run.sh
```

This will build and run the container and ask you some questions to set up it.

To set up the workspace, you can use the following command:

```bash
cd code/github.com/ivanlemeshev/dot
./setup-ubuntu.sh
```

To clean up the container and image, you can use the following command:

```bash
./clean.sh
```
