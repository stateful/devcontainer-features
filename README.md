# Runme CLI Tools

A Visual Studio code [dev container](https://containers.dev/) features.

Installs the following command line utilities:

- [runme](https://runme.dev)

Auto-detects latest version and installs needed dependencies.

## Usage

Latest version installed by default. You can pin a specific version or specify latest or none if you wish to have the latest version or skip the installation. Please see below for an example:

### `runme`

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/stateful/devcontainer-features/runme:1": {
            "version": "latest"
        }
    }
}
```

## LICENCE

MIT