# Chapter 3 · Functions

Source: *Clean Code: A Handbook of Agile Software Craftsmanship*, Robert C. Martin.

## Small!

The first rule of function is that they `should be small`. The second rule of functions is that *they should be smaller than that*. :warning:**Functions should hardly ever be 20 lines long**:warning:.

### Blocks and Indenting

Makes the functions easier to read and understand.

## Do One Thing

- *FUNCTIONS SHOULD DO ONE THING*
- *THEY SHOULD DO IT WELL*
- *THEY SHOULD DO IT ONLY*

So, another way to know that a function is doing more than "one thing" is if you can extract another function from it with a name that is not merely a restatement of its implementation.

### Sections within Functions
Functions that do one thing cannot be reasonably divide into sections

- Declarations
- Initializations
- Sieve

## One Level of Abstraction per Function

Mixing levels of abstraction within a function is always confusing.

## Switch Statements
It's hard to make a small switch statement.

Any bad Switch:
- Salaries Employee case. Solution: _ABSTRACT FACTORY_ (See example for more).

## Use Descriptive Names

:warning:**Don't be afraid to make a name long**:warning:. A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment.

**Don't be afraid to spend time choosing a name**.

## Function Arguments

The ideal number of arguments for a function is :warning:**zero**:warning:. Next comes **one**, followed closely by **two**. **Three** arguments should be avoided where possible. **More** than three requires very special justification - and then shouldn't be used anyway.

:warning: *Arguments are hard*.

- The argument is at a different level of abstraction than the function name and forces you to know a detail ...
- Imagine the difficulty of writing all the test cases to ensure that all the various combinations of arguments work properly.
- ...

:warning: *Output arguments are harder to understand that input arguments*.

### Common Monadic Forms
There are two very common reasons to pass a single argument into a function:

- Asking a question about that argument.
  <details>
  
  ```java
    boolean fileExist("myFile")
  ```
  </details>
- You may be operating on that argument, transforming it into something else and _returning it_.
  <details>
  
  ```java
    InputStream fileOpen("MyFile");
  ```
  </details>
- There is an input argument but no output argument. Use this form with care. It should be very clear to the reader that this is an event. Choose names and contexts carefully.
  <details>
  
  ```java
    void passwordAttemptFailedNtimes(int attempts);
  ```
  </details>
- Using an output argument instead of a return value for a transformation is confusing.
  <details>
    <summary>View example</summary>

    ❌ **Don't do this**  
    ```java
      void transform(StringBuffer out);
    ```

    ✅ **Do this**  
    ```java
      StringBuffer transform(StringBuffer in);
    ```
  </details>

### Flag Arguments

Flag arguments are ugly. Passing a boolean into a function is a truly terrible practice. 

<details>

❌ **Don't do this**  
```java
  render(boolean isSuite);
  render(true): // call
```

✅ **Do this**  
```java
  renderForSuite();
  renderForSingleTest();
```
</details>

### Dyadic Functions

A function with two arguments is harder to understand than a monadic function.

<details>

  ❌ **Don't do this**  
  ```java
    writeField(output-Stream, name);
  ```

  ✅ **Do this**  
  ```java
    writeField(name);
  ```
</details>

The parts we ignore are where the bugs will hide.

### Triads

Functions that take three arguments are significantly harder to understand than dyads.

### Argument Objects

<details>

❌ **Don't do this**  
```java
  Circle makeCircle(double x, double y, double radius);
```

✅ **Do this**  
```java
    Circle makeCircle(Point center, double radius);
```
</details>

### Argument Lists

```java
  // definition
  public String format(String format, Object... args)

  // call
  String.format("%s worked %.2f hours.", name, hours);

  // Examples:
  void monad(Integer... args);
  void dyad(String name, Integer... args);
  void triad(String name, int count, Integer... args);
```

### Verbs and Keywords

In the case of a monad, the function and argument should form a very nice verb/noun pair.
```Java
write(name);
or
writeField(name); // if name if "field"
```

