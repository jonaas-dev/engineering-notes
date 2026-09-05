# The Perfect Commit

Source: <https://simonwillison.net/2022/Oct/29/the-perfect-commit/>
This is a single commit that contains all of the following:

- The `implementation`: a single, focused change
- `Tests` that demonstrate the implementation works
- Updated `documentation` reflecting the change
- A link to an `issue thread` providing further context

## Implementation

- Each commit should change a `single thing`.
- `Atomic commits` are also much easier to cleanly revert if something goes wrong—or to cherry-pick into other branches.

:warning: Tools: `git blame` or `git bisect`. 

## Tests

- In the longer term, `this productivity` improvement comes from `gaining the freedom to make changes and stay confident that your change hasn’t broken something else`.

- If your project has no tests at all, adding a test for your change will be a lot more work.

- I use these `cookiecutter templates` :warning: for almost all of my new projects. They configure a testing framework with a single passing test and GitHub Actions workflows to exercise it all from the very start.

## Documentation

In my work these projects are usually one of the following:

- `Python APIs` (modules, functions and classes) that provide code designed to be imported into other projects.
- `Web APIs` —usually JSON over HTTP these days—that provide functionality to be consumed by other applications.
- `Command line interface tools`, such as those implemented using Click or Typer or argparse. :warning: Tools: `Click` or `Typer` or `argparse`.

It is critical that this documentation **must live in the same repository as the code itself**.
- Documentation is only valuable if people trust it.
- Documentation should be versioned.
- Documentation changes should be reviewed in the same way as your code.
- And ideally, documentation should be tested.

## A link to an issue

TODO

## An issue is more valuable than a commit message

As I extended my practice of writing issue threads, `I found that they were a better place for most of this context than the commit messages themselves`. They supported embedded media, were more discoverable and I could continue to extend them even after the commit had landed.

:bulb: [en realitat treballar amb issues i no en commits no es un problema, el tio s'ha construit i tot un "exporter" per obtenir totes les dades que no podem obtenir amab un simple clone] ([github-to-sqlite](https://github.com/dogsheep/github-to-sqlite#fetching-pull-requests-for-a-repository))

## Not every commit needs to be “perfect”
...

## Write scrappy commits in a branch

I’ll then `squash-merge` them into a single perfect commit (sometimes via a self-closed GitHub pull request) to keep my main branch as tidy as possible.

[treballa en una branca fent de les seves i finalment realitza un perfect commit a la branca via PR per exemple]
