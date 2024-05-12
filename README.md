# Workspace

This is a Docker image with Ubuntu 24.04 that can be used as a workspace for
development or a sandbox for experiments.

It uses my personal dotfiles as a submodule and has a few tools pre-installed.

## Usage

To run the container, you can use the following command:

```bash
./run.sh
```

This will start the container and mount a volume with the dotfiles repository.

To clean up the container and image, you can use the following command:

```bash
./clean.sh
```
