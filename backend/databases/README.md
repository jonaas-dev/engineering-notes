# Databases

- [Database types](database-types.md) — relational, document, key-value, graph, columnar and
  the rest, with what each is actually good at.
- [How slow is `SELECT *`?](how-slow-is-select.md) — the four costs it pays: page read,
  deserialising inline columns, external storage (TOAST), network transmission.
- [Relational databases aren't dinosaurs, they're sharks](relational-databases-are-sharks.md) —
  the "they don't scale, they aren't agile" criticisms, and the narrow contexts where they hold.

## Further reading

- [gh-ost](https://github.com/github/gh-ost) — schema changes with no downtime
- [Nine ways to shoot yourself in the foot with PostgreSQL](https://philbooth.me/blog/nine-ways-to-shoot-yourself-in-the-foot-with-postgresql)
- [Sakila sample database](https://downloads.mysql.com/docs/sakila-en.a4.pdf) and [MySQL test datasets](https://www.netveloper.com/bases-de-datos-de-pruebas-para-mysql) `[ES]`
- [DacheQL](https://github.com/oslabs-beta/DacheQL) — GraphQL caching over Redis with LRU eviction
