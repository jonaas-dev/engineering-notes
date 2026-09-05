# Chapter 4 · Comments

## Comments Do Not Make Up for Bad Code

One of the more common motivations for writing comments is bad code.

## Explain Yourself in Code

```Java
  // Check to see if the employee is eligible for full benefits
  if((employee.flags & HOURLY_FLAG) && (employee.age > 65)) {
    // ...
  }
```

```Java
  if(employee.isEligibleForFullBenefits()) {
    // ...
  }
```

## Good Comments

### Legal Comments

... for legal reasons. For example, copyright and authorship statements are necessary and reasonable things to put into a comment at the start of each source file.

```Java
// Copyright (C) 2003, 2004, 2055 by Object Mentor, Inc. All rights reserved.

// Released under the terms of the GNU General Public License version 2 or later.
```

### Informative Comments

```Java
  // format matched kk:mm:ss EEE, MMM dd, yyyy
  Pattern timeMatcher = Pattern.compile("\\d*:d*:\\d* \\w*, \\w* \\d*, \\d*");
```

### Explanation of Intent

We see an interesting decision documented by a comment.

You might not agree with the programmer's solution tot the problem, but at least you know what he was trying to do.

### Clarification

There is a substantial risk, of course, that a clarifying comment is incorrect. Go through the previous example and see how difficult it is to verify that they are correct.

```Java
  assertTrue(b.compareTo(a) == 1); // b > a
```

### Warning of Consequences

Sometimes it is useful to warn other programmers about certain consequences.

### TODO Comments

TODOs are jobs that the programmer thinks should be done, but for some reason can't do at the moment.

Whatever else a TODO might be, it is not an excuse to leave bad code in the system.

### Amplification

A comment may be used to amplify the importance of something that may otherwise seem inconsequential.

### Javadocs in Public APIs

There is nothing quite so helpful and satisfying as a well-described public API.

## Bad Comments

### Mumbling (murmuraciones)

// TODO

### Redundant Comments

```Java
  // Utility method that returns when this.closed is true. Throws an exception
  // if the timeout is reached.
  public synchronized void waitForClose(final long timeoutMillis) throws Exception {
    // ...
  }
```

### Misleading Comments (engañoso)

// TODO

### Mandated Comments

For example, required javadocs for every function lead to abominations such. This clutter adds nothing and serves only to obfuscate the code and create the potential for lies and misdirection.

```Java
  /**
  * @param title The title of the CD
  * @param author The author of the CD
  */
  public void addCD(String title, String author)
  {
    // ...
  }
```

### Journal Comments

Sometimes people add a comment to the start of a module every time they edit it.

```Java
  /**
  * Changes (from 11-Oct-2000)
  * -------------------------
  * 11-Oct-2000 : comment
  * 05-Nov-2001 : another comment
  * ...
  */
```

### Noise Comments

Sometimes you see comments that are nothing but noise.

```Java
  /**
  * Default constructor.
  */
  protected AnnualDateRule() {
    // ...
  }
```

### Scary Noise

```Java
  /** The name. */
  private String name;

  /** The version. */
  private String version;

  /** The licenceName. */
  private String licenceName;
```

### Don’t Use a Comment When You Can Use a Function or a Variable

```Java
// does the module from the global list <mod> depende on the
// subsystem we are part of?
if(smodule.getDependSubsystems().contains(subSysMod.getSubSystem()))
```

```Java
ArrayList moduleDependees = smodule.getDependSubsystems();
String ourSubSystem = subSysMod.getSubSystem();
if(moduleDependees.contains(ourSubSystem)) {
  // ...
}
```

### Position Markers

Sometimes programmers like to mark a particular position in a source file.

```Java
 // Actions /////////////////////////////////////////
```

### Closing Brace Comments

Sometimes programmers will put special comments on closing braces.

```Java
  while(...){
    if(...) {
      // ...
    } // if
  } // while

```

### Attributions and Bylines

```Java
  /* Added by Jonas */
```

Again, the source code control system is a better place for this kind of Information.

### Commented-Out Code

Few practices are as odious as commenting-out code. Don't do this!

```Java
  this.cut();
  // this.paste();
  write(this);
```

### HTML Comments

// TODO

### Nonlocal Information

```Java
  // Port on which fitnesse would run. Defaults to 8082.
  // ...
```

### Too Much Information

Don't put interesting historical discussions or irrelevant descriptions of details into your comments.

### Inobvious Connection

The connection between a comment and the code it describes should be obvious.

### Function Headers

// TODO

### Javadocs in Nonpublic Code

// TODO

### Example

// TODO

## Bibliography
