#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.45"

export RUNME_DOWNLOAD_ON_INSTALL=1
if [ "$VERSION" != "latest" ]
then
  export RUNME_VERSION=$VERSION
fi

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/npm-package:1.0.3" \
    --option package='runme'

# Need a new shell to pick up NVM paths
bash -i << EOF
if [ "$COMPLETIONS" = "true" ]; then {
  # runme bash completion
  mkdir -p /etc/bas_completion.d
  runme completion bash > /etc/bash_completion.d/runme
  # runme zsh completion
  if [ -e "/usr/share/zsh/vendor-completions" ]; then 
    runme completion zsh > /usr/share/zsh/vendor-completions/_runme
  fi
} fi
EOF


echo 'Done!'