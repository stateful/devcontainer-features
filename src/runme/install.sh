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

# check if compleetion is true

if [ "$COMPLETIONS" = "true" ]; then
  # Check if the current shell is Bash
  if [ "$(basename $SHELL)" = "bash" ]; then
    # runme bash completion
    mkdir -p /etc/bash_completion.d
    runme completion bash > /etc/bash_completion.d/runme
    source /etc/bash_completion.d/runme
  fi

  # Check if the current shell is Zsh
  if [ "$(basename $SHELL)" = "zsh" ]; then

    # runme zsh completion
    ZSH_COMPLETIONS_DIR="/usr/share/zsh/site-functions/"
    
    mkdir -p $ZSH_COMPLETIONS_DIR
    runme completion zsh > "$ZSH_COMPLETIONS_DIR/_runme"
    source $ZSH_COMPLETIONS_DIR/_runme
  fi

  # Check if the current shell is fish
  if [ "$(basename $SHELL)" = "fish" ]; then

    # runme fish completion
    FISH_COMPLETIONS_DIR="/usr/share/fish/vendor_completions.d"
    
    mkdir -p $FISH_COMPLETIONS_DIR
    runme completion fish > "$FISH_COMPLETIONS_DIR/_runme"
    source $FISH_COMPLETIONS_DIR/_runme
  fi

  # Check if the current shell is PowerShell
  if [ "$(basename $SHELL)" = "pwsh" ]; then

    # Enable Powershell tab-completion
    Set-PSReadlineKeyHandler -Key Tab -Function Complete
    
    mkdir -p $FISH_COMPLETIONS_DIR
    runme completion fish > "$FISH_COMPLETIONS_DIR/_runme"
    source $FISH_COMPLETIONS_DIR/_runme
  fi
  
fi


echo 'Done!'