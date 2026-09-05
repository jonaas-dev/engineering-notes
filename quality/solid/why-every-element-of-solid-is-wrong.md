# Why Every Element of SOLID is Wrong

Source: <https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong>
## Single Responsability Principle

"one reason to change"\
"only do one thing"

In your opinion: `Pointlessly Vague Principle`!
- What is a single responsibility anyway?
- ETL: three responsibilities or one?
- How can you predict what is going to change?

Your solution: `Write simple code`.

- Simple code is easy to reason about
- Can easily do several related things
- Refactor until it **Fits In Your Head**

## Open-Closed

"open for extension, closed for modification"\
"when requirements change, extend behaviour by addiong new code, not changing code that works"

In your opinion: `Cruft Accretion Principle`!
- When requirements change, **the existing code is now wrong! so replace it with** code that works"

Your solution: `Write simple code`.
- Simple code is easy to change 
- Simple code is easey to test
- Simple code is both open and closed

## Liskov Substitution Principle

"Strong behavioural subtyping"\

Substitution with a subtype preserves all "desirable properties" of the original type "Provably undecidable" but useful.

In your opinion: `Drrcker's Warning Principle`!
- "There is nothing quite so uselees, as doing with great efficiency, something that should not be done at all."
- Stuck in **is-a** and **has-a** modelling mindset.

Your solution: `Write simple code`.
- What about acts-like-a, can-be-used-as-a ?
- Composition is simpler than inheritance
- Try to avoid object hierarchies altogether.

## Interface Segregation Principle

"Many small interfaces are better than one bit object"\

Design small, role-based interfaces

No client depends on methods it doens't use

In your opinion: `Stable Door Principle`!
- **Practically anything** is better than one big object
- Degign small, role-based **classes**.
- No client depends on methods it doesn't use (**This is already true**)

Your solution: `Write simple code`.
- Don't write big objects in the first place!
- Write code that **Fits in your head**
- If a class needs lots of interfaces, simplify the class!

## Dependency Inversion Principle

"High-leve modules should not depende on lowe-level modules"\

Abstractions (e.g. interfaces) should not depende on details (e.g. concrete implmentations)

In your opinion: `Wrong Goal Principle`!
- **Reuse** is overrated, design for use!
- DIP leads to a differents kind of dependency, dependency on DI frameworks!

Your solution: `Write simple code`.
- See how far you get combining simple classes **new** is the new **new**!
- Assemble into small components that **Fit In Your Head**
