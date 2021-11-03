#/usr/bin/env bash

# Install fish completions
if [ -d ~/.config/fish/completions ]; then
    # if command -v chezmoi &> /dev/null; then
    #     chezmoi completion fish --output ~/.config/fish/completions/chezmoi.fish
    # fi
    if command -v flux &> /dev/null; then
        flux completion fish > ~/.config/fish/completions/flux.fish
    fi
    if command -v helm &> /dev/null; then
        helm completion fish > ~/.config/fish/completions/helm.fish
    fi
    if command -v kustomize &> /dev/null; then
        kustomize completion fish > ~/.config/fish/completions/kustomize.fish
    fi
fi
