# Engineering Notes

Notes I keep on how software gets built and led: architecture, code quality, backend,
delivery, and the parts of the job that are not code. Collected since 2023, consolidated
here from eight scattered repositories.

These are working notes, not articles. Each one distils a source I found worth keeping and
says why. Where a note summarises a talk or a post, the `Source:` line points at the original.

## Sections

| Section | What's inside | |
| --- | --- | --- |
| [Leadership](leadership/) | Team quality, feedback, hiring, agile in practice | 7 notes |
| [Career](career/) | Growing as an engineer, seniority, working habits | 26 notes |
| [Quality](quality/) | Clean code, SOLID, testing, code review | 12 notes |
| [Backend](backend/) | API design, databases, microservices | 7 notes |
| [DevOps](devops/) | Git, Linux, tooling | 8 notes |
| Frontend | CSS, JavaScript, React, the web platform | *migrating* |

Sections marked *migrating* are still being consolidated from their original repositories.

## Conventions

- **Structure is English.** Section names, folder names, and this index are in English.
- **Notes keep the language of their source.** A note on a Spanish talk stays in Spanish.
  The index marks those entries with `[ES]` or `[CA]`.
- **Every note carries a `Source:` line** with a link to the original material.
- **Images are attributed.** Diagrams that are not mine credit the author and link the article.

## Working on this repo

```sh
sh ops/install-hooks.sh   # once per clone: points git at .githooks/
./ops/verify.sh           # structural checks, run before every PR
```

`core.hooksPath` is local config and does not travel with a clone, so the install step is
required for the pre-commit hook to run at all. The hook refuses any commit that carries a
credential, a personal path or address, or a committer identity that is not the GitHub
noreply address.

## License

[MIT](LICENSE) — the notes are mine; quoted material belongs to the authors credited in each file.
