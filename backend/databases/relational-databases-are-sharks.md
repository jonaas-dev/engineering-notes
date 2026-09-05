# Relational databases aren't dinosaurs, they're sharks

Source: <https://www.simplethread.com/relational-databases-arent-dinosaurs-theyre-sharks/>
In other words, they don’t scale. They aren’t agile.

Some of these criticisms can be valid, but only in context.

## :green_circle: What Relational Databases Give Us

- `Atomicity` – The guarantee that any series of operations within a transaction are treated as a single unit. The entire thing either succeeds or fails, and won’t leave you in an invalid state.

- `Consistency` – The guarantee that any operation against the database will leave it in a valid state.

- `Isolation` – The guarantee that any operations executed concurrently will leave the database in the same state as they would have if they were executed sequentially. Generally this means that transactions can’t see data being modified by other transactions.

- `Durability` – The guarantee that once a transaction is committed, it will stay committed, regardless of whether the system crashes or power fails.`

And finally, not a core ACID guarantee of relational databases, but there is another critical feature set around data integrity. Tools such as foreign keys, unique constraints, not null constraints, check constraints, etc. Combine these features with transactions, and `you now have customizable logical guarantees about your data that your database will enforce`.

All of these guarantees come together to make writing reliable systems that keep consistent data a routine problem. Sure, there are still challenges around how and when to apply these tools, but when used correctly it makes keeping your data clean and consistent a tractable task.

## :green_circle: NoSQL Tradeoffs

An acronym was created, BASE, to describe the operational characteristics and tradeoffs of most NoSQL databases.

- `Basically Available` – The system can guarantee availability, as defined by the **CAP theorem**, but by potentially trading off consistency.

- `Soft State` – The database doesn’t enforce data consistency, and values may change without interaction, due to eventual consistency.

- `Eventual Consistency` – When data is written, it isn’t guaranteed to be immediately consistent to all database consumers. Generally speaking, it has to be replicated across all nodes in the database, which means that any reads occurring during that time could be inconsistent.

## :green_circle: NoSQL Advantages

- High Write Performance
- High Read Performance
- Easy Horizontal Sharding
- Easy Schema Updates
- More Reliable, and Predictable, Performance

## :green_circle: Look for tradeoffs, not benefits

Features such as relational integrity and data consistency are a problem that software engineers often underestimate. It is easy to maintain data consistency in the happy path of your application, but the edge cases and failure cases are where you really get in trouble.

At Simple Thread we often like to say that your application will get rewritten, but your data is forever. Keeping your data consistent, well structured, and clean is a huge task. Doing whatever you can to make that easier is often a worthwhile investment.
