# Software engineering practices for development teams

Source: <https://simonwillison.net/2022/Oct/1/software-engineering-practices/>

## :memo: Documentation in the same repo as the code

The best trick I know of for improving the trustworthiness of documentation is **to put it in the same repository as the code it documents**, for a few reasons:

1) Pots actualitzar el codi alhora que la documentació (en PR)
2) You get versioned documentation.
2) You can integrate your documentation with your automated tests! (see the note on documentation unit tests, arriving with the quality section)

## :robot: Mechanisms for creating test data

Your engineers need a way to **replicate these situations** in their own development environments (per solucionar tickets).

1) One way to handle this is to provide tooling to import production data into local environments
2) A better approach is to have a robust system in place for generating test data, that covers a variety of different scenarios. (That way engineers can replicate problems locally without needing copies of production data).

## :warning: Rock solid database migrations

The hardest part of large-scale software maintenance is inevitably the bit where you need to change your database schema.

*Opinió (:bulb:):Degut a que fer canvis en l’esquema de la db, que és  “perillos i dur” la gent està agafant el costum d'utilitzar db noSQL perquè així poden treballar de qualsevol manera, que sempre es mes còmode.*

Amb django per exemple:

1) The database knows which migrations have already been applied
2) A single command that applies pending migrations …
3) Optional: rollbacks.

:warning:Even harder is the challenge of making schema changes **without any downtime**. ([Tool: gh-ost](https://github.com/github/gh-ost))

- WITH DOWNTIME, The process needs to be:
  - `Design a new schema` change that can be applied without changing the application code that uses it.
  - Ship that change to production, `upgrading your database` while keeping the old code working.
  - Now ship new application code that `uses the new schema`.
  - Ship a new schema change that `cleans up` any remaining work—dropping columns that are no longer used, for example.

This process is a pain. It’s difficult to get right. The only way to get good at it is `to practice it a lot over time`. My rule is this: schema changes should be boring and common, as opposed to being exciting and rare.

## :notebook: Templates for new projects and components
<https://simonwillison.net/2021/Aug/28/dynamic-github-repository-templates/>
<https://cookiecutter.readthedocs.io/en/stable/>

## :robot: Automated code formatting

This saves an incredible amount of time in two places:

1) As an individual, you get back all of that mental energy you used to spend thinking about the best way to format your code and can spend it on something more interesting.
2) As a team, your code reviews can entirely skip the pedantic arguments about code formatting. Huge productivity win!

## :white_check_mark: Tested, automated process for new development environments

… you need a documented process for creating a new environment—and it has to be known-to-work, so any time someone is onboarded using it they should be encouraged to fix any problems in the documentation or accompanying scripts as they encounter them.

Tools like Docker have made this a LOT easier over the past decade.

I’m increasingly convinced that the best-in-class solution here is **cloud-based** development environments. **The ability to click a button on a web page and have a fresh, working development environment running a few seconds** later is a game-changer for large development teams.

Examples:

- <https://github.com/features/codespaces>
- <https://www.gitpod.io/>

## :robot: Automated preview environments

Examples:

- <https://vercel.com/features/previews>
- <https://www.netlify.com/products/deploy-previews/>
- <https://render.com/docs/pull-request-previews>
- <https://devcenter.heroku.com/articles/github-integration-review-apps>

This is another one of those things which requires some up-front investment but will pay itself off many times over through increased productivity and quality of reviews.
