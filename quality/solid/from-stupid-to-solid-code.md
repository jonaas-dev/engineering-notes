# From STUPID to SOLID Code

Source: <https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code>

## :warning: STUPID code, seriously?

what does that mean?
- Singleton
- Tight Coupling
- Untestability
- Premature Optimization
- Indescriptive Naming
- Duplication

### Singleton 

Singletons are controversial, and they are often considered anti-patterns. You should avoid them. Actually, the use of a singleton is not the problem, but the symptom of a problem. Here are two reasons why:

- Programs using global state are very difficult to test;
- Programs that rely on global state hide their dependencies.

### Tight Coupling

Tight coupling, also known as strong coupling, is a generalization of the Singleton issue. Basically, you should reduce coupling between your modules. Coupling is the degree to which each program module relies on each one of the other modules.

Tightly coupled modules **are difficult to reuse, and also hard to test**.

### Untestability

... testing should not be hard! No, really. Whenever **you don’t write unit tests because you don’t have time**, the real issue is that **your code is bad**, but that is another story.

Most of the time, untestability is caused by tight coupling.

### Premature Optimization

Donald Knuth said: “premature optimization is the root of all evil. There is only cost, and no benefit” ([see more](http://wiki.c2.com/?PrematureOptimization)).

two rules: 
- don’t do it;
- (for experts only!) don’t do it yet.

### Indescriptive Naming

`Don’t abbreviate!` You write code for people, not for computers.

Computers just understand 0 and 1. Programming languages are for humans.

### Duplication 

**Duplicated code is bad**, so please **Don’t Repeat Yourself** (DRY), and also **Keep It Simple, Stupid**. Be lazy the right way - write code only once!

## :warning: SOLID to the rescue!

SOLID is a term describing a collection of design principles for good code that was invented by Robert C. Martin, also known as Uncle Bob.

SOLID means:

### Single Responsibility Principle

Single Responsibility Principle or SRP states that **every class should have a single responsibility**. There should never be more than one reason for a class to change.

Ask yourself whether the logic you are introducing should live in this class or not. Using layers in your application helps a lot. **Split big classes in smaller ones, and avoid god classes**.

Last but not least, write straightforward comments. If you start writing comments such as in this case, but if, except when, or, then you are doing it wrong.

### Open/Closed Principle

Open/Closed Principle or OCP states that software entities should be open for extension, but closed for modification.

You should make all member variables private by default. Write getters and setters only when you need them.

### Liskov Substitution Principle

Liskov Substitution Principle or LSP states that **objects in a program should be replaceable with instances of their subtypes without altering the correctness of the program**.

:warning: to complete with an example

### Interface Segregation Principle

Interface Segregation Principle or ISP states that **many client-specific interfaces are better than one general-purpose interface**. In other words, *you should not have to implement methods that you don’t use*. Enforcing ISP gives you `low coupling`, and `high cohesion`.`

The idea is to keep your components focused and try to minimize the dependencies between them.

### Dependency Inversion Principle

Dependency Inversion Principle or DIP has two key points:

- Abstractions should not depend upon details;
- Details should depend upon abstractions.

This principle could be rephrased as use the same level of abstraction at a given level.

Note *that Dependency Inversion Principle is not the same as Dependency Injection*.

Also, rather than working with classes that are tight coupled, use interfaces. This is called programming to the interface. This reduces dependency on implementation specifics and makes code more reusable.
