
# Runme

A hello world feature

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

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select or enter a gomplate version to install | string | latest |

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/devcontainers/feature-starter/blob/main/src/hello/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
