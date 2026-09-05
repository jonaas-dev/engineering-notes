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
    "$(git ls-files |
        grep -vE '(^(README\.md|LICENSE)$|/README\.md$|^\.)' |
        grep -E '[A-Z ]|_' || true)"
# The hook only sees the staged diff. This audits everything already committed,
# reusing the hook's own patterns so the two can never drift apart.
check "no personal paths or addresses" \
    "$(PYTHONDONTWRITEBYTECODE=1 python3 - <<'PYEOF' || true
import pathlib, sys
sys.path.insert(0, "ops")
import importlib.util
spec = importlib.util.spec_from_file_location("cs", "ops/check-secrets.py")
cs = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cs)
import subprocess
files = subprocess.run(["git", "ls-files", "*.md"], capture_output=True,
                       text=True).stdout.split()
for f in map(pathlib.Path, files):
    for n, line in enumerate(f.read_text(errors="replace").splitlines(), 1):
        if cs.PERSONAL_PRAGMA.search(line):
            continue
        stripped = cs.PERSONAL_ALLOWED.sub("", line)
        for label, pat in cs.PERSONAL_PATTERNS:
            if pat.search(stripped):
                print(f"{f}:{n}: {label} -> {line.strip()[:90]}")
                break
PYEOF
)"
# Squash merges through the GitHub API are committed by web-flow as
# noreply@github.com, so that address is expected here and is not a leak.
check "only noreply committer addresses" \
    "$(git log --all --format='%ae%n%ce' | sort -u |
        grep -vE 'users\.noreply\.github\.com|^noreply@github\.com$' || true)"

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
done < <(git ls-files '*.md')
check "relative links resolve" "${broken%$'\n'}"

printf '\n  weight: %s\n' "$(du -sh --exclude=.git . 2>/dev/null | cut -f1 ||
    du -sh . | cut -f1)"
[ "$fails" -eq 0 ] || { printf '\n\033[31m%d check(s) failed\033[0m\n' "$fails"; exit 1; }
printf '\n\033[32mall checks passed\033[0m\n'
