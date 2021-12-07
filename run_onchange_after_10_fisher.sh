#!/usr/bin/env fish

type fisher &>/dev/null || curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install sentriz/fish-pipenv
fisher install evanlucas/fish-kubectl-completions
fisher install decors/fish-colored-man
fisher install jethrokuan/z
fisher install oh-my-fish/plugin-bang-bang
fisher install PatrickF1/fzf.fish
fisher install ryoppippi/fish-poetry
