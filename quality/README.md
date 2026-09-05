# Quality

Notes on writing code that survives contact with the next person to read it. Naming,
functions, comments, SOLID, testing and code review — including the arguments against the
rules, which are usually more useful than the rules.

## Notes

- [The Fallacy of DRY](the-fallacy-of-dry.md) — applying DRY blindly *raises* maintenance
  cost; the question is whether two pieces of code represent the same concept or merely look
  alike.
- [Readable Functions: Minimize State](readable-functions.md) — what the functional paradigm
  actually buys you is the absence of mutable state, and you can have most of it anywhere.
- [Logging practices I follow](logging-practices.md) — when a log line earns its place, which
  level it belongs at, and what not to dump into production logs.
- [5 Ways to Write Better Mocks](5-ways-to-write-better-mocks.md) — the vocabulary first
  (double, stub, fake, spy, mock), then tests that break less and refactor better.
- [How to Give Good Feedback for Effective Code Reviews](how-to-give-good-feedback-for-effective-code-reviews.md) —
  show-and-tell, dialogic questions, and reviewing as a peer rather than a gate.

## Sections

- [Clean Code — reading notes](clean-code-book/) — chapter notes on Robert C. Martin's book.
- [SOLID](solid/) — the principles, and the case against them.

## Further reading

Links kept without a note of their own:

- [Documentation unit tests](https://simonwillison.net/2018/Jul/28/documentation-unit-tests/) — tests that fail when the docs go stale
- [What's the difference between unit, functional, acceptance and integration tests?](https://stackoverflow.com/questions/4904096/whats-the-difference-between-unit-functional-acceptance-and-integration-test)
- [Law of Demeter](https://wiki.c2.com/?LawOfDemeter) — only talk to your immediate friends; it pays off at refactoring time
- [Awesome software and architectural design patterns](https://github.com/DovAmir/awesome-design-patterns)
- [Design patterns for humans](https://github.com/kamranahmedse/design-patterns-for-humans)
- [DesignPatternsPHP](https://github.com/DesignPatternsPHP/DesignPatternsPHP)
- [Regex tester](https://www.regexpal.com/99314)
