# Backend

Notes on designing the server side: API contracts, what the database is really doing, and
when splitting a system into services stops helping.

## Sections

- [API design](api/) — contracts, object ids, error messages, security. The strongest part
  of this section.
- [Databases](databases/) — types, query cost, and the case for relational.

## Notes

- [Microservices: what they are and when they hurt](microservices.md) — the monolith they
  replace, what the split buys, and the recovery path when it was the wrong call.

## Further reading

Links kept without a note of their own:

**Python**

- [How virtual environments work](https://snarky.ca/how-virtual-environments-work)
- [Python Launcher](https://python-launcher.app/)
- [Hello Python](https://github.com/mouredev/Hello-Python) `[ES]`

**PHP**

- [PhpSpreadsheet](https://github.com/PHPOffice/PhpSpreadsheet) — read and write spreadsheets
- [Graph](https://github.com/graphp/graph) — graph data structures
- [Robo](https://github.com/consolidation/robo) — PHP task runner in the spirit of Gulp
- [PHP CS Fixer](https://github.com/PHP-CS-Fixer/PHP-CS-Fixer) and [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)

**Frameworks**

- Django is a full-stack framework; **Django REST Framework** is a backend microframework on top of it — they are not alternatives to each other
- [Yii 2 core code style](https://github.com/yiisoft/yii2/blob/master/docs/internals/core-code-style.md) and [Yii 2 API doc generator](https://github.com/yiisoft/yii2-apidoc)
- [Turbopack, introduced in Next 13](https://nextjs.org/blog/next-13#introducing-turbopack-alpha)

**Search and infrastructure**

- [Metricbeat](https://www.elastic.co/beats/metricbeat) — Elasticsearch metrics shipper
- [Building a GitHub repo explorer with React and Elasticsearch](https://www.freecodecamp.org/news/building-a-github-repo-explorer-with-react-and-elasticsearch-8e1190e59c13/)
- [2023 state of databases for serverless and edge](https://leerob.io/blog/backend)
- [How to recover from microservices](https://world.hey.com/dhh/how-to-recover-from-microservices-ce3803cc) — stop digging, consolidate dependent paths first, leave isolated hotspots for last
