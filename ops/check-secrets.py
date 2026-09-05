#!/usr/bin/env python3
"""Pre-commit secret scanner.

Blocks a commit when it would introduce credentials:
  * an env/secret file (``.env``, ``*.pem``, ``id_rsa`` …) being added, or
  * an added line that matches a known secret pattern.

Escape a confirmed false positive by appending  ``# pragma: allowlist secret``
to the offending line. Lines with obvious placeholders (``change-me``,
``localhost``, ``${...}``, ``os.getenv`` …) are ignored automatically.

Run standalone:  python3 ops/scripts/check_secrets.py
"""
from __future__ import annotations

import re
import subprocess
import sys

# ── Files that must never be committed ────────────────────────────────────────
BLOCKED_FILE = re.compile(r"(^|/)\.env(\.[^/]*)?$|\.pem$|(^|/)id_rsa$|\.p12$|\.pfx$")
ALLOWED_FILE = re.compile(r"\.env\.example$|\.env\.sample$")

# ── Secret value patterns ─────────────────────────────────────────────────────
PATTERNS: list[tuple[str, re.Pattern[str]]] = [
    ("private key", re.compile(r"-----BEGIN [A-Z ]*PRIVATE KEY-----")),
    ("AWS access key id", re.compile(r"\bAKIA[0-9A-Z]{16}\b")),
    ("GitHub token", re.compile(r"\bgh[pousr]_[A-Za-z0-9]{36,}\b")),
    ("Slack token", re.compile(r"\bxox[baprs]-[A-Za-z0-9-]{10,}\b")),
    ("SonarQube token", re.compile(r"\bsq[apu]_[0-9a-f]{40}\b")),
    ("Google API key", re.compile(r"\bAIza[0-9A-Za-z_\-]{35}\b")),
    (
        "credentials in URL",
        re.compile(r"://[^\s:/@]+:[^\s:/@]{3,}@"),
    ),
    (
        "hardcoded secret assignment",
        re.compile(
            r"""(?ix)
            \b(secret(_?key)?|passwd|password|api[_-]?key|access[_-]?key
              |auth[_-]?token|client[_-]?secret|private[_-]?key|token)\b
            \s*[:=]\s*
            ['"][^'"\s]{8,}['"]
            """
        ),
    ),
]

# ── Lines that look like placeholders / safe references ───────────────────────
PLACEHOLDER = re.compile(
    r"""(?ix)
    change[-_\s]?me | changeme | example\b | e\.g\. | placeholder | your[-_]
    | dummy | fake | redacted | sample | \blocalhost\b | 127\.0\.0\.1
    | not[-_]?a[-_]?real | <[^>]+> | \$\{ | \{\{ | os\.getenv | os\.environ
    | getenv\( | settings\. | config\. | \bnull\b | \bnone\b
    """
)
ALLOWLIST_PRAGMA = re.compile(r"pragma:\s*allowlist secret|noqa:\s*secret", re.I)


def _git(*args: str) -> str:
    return subprocess.run(
        ["git", *args], capture_output=True, text=True, check=True
    ).stdout


def blocked_files() -> list[str]:
    out = _git("diff", "--cached", "--name-only", "--diff-filter=A")
    return [
        p
        for p in out.splitlines()
        if BLOCKED_FILE.search(p) and not ALLOWED_FILE.search(p)
    ]


def added_lines() -> list[tuple[str, str]]:
    """Return (file, line) for every added line in the staged diff."""
    diff = _git("diff", "--cached", "--unified=0")
    results: list[tuple[str, str]] = []
    current = "?"
    for raw in diff.splitlines():
        if raw.startswith("+++ b/"):
            current = raw[6:]
        elif raw.startswith("+") and not raw.startswith("+++"):
            results.append((current, raw[1:]))
    return results


def scan() -> list[str]:
    problems: list[str] = []

    for path in blocked_files():
        problems.append(f"{path}: secret file must not be committed (use .env.example)")

    for path, line in added_lines():
        if ALLOWED_FILE.search(path):
            continue
        if ALLOWLIST_PRAGMA.search(line) or PLACEHOLDER.search(line):
            continue
        for label, pat in PATTERNS:
            if pat.search(line):
                snippet = line.strip()[:100]
                problems.append(f"{path}: possible {label} → {snippet}")
                break
    return problems


def main() -> int:
    try:
        problems = scan()
    except subprocess.CalledProcessError:
        return 0  # not a git context / nothing staged
    if not problems:
        return 0
    print("\n❌ Pre-commit: posibles secretos detectados:\n", file=sys.stderr)
    for p in problems:
        print(f"   • {p}", file=sys.stderr)
    print(
        "\n   Mueve el secreto a variables de entorno (.env, gitignored).\n"
        "   Si es un falso positivo, añade  # pragma: allowlist secret  a la línea.\n"
        "   Para saltarte el hook (no recomendado): git commit --no-verify\n",
        file=sys.stderr,
    )
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
