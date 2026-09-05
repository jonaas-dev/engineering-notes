# Engineering Notes

Notes I keep on how software gets built and led: architecture, code quality, backend,
delivery, and the parts of the job that are not code. Kept since 2023, consolidated here from
eight separate repositories.

These are working notes, not articles. Most distil something I read or watched and thought
worth keeping; the `Source:` line at the top of each one points at the original. Where a note
is a summary of someone else's work, it says so.

## Start here

If you only read five:

- **[Is High Quality Software Worth the Cost?](leadership/is-high-quality-software-worth-the-cost.md)** —
  internal quality is not traded against speed, it is the mechanism of it, and the pay-off
  period is weeks rather than years. The argument I reach for most often.
- **[The Perfect Commit](devops/git/the-perfect-commit.md)** — one focused change, the tests
  that prove it, the docs it changes, and a message explaining why. This is the standard I
  hold my own work to.
- **[The Fallacy of DRY](quality/the-fallacy-of-dry.md)** — applying DRY blindly *raises*
  maintenance cost. The question is never "do these look alike" but "are these the same
  concept".
- **[Alien Artefacts](career/alien-artefacts.md)** — the legacy code written by very smart
  people who have left: it works perfectly and resists all change. Includes how to avoid
  creating one.
- **[Designing APIs for humans: Error messages](backend/api/designing-apis-for-humans-error-messages.md)** —
  an API is a user interface and its users are engineers under time pressure.

## Sections

| Section | What's inside | |
| --- | --- | --- |
| [Leadership](leadership/) | Quality economics, feedback, hiring, agile in practice | 7 notes |
| [Career](career/) | Growing as an engineer, seniority, promotion, sustainable work | 25 notes |
| [Quality](quality/) | Clean Code, SOLID, testing, code review, logging | 11 notes |
| [Backend](backend/) | API design, databases, microservices | 7 notes |
| [DevOps](devops/) | Git, Linux, tooling | 8 notes |
| [Frontend](frontend/) | The web platform, React, JavaScript | 5 notes |

## Conventions

- **A note is not an article.** Each one is a distillation with a link to the source. Nothing
  here pretends to be original research.
- **Structure is English** — section names, folder names, filenames, and this index.
- **Notes keep the language of their source.** A note on a Spanish talk stays in Spanish;
  reference tables I wrote for myself are often in Catalan. The indexes mark these `[ES]`,
  `[CA]` or `[EN/CA]`, so the mixture is a decision rather than an accident.
- **Notes that distil something carry a `Source:` line.** The command references in
  [DevOps](devops/) and the database-types note do not, because they are not
  distillations of anything — they are mine, written from use. That distinction is the
  point of stating it.
- **Images are attributed.** Diagrams that are not mine credit the author and link the
  article. Third-party images carried without attribution were removed and replaced by a link
  to their source.
- **Further reading is not filler.** Where a topic never grew past a couple of links, the
  links live in the section index instead of a file that pretends to be a note.

## Working on this repo

```sh
sh ops/install-hooks.sh   # once per clone: points git at .githooks/
./ops/verify.sh           # structural checks; also runs inside the pre-commit hook
```

`core.hooksPath` is local config and does not travel with a clone, so the install step is
required for the hook to run at all. The hook refuses any commit carrying a credential, a
personal path or address, or a committer identity that is not the GitHub noreply address.

## License

[MIT](LICENSE) — the notes are mine; quoted material belongs to the authors credited in each
file.
