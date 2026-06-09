---
name: web-fallback
description: Retrieve web content when the built-in WebFetch is blocked, returns empty/garbled output, hits a 403/Cloudflare/bot wall, or a page needs JS rendering. Tiered fallback — Jina Reader (gets the real page as markdown) then a browser-UA direct GET, then Brave Search for alternate sources. Use when WebFetch fails or you want an independent web source.
argument-hint: '<url> | --search <query>'
allowed-tools: Bash, Read, WebFetch, WebSearch
user-invocable: true
---

# web-fallback

When the built-in **WebFetch** tool can't get a page — it errors, times out, hits
a 403 / Cloudflare / bot wall, returns an almost-empty body, or the content is
clearly JS-rendered — use this skill instead of giving up or guessing.

## How to use

Run the script directly with Bash:

```bash
~/.claude/skills/web-fallback/scripts/fetch "<url>"        # fetch a page
~/.claude/skills/web-fallback/scripts/fetch --search "<query>"   # search the web
```

- Pass a full `http(s)://` URL to fetch a page.
- Pass `--search "<query>"` (or just a non-URL string) to do a Brave web search.

## What it does (tiers)

For a URL, it tries, in order, and prints the first tier that yields real content:

1. **Jina Reader** (`r.jina.ai`) — renders the page (incl. JS) and returns clean
   markdown. Free, no key, bypasses most soft blocks. This is the one that
   actually retrieves content WebFetch couldn't.
2. **Direct GET** with a desktop-browser User-Agent — sometimes succeeds where
   WebFetch's fetcher is blocked. Returns raw HTML.
3. **Brave Search** for the URL/topic — when the page is genuinely unreachable,
   returns alternate sources (title + url + snippet) so you can read those.

For `--search`, it goes straight to Brave and returns the top results.

## Important: Brave is search, not fetch

Brave's API returns **search results (title / url / snippet)**, not the full body
of a specific blocked URL. The page-content tiers are Jina and direct-GET; Brave
is the "find another source" safety net. Don't treat a Brave snippet as the full
article — follow the returned URL (via this tool) to read it.

## Keys

- **Jina**: none required. Set `JINA_API_KEY` for a higher rate limit (optional).
- **Brave**: read automatically from `BRAVE_API_KEY`, else `~/.config/last30days/.env`,
  else `op read op://cli/last30days/brave`. No other 1Password vault is ever touched.

If Brave has no key, the search tier prints a clear error but the Jina/direct-GET
fetch tiers still work.
