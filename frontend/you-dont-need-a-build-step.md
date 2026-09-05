# You Don't Need a Build Step

Source: <https://deno.com/blog/you-dont-need-a-build-step>
## How building became the norm

What if I could write server side JS but in the browser?

Node's server-side JavaScript isn't compatible with browser JavaScript, because each implementation satisfies two entirely different systems:

Node is built around a filesystem. A server has HTTP-driven IO, but the internals are all about finding the right files within the filesystem.
JavaScript was created for browsers where scripts/resources are imported asynchronously via URLs.

## The rise of JavaScript build tools

Browserify - 2011\
Grunt - 2012\
Bower - 2012\
Gulp - 2013\
Babel - 2014\
Webpack - 2014\
Rollup - 2015\
Parcel - 2017\
SWC - 2019\
Vite - 2020\
ESBuild - 2020\
Turbopack - 2022

## The Next.js Four-step Build Process
```bash
npx create-next-app --example blog-starter blog-starter-app
npm run build
```

### :warning: Compiling

`Compiling` (this code needs to be converted into vanilla JavaScript for the browser). First, parse the code and turn it into an abstract representation, called an Abstract Syntax Tree

Then, transform this AST into a representation that is supported by the target language

Finally, generate new code from this new AST representation

### :warning: Minifying
...
### :warning: Bundling
...

- [`TOOL`] https://github.com/sverweij/dependency-cruiser
- [Map of dependencies for a basic Next.js App](https://deno.com/blog/you-dont-need-a-build-step/map-of-nextjs-dependencies.svg)

### :warning: Code splitting

`Code splitting` helps "lazy load" things currently needed by the user by loading only what is needed and avoiding code that may never be used. With React, you can experience up to 30% reduction in main bundle size when using code splitting.

## Non-building with Deno and Fresh

### Just-in-time builds over bundling
/routes/[slug].tsx

### Just-in-time transpiling

## Better code, faster
