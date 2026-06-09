# last30days API keys — template for `op inject` (1Password).
#
# This file is SAFE to commit: the values below are 1Password secret
# references, not the secrets themselves. Render it with:
#
#     bin/last30days-env
#
# which writes the resolved keys to ~/.config/last30days/.env (chmod 600),
# the global location the skill reads (see the plugin's CONFIGURATION.md).
#
# Note: op inject resolves every op-scheme reference in this file, including
# ones inside comments — so don't write example references here.
#
# Vault is "cli" (a dedicated CLI-scoped vault), item is "last30days".

# Perplexity Sonar is reached THROUGH OpenRouter — the skill has no native
# Perplexity (pplx-...) code path, so this must be an OpenRouter key.
OPENROUTER_API_KEY=op://cli/last30days/openrouter

# Web search backend. Brave is the cheapest; swap the var for one of
# EXA_API_KEY / SERPER_API_KEY / PARALLEL_API_KEY if you use a different one.
BRAVE_API_KEY=op://cli/last30days/brave
