# Chapter 2 · Meaningful Names

Source: *Clean Code: A Handbook of Agile Software Craftsmanship*, Robert C. Martin.

## Use Intention-Revealing Names

The name of a variable, function, or class, should answer all the big questions. It should tell you **why it exists**, **what it does**, and **how it is used**.

:warning: **If name requires a comment, then the name does not reveal its intent** :warning:.

<details>
  <summary>View example</summary>
  
  ❌ **Don't do this**
  ```java
    int d; // elapsed time in days
  ```
  
  ✅ **Do this**  
  
  ```java
    int elapsedTimeInDays;

    // or
    int daysSinceCreation;
    int daysSinceModification;
    int fileAgeInDays;
  ```
</details>

\
:gem: What is the purpose of this code ?

<details>
  <summary>View example</summary>

  ```java
  public List<int[]> getThem() {
    List<int[]> list1 = new ArrayList<int[]>();
    for (int[] x : theList)
      if (x[0] == 4)
        list1.add(x);
    return list1;
  }
  ```

  1) What kinds of thing are in theList?
  2) What is thee significance of the zeroth subscript of an item in theList?
  3) What is the significance of the value 4?
  4) How would I use the list being returned?

  5 days later ...

  ```java
  public List<int[]> getFlaggedCells() {
    List<int[]> flaggedCells = new ArrayList<int[]>();
    for (int[] cell : gameBoard)
      if (cell[STATUS_VALUE] == FLAGGED)
        flaggedCells.add(cell);
    return flaggedCells;
  }
  ```

  Another version ...

  ```java
  public List<Cell> getFlaggedCells() {
    List<Cell> flaggedCells = new ArrayList<Cell>();
    for (Cell cell : gameBoard)
      if (cell.isFlagged())
        flaggedCells.add(cell);
    return flaggedCells;
  }
  ```
  **THIS IS THE POWER OF CHOOSING GOOD NAMES!**

</details>

## Avoid Disinformation

Programmers must avoid leaving false clues that obscure the meaning of code.

Example:
- Use reserved words.
- add "list" to a variable. *accountsList* but a variable is not actually a *List*.
- Using inconsistent spellings is *disinformation*.
- Use lower-case l / 1 or uppercase O / 0 ...

## Make Meaningful Distinctions

Example:
- Creating `variable named klass` just because the name *class* was used for something else.
- `Number-series naming` (a1, a2, .. aN).
  <details>
    <summary>View example</summary>
    
    ❌ **Don't do this**  
    ```java
      public static void copyChars(char a1[], char a2[]) {
        for (int i = 0; i < a1.length; i++) {
          a2[i] = a1[i];
        }
      }
    ```
    
    ✅ **Do this**  
    ```java
      public static void copyChars(char source[], char destination[]) {
        for (int i = 0; i < source.length; i++) {
          destination[i] = source[i];
        }
      }
    ```
  </details>
- Noise words.
  <details>
    <summary>View example</summary>

    ❌ **Don't do this**  
    ```java
      Customer customerInfo;
      String theMessage;
      Account accountData;
      Car carObject;
    ```

    ✅ **Do this**  
    ```java
      Customer customer;
      String message;
      Account account;
      Car car;
    ```
  </details>

## Use Pronounceable Names
If you can't pronounce it, you can't discuss it without **sounding like an idiot**.
This matters because programming is a social activity.

## Use Searchable Names

**Single-letter** names and **numeric constants** have a particular problem in that they are :warning:**not easy to locate**:warning: across a body of text.

Examples:\
NUMBER_OF_TASKS\
WORK_DAYS_PER_WEEK

## Avoid Encodings

It hardly seems reasonable to require each new employee to learn yet another encoding "language" in addition to learning the (usually considerable) body of code that they'll be working in.

### Hungarian Notation

Nowadays HN and other forms of type encoding are simply impediments. They make it harder to change the name or type of a variable, function, or class ([Hungarian Notation](https://es.wikipedia.org/wiki/Notaci%C3%B3n_h%C3%BAngara)).

### Member Prefixes

You don't need them. Eventually the prefixes become unseen clutter and a marker of older code.

<details>

  <summary>View example</summary>

  ❌ **Don't do this**  
  ```java
    m_dsc = name;
  ```

  ✅ **Do this**  
  ```java
    this.description = name;
  ```
</details>

### Interfaces and Implementations

<details>
  <summary>View example</summary>

  ❌ **Don't do this**  
  ```java
  IShapeFactory
  CShapeFactory
  ```

  ✅ **Do this**  
  ```java
  ShapeFactory
  ShapeFactoryImp
  ```

</details>

## Avoid Mental Mapping

One difference between a smart programmer and a professional programmer is that the professional understands that **clarity is king**. Professionals use their powers for good and write code that others can understand.

Certainly a loop counter may be named *i* or *j* or *k* (though never *l*!) if its scope is very small and no other names can conflict with it.

## Class Names

A class name should **not be a verb**.

## Method Names

Methods should have **verb or verb phrase** names.

```java
postPayment()
deletePage()
save()
```

When constructors are overloaded, use static factory methods with names that describe the arguments.

<details>
  <summary>View example</summary>

  ❌ **Don't do this**  
  ```java
  Complex fulcrumPoint = new Complex(23.0);
  ```

  ✅ **Do this**  
  ```java
  Complex fulcrumPoint = Complex.FromRealNumber(23.0);
  ```
  Consider enforcing their use by making the corresponding **constructors private**.
</details>

## Don't Be Cute

Jokes ...

<details>
  <summary>View example</summary>

  ❌ **Don't do this**  
  ```java
  whack() // to mean kill()
  eatMyShorts() // to mean abort()
  ```

  ✅ **Do this**  
  ```java
  kill()
  abort()
  ```
</details>

:warning: *Say what you mean. Mean what you say.* :warning:

## Pick One Word per Concept

It's confusing to have *fetch*, *retrieve*, and *get* as equivalent methods of different classes. **How do you remember which**?

A consistent lexicon is a great boon to the programmers who must use your code.

## Don't Pun

Avoid using the same word for two purposes.\
Using the same term for two different ideas is essentially a pun.

## Use Solution Domain Names

The name *AccountVisitor* means a great deal to a programmer who is familiar with the VISITOR pattern.  

## Use Problem Domain Names
...

## Add Meaningful Context

The function name provides only part of the context; the algorithm provides the rest.

## Don't Add Gratuitous Context

In an imaginary application called "Gas Station Deluxe" ...

<details>
  <summary>View example</summary>

  ❌ **Don't do this**  
  ```java
  GSDAccountAddress
  MailingAddress
  ```
  
  ✅ **Do this**  
  ```java
  Address
  // Address is a fine name for a class.
  ```
</details>

## Final Words
...
