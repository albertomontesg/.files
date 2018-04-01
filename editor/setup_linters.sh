#!/usr/bin/env bash

# Install linters for various coding languages
pip3 install -U proselint cpplint vim-vint yamllint

brew install shellcheck shfmt google-java-format

npm install -g csslint prettier stylelint eslint htmlhint markdownlint \
	write-good
