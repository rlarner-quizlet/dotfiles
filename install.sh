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

if command -v claude >/dev/null 2>&1; then
  # Register the CircleCI MCP server at user scope (writes ~/.claude.json,
  # which is per-workspace, which is why we re-run this on every start).
  #
  # NOTE: this assumes the CircleCI MCP server reads its token from
  # CIRCLECI_API_KEY. If the official server expects a different env-var name
  # (e.g. CIRCLECI_TOKEN), change the `--env` line accordingly.
  claude mcp add circleci --scope user \
    --env CIRCLECI_API_KEY="${CIRCLECI_API_KEY:-}" \
    -- npx -y @circleci/mcp-server-circleci
fi

if command -v claude >/dev/null 2>&1; then
  # Register the Rollbar MCP server at user scope (writes ~/.claude.json,
  # which is per-workspace, which is why we re-run this on every start).
  claude mcp add rollbar --scope user \
    --env ROLLBAR_ACCESS_TOKEN="${ROLLBAR_ACCESS_TOKEN:-}" \
    -- npx -y @rollbar/mcp-server@latest
fi
