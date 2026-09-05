#!/usr/bin/env bash
# Structural checks for the notes. Run before opening or merging any migration PR.
#
# Every check materialises its output before matching it: `... | grep -q` under
# `set -o pipefail` dies on SIGPIPE and reads back as "no matches", which once
# produced a false clean verdict on a repo that was not clean.
set -uo pipefail
cd "$(git rev-parse --show-toplevel)"

fails=0
check() {
    local name="$1" out="$2"
    if [ -z "$out" ]; then
        printf '  \033[32m✓\033[0m %s\n' "$name"
    else
        printf '  \033[31m✗\033[0m %s\n' "$name"
        printf '%s\n' "$out" | sed 's/^/      /'
        fails=$((fails + 1))
    fi
}

check "no doctoc blocks" \
    "$(grep -rl 'doctoc' --include='*.md' . || true)"
check "no decorative separators" \
    "$(grep -rn '<!--- *[/=]\{5,\}' --include='*.md' . || true)"
check "no untranslated 'Font:'" \
    "$(grep -rn 'Font *:' --include='*.md' . || true)"
check "no known misspellings" \
    "$(grep -rniE 'managment|enginnering|desarollador|confortable|warnign|aplications|problemes with' --include='*.md' . || true)"
check "kebab-case paths" \
    "$(find . -path ./.git -prune -o -type f -print |
        grep -vE '(^\./(README\.md|LICENSE)$|/README\.md$|^\./\.)' |
        grep -E '[A-Z ]|_' || true)"
check "no personal paths or addresses" \
    "$(grep -rnE '/home/[a-z]+/|/c/Users/[A-Za-z]|@[a-z0-9-]+\.local' \
        --include='*.md' . || true)"
check "single committer email" \
    "$(git log --all --format='%ae%n%ce' | sort -u | grep -v 'users\.noreply\.github\.com' || true)"

broken=""
while IFS= read -r file; do
    dir=$(dirname "$file")
    targets=$(grep -oE '\]\([^)#][^)]*\)' "$file" | sed 's/^](//; s/)$//' || true)
    while IFS= read -r target; do
        [ -z "$target" ] && continue
        case "$target" in http*|mailto:*|'#'*) continue ;; esac
        target="${target%%#*}"
        [ -z "$target" ] && continue
        [ -e "$dir/$target" ] || broken="$broken$file -> $target"$'\n'
    done <<< "$targets"
done < <(find . -path ./.git -prune -o -name '*.md' -print)
check "relative links resolve" "${broken%$'\n'}"

printf '\n  weight: %s\n' "$(du -sh --exclude=.git . 2>/dev/null | cut -f1 ||
    du -sh . | cut -f1)"
[ "$fails" -eq 0 ] || { printf '\n\033[31m%d check(s) failed\033[0m\n' "$fails"; exit 1; }
printf '\n\033[32mall checks passed\033[0m\n'
