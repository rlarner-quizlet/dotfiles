#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASH_ALIASES_SRC="$DOTFILES_DIR/.bash_aliases"

# Detect shell config file
if [ -n "${ZSH_VERSION:-}" ] || [ "$(basename "$SHELL")" = "zsh" ]; then
  SHELL_RC="$HOME/.zshrc"
else
  SHELL_RC="$HOME/.bashrc"
fi

SOURCING_LINE="[ -f \"$BASH_ALIASES_SRC\" ] && source \"$BASH_ALIASES_SRC\""

echo "Installing dotfiles from: $DOTFILES_DIR"
echo "Shell config: $SHELL_RC"

# Add sourcing line if not already present
if grep -qF "$BASH_ALIASES_SRC" "$SHELL_RC" 2>/dev/null; then
  echo ".bash_aliases is already sourced in $SHELL_RC — skipping."
else
  echo "" >> "$SHELL_RC"
  echo "# dotfiles: load aliases" >> "$SHELL_RC"
  echo "$SOURCING_LINE" >> "$SHELL_RC"
  echo "Added .bash_aliases sourcing to $SHELL_RC"
fi

echo "Done. Restart your shell or run: source $SHELL_RC"