❌ **Don't do this**  
```java
  assertExpectedEqualsActual(expected, actual);
```

✅ **Do this**  
```java
  assertEquals(expected, actual);
```

## Have No Side Effects

Side effects are lies.

- Your function promises to do one thing, but it also does other _hidden_ things.
  <details>
  
  ```java
    public class UserValidator {
      private Cryptographer cryptographer;

      public boolean checkPassword(String userName, String password) {        
        User user = UserGateway.findByName(userName);        
        if (user != User.NULL) {          
          String codedPhrase = user.          
          getPhraseEncodedByPassword();          
          String phrase = cryptographer.decrypt(codedPhrase, password);          
          if ("Valid Password".equals(phrase)) {            
            Session.initialize(); // <------------------------- side effect !!!!       
            return true;         
          }        
        }        
        return false;      
      }
    }
  ```
  </details>

rename the function _checkPasswordAndInitializeSession_, though that certainly violates "Do one thing".

### Output arguments

Arguments are `most naturally interpreted as inputs` to a function. For example:

```java
appendFooter(s);
```

- Does this function append s as the footer to something?
- Or does it append some footer to s?
- Is s an input or an output?

```java
// signature
public void appendFooter(StringBuffer report);
```

it would be better for appendFooter to be invoked as
```Java
report.appendFooter();
```
## Command Query Separation
Functions should either `do something` or `answer something`, but NOT both.

<details>

❌ **Don't do this**  
```java
public boolean set(String attribute, String value);

  // if (set("username", "unclebob")) ...
```

✅ **Do this**  (separate)
```java
  if(attributeExists("username")) {
    setAttribute("username", "unclebob");
  }
```
</details>

## Prefer Exceptions to Returning Error
When you `return an error code`, you create `the problem that the caller` must deal with the error immediately.

<details>

❌ **Don't do this**  
```java
if (deletePage(page) == E_OK) {
  if (registry.deleteReference(page.name) == E_OK) {
    if (configKeys.deleteKey(page.name.makeKey()) == E_OK) {
      logger.log("page deleted");
    } else {
      logger.log("configKey not deleted");
    }
  } else {
    logger.log("deleteReference from registry failed");
  }
}
else {
  logger.log("delete failed");
  return E_ERROR;
}
```
</details>

If you `use exceptions` instead of returned error codes, then the error processing code can be separated from the happy path code and can be simplified:

<details>

✅ **Do this**
```java
try {
  deletePage(page);
  registry.deleteReference(page.name);
  configKeys.deleteKey(page.name.makeKey());
}
catch (Exception e) {
  logger.log(e.getMessage());
}
```
</details>

### Extract Try/Catch Blocks

Try/catch blocks `are ugly` in their own right... So it is better to extract the bodies of the try and catch blocks out into functions of their own.

<details>

```java
public void delete(Page page) {
  try {
    deletePageAndAllReferences(page)
  }
  catch (Exception e) {
      logError(e);
  }
}

private void deletePageAndAllReferences(Page page) throws Exception {  
  deletePage(page);
  registry.deleteReference(page.name);
  configKeys.deleteKey(page.name.makeKey());
}

private void logError(Exception e) {
  logger.log(e.getMessage());
}
```
</details>

### Error Handling Is One Thing

Functions should do one thing. Error handling is one thing.

### The Error .java Dependency Magnet

Returning error codes usually implies that there is some class or enum in which all the error codes are defined.

```java
public enum Error {
  OK,
  INVALID,
  NO_SUCH,
  LOCKED,
  OUT_OF_RESOURCES,
  WAITING_FOR_EVENT
}
```

## Structured Programming

Some programmers follow Edsger Dijkstra's rules of structured programming.

*Dijkstra said that every function, and every block within a function, should have one entry and one exit*.

❌ **Don't do this**  
1) be one return statement in a functions
2) no break or continue statements in a loop
3) never, ever, any goto statements.

Goto only makes sense in large functions, so it should be avoided.

## How Do You Write Functions Like This?

Writing software is like any other kind of writing.
