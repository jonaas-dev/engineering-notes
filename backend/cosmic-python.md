# Architecture Patterns with Python (Cosmic Python)

**Authors:** Harry Percival, Bob Gregory  
**Publisher:** O'Reilly, 2020  
**Online version:** <https://www.cosmicpython.com/book/preface.html>  
**Chapter 6 link:** <https://www.cosmicpython.com/book/chapter_06_uow.html>

A practical, code-first walkthrough of applying Domain-Driven Design, test-driven development and event-driven architecture in Python. It builds a small allocation system for a furniture retailer and introduces classic patterns as concrete, layered abstractions rather than framework magic.

## What it covers

**Part 1 — Building an Architecture to Support Domain Modeling**

- **Preface** — Why the book exists: moving from "Big Ball of Mud" to maintainable enterprise Python.
- **Introduction** — Encapsulation, abstraction, layering and the Dependency Inversion Principle as the foundation.
- **1. Domain Modeling** — Building a rich domain model with TDD, keeping it free of framework and database dependencies.
- **2. Repository Pattern** — Abstracting persistent storage so the domain model does not know about the database.
- **3. A Brief Interlude: On Coupling and Abstractions** — Heuristics for choosing good abstractions and controlling coupling.
- **4. Our First Use Case: Flask API and Service Layer** — The service layer as the boundary of a use case; Flask becomes a thin adapter.
- **5. TDD in High Gear and Low Gear** — Test pyramid, high-level unit tests and balancing speed with confidence.
- **6. Unit of Work Pattern** — Atomic operations via a context manager, explicit commit/rollback and collaboration with repositories.
- **7. Aggregates and Consistency Boundaries** — Defining aggregates to enforce invariants and data integrity.

**Part 2 — Event-Driven Architecture**

- **8. Events and the Message Bus** — Domain events and a simple message bus to decouple side effects.
- **9. Going to Town on the Message Bus** — Evolving the bus into the main orchestration mechanism.
- **10. Commands and Command Handler** — Distinguishing commands from events and structuring handlers.
- **11. Event-Driven Architecture: Using Events to Integrate Microservices** — Using events for inter-service integration without tight coupling.
- **12. Command-Query Responsibility Segregation (CQRS)** — Separating read and write models.
- **13. Dependency Injection (and Bootstrapping)** — Wiring dependencies explicitly without a heavy framework.
- **Epilogue: How to Get There from Here** — Applying the patterns to existing codebases.

**Appendices**

- Summary diagram and pattern table.
- Template project structure.
- Swapping infrastructure to CSV/CLI to prove the abstractions.
- Repository and Unit of Work with Django.
- Validation strategies.

## Why it matters

The book shows how to keep business logic isolated from frameworks and infrastructure, making the core domain fast to unit test and cheap to refactor. The patterns are introduced incrementally against the same example, so the trade-offs of each abstraction are visible at every step.
