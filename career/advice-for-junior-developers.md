# Advice for Junior Developers

Source: <https://dev.to/jeroendedauw/advice-for-junior-developers-30am?utm_source=tldrnewsletter>

### 1. Code is not the Point

Software development is expensive, with the vast majority of the effort of real-world projects typically going into :warning: **maintenance** ([click for more](https://agilemanifesto.org/)). 

There is nothing so useless :warning: **as doing efficiently something that should not have been done at all** ([click for more](https://medium.com/swlh/there-is-nothing-so-useless-as-doing-efficiently-something-that-should-not-have-been-done-at-all-8c5d2282319d)).

The Best Code is No Code At All ([click for more](https://blog.codinghorror.com/the-best-code-is-no-code-at-all/))

To quote Bill Gates: "*Measuring programming progress by lines of code is like measuring aircraft building progress by weight.*"

You aren't gonna need it ([click for more](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it )).

KISS principle (Keep it simple)

The Last Responsible Moment ([click for more](https://blog.codinghorror.com/the-last-responsible-moment/))

### 2. Software Design Matters

the only way to go fast is to go well.

TradableQualityHypothesis ([click for more](https://martinfowler.com/bliki/TradableQualityHypothesis.html)): 

The reason that people care about internal quality is because they think another hypothesis applies - the DesignStaminaHypothesis. __In this hypothesis internal quality isn't tradable because reducing internal quality slows us down__. It's true that not attending to design can supply a short term speed up, __but this is only over a quite short time horizon - far shorter than most people think__.
But the tragedy is that as soon as you frame internal quality as tradable, you've lost.

Instead it's vital to focus on the true value of internal quality - that it's the enabler to speed. The purpose of internal quality is to go faster. This cuts both ways, of course, it also means you should understand how putting some time into a refactoring is going to help you go faster, otherwise you shouldn't be doing it.

…and that's a crippling disadvantage to those of us **who know that speed requires good design**.

Other links:
- https://martinfowler.com/bliki/DesignStaminaHypothesis.html
- https://martinfowler.com/articles/is-quality-worth-cost.html
- https://www.entropywins.wtf/blog/2017/01/02/simple-is-not-easy/

### 3. Use the BEST Practices

one piece of advice based on my own experiences is to be wary of best practices specific to the community of your language or framework

### 4. Write Tests

You think test-first is difficult? Try debug-after.

**Writing tests is difficult if the design of your code is poor**, such as when using inheritance for code reuse, or when using static functions. If on the other hand, you have SOLID classes, with no global dependencies, then writing nice tests is not so difficult.

### 5. Do Not Use Inheritance For Code Reuse

Composition over inheritance (or composite reuse principle) in object-oriented programming (OOP) is the principle that classes should achieve polymorphic behavior and code reuse by their composition (by containing instances of other classes that implement the desired functionality) rather than inheritance from a base or parent class. This is an often-stated principle of OOP, such as in the influential book Design Patterns (1994) ([for more](https://en.wikipedia.org/wiki/Composition_over_inheritance))

### 6. Write Object-Oriented code

There is so much value in understanding these principles and antipatterns.

Some topics: 
- [From STUPID to SOLID code](https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/)
- Pro SOLID, [Why Every Single Argument of Dan North is Wrong](https://www.entropywins.wtf/blog/2017/02/17/why-every-single-argument-of-dan-north-is-wrong/).

### 7. Write Functional Code
:warning: `Functional programming` is not to be confused with `imperative structural programming`.

- [Readable functions: minimize state](../quality/readable-functions.md)
    - MINIMIZE MUTABILITY
    - MINIMIZE SCOPE
- Readable functions: do one thing ([click](https://www.entropywins.wtf/blog/2018/10/30/readable-functions-do-one-thing/))
- functional core, imperative shell ([click](https://www.destroyallsoftware.com/screencasts/catalog/functional-core-imperative-shell))

### 8. Use Informed Duplication.

- Don't repeat yourself (DRY) ([click](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself))

:warning: Evitant codi duplicat s’acaba en “contextos molt complexos i problemes varis”.([The fallacy of DRY](https://www.entropywins.wtf/blog/2017/09/06/the-fallacy-of-dry/))

- `Write Everything Twice` (WET). The idea behind WET is to only deduplicate on the third occurrence of duplication. [**A LA TERCERA ET TOCA REFACTOR**].

### 9. Types, Names and Comments.

*Every time you write a comment, you should grimace and feel the failure of your ability of expression.*\
*Robert C. Martin*

:warning: Comments `are dangerous` because `they can lie`.

To write **self-documenting code**:
1) Do one thing in you functions
    - clear name
    - …
    - extract till you drop
    - Command query separation
    - Similar tot the Single Responsibility Principle (The S in SOLID)
2) Minimize state
3) Use types
4) Avoid mixed types.
5) write tests.

Others:
- [Extract Till You Drop](https://verraes.net/2013/09/extract-till-you-drop/)
- [Command Query Separation](https://martinfowler.com/bliki/CommandQuerySeparation.html)
- [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle)
