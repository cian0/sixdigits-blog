#!/usr/bin/env bash
# ============================================================
#  Six Digits Blog — Interactive Management Script
# ============================================================

set -e

# Load nvm so node v22 is available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
nvm use 22 --silent 2>/dev/null || true

BLOG_DIR="$(cd "$(dirname "$0")" && pwd)"
POSTS_DIR="$BLOG_DIR/src/content/blog"

# ── Colours ──────────────────────────────────────────────────
BOLD='\033[1m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
RESET='\033[0m'

# ── Helpers ───────────────────────────────────────────────────
header() { echo -e "\n${BOLD}${CYAN}$1${RESET}"; }
success() { echo -e "${GREEN}✔  $1${RESET}"; }
info()    { echo -e "${YELLOW}ℹ  $1${RESET}"; }
error()   { echo -e "${RED}✘  $1${RESET}"; }

slugify() {
  echo "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed 's/[^a-z0-9 -]//g' \
    | sed 's/ \+/-/g' \
    | sed 's/^-\+\|-\+$//g'
}

# ── Actions ───────────────────────────────────────────────────

new_post() {
  header "📝  New Blog Post"
  read -rp "  Post title: " title
  [ -z "$title" ] && error "Title cannot be empty." && return

  read -rp "  Short description (for SEO): " description
  local slug
  slug=$(slugify "$title")
  local date
  date=$(date +%Y-%m-%d)
  local file="$POSTS_DIR/${slug}.md"

  if [ -f "$file" ]; then
    error "File already exists: src/content/blog/${slug}.md"
    return
  fi

  cat > "$file" <<FRONTMATTER
---
title: '${title}'
description: '${description}'
pubDate: '${date}'
tags: []
---

## Introduction

Write your content here.
FRONTMATTER

  success "Post created: src/content/blog/${slug}.md"
  info "Open it now? (code $file)"
  read -rp "  Open in VS Code? [y/N]: " open_it
  [[ "$open_it" =~ ^[Yy]$ ]] && code "$file"
}

dev_server() {
  header "🚀  Starting Dev Server"
  info "Blog will be live at http://localhost:4321 — press Ctrl+C to stop."
  cd "$BLOG_DIR" && npm run dev
}

build() {
  header "🔨  Building Site"
  cd "$BLOG_DIR" && npm run build
  success "Build complete! Output is in dist/"
}

preview_build() {
  header "👁  Previewing Production Build"
  cd "$BLOG_DIR"
  npm run build
  info "Preview running at http://localhost:4321 — press Ctrl+C to stop."
  npm run preview
}

deploy() {
  header "🚢  Deploy to GitHub Pages"

  # Show uncommitted changes
  cd "$BLOG_DIR"
  local changes
  changes=$(git status --short)
  if [ -z "$changes" ]; then
    info "No uncommitted changes found."
    read -rp "  Push the latest commit anyway? [y/N]: " confirm
    [[ ! "$confirm" =~ ^[Yy]$ ]] && return
  else
    echo -e "\n  ${BOLD}Changed files:${RESET}"
    git status --short | sed 's/^/    /'
    echo ""
    read -rp "  Commit message: " msg
    [ -z "$msg" ] && error "Commit message cannot be empty." && return

    git add -A
    git commit -m "$msg"
    success "Committed."
  fi

  git push origin main
  success "Pushed to GitHub — deploy running. Watch it at:"
  info "https://github.com/cian0/sixdigits-blog/actions"

  read -rp "  Watch deploy in terminal? [y/N]: " watch_it
  if [[ "$watch_it" =~ ^[Yy]$ ]]; then
    local run_id
    run_id=$(gh run list --limit 1 --json databaseId --jq '.[0].databaseId' 2>/dev/null)
    if [ -n "$run_id" ]; then
      gh run watch "$run_id"
    else
      error "Could not fetch run ID. Check GitHub Actions manually."
    fi
  fi
}

list_posts() {
  header "📚  Blog Posts"
  local count=0
  for f in "$POSTS_DIR"/*.md "$POSTS_DIR"/*.mdx; do
    [ -f "$f" ] || continue
    local slug
    slug=$(basename "$f")
    local title
    title=$(grep -m1 '^title:' "$f" | sed "s/^title: *['\"]*//;s/['\"]*$//")
    local date
    date=$(grep -m1 '^pubDate:' "$f" | sed "s/^pubDate: *['\"]*//;s/['\"]*$//")
    printf "  ${CYAN}%-55s${RESET} %s\n" "$title" "$date"
    (( count++ )) || true
  done
  [ "$count" -eq 0 ] && info "No posts yet."
  echo ""
}

check_deploy_status() {
  header "📡  Latest Deploy Status"
  cd "$BLOG_DIR"
  gh run list --limit 5 2>/dev/null || error "gh CLI not authenticated."
}

open_site() {
  header "🌐  Opening Site"
  open "https://sixdigits.ai"
}

# ── Main Menu ─────────────────────────────────────────────────

main_menu() {
  while true; do
    echo ""
    echo -e "${BOLD}╔══════════════════════════════════════╗${RESET}"
    echo -e "${BOLD}║     Six Digits Blog — Management     ║${RESET}"
    echo -e "${BOLD}╚══════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "  ${CYAN}1)${RESET} 📝  New blog post"
    echo -e "  ${CYAN}2)${RESET} 📚  List posts"
    echo -e "  ${CYAN}3)${RESET} 🚀  Start dev server  ${YELLOW}(localhost:4321)${RESET}"
    echo -e "  ${CYAN}4)${RESET} 🔨  Build site"
    echo -e "  ${CYAN}5)${RESET} 👁   Preview production build"
    echo -e "  ${CYAN}6)${RESET} 🚢  Commit & deploy to GitHub Pages"
    echo -e "  ${CYAN}7)${RESET} 📡  Check deploy status"
    echo -e "  ${CYAN}8)${RESET} 🌐  Open sixdigits.ai"
    echo -e "  ${CYAN}q)${RESET} Quit"
    echo ""
    read -rp "  Choose an option: " choice

    case "$choice" in
      1) new_post ;;
      2) list_posts ;;
      3) dev_server ;;
      4) build ;;
      5) preview_build ;;
      6) deploy ;;
      7) check_deploy_status ;;
      8) open_site ;;
      q|Q|quit|exit) echo -e "\n  ${GREEN}Bye!${RESET}\n"; exit 0 ;;
      *) error "Invalid option. Please choose 1-8 or q." ;;
    esac
  done
}

main_menu
