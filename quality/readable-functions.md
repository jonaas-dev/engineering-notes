# Readable Functions: Minimize State

Source: <https://www.entropywins.wtf/blog/2018/10/24/readable-functions-minimize-state/>

The power of the `functional paradigm` does not come from new functionality, it comes from restricting something we are all familiar with: mutable state. By minimizing or altogether avoiding mutable state, functional programs skip a great source of complexity, thus becoming easier to understand and work with.

### MINIMIZE MUTABILITY

See:
```php
function getThing() {
    var $thing = 'default';
    
    if (someCondition()) {
        $thing = 'special case';
    }
    
    return $thing;
}
```
This mental overhead can easily be avoided by using what is called a Guard Clause:

```php
function getThing() {
    if (someCondition()) {
        return 'special case';
    }
    
    return 'default';
}
```
This code snippet is easier to understand because there is no state. The less state, the less things you need to remember while simulating the function in your head.

### MINIMIZE SCOPE

What is the return value of this function?
```php
function getThing() {
    $foo = 1;
    $bar = 2;
    $baz = 3;

    $meh = $foo + $baz * 2;
    $baz = square($meh);

    print($baz);
    return $bar;
}
```

It is a lot easier to tell what the return value is when refactored as follows:
```php
function getThing() {
    $foo = 1;
    $baz = 3;

    $meh = $foo + $baz * 2;
    $baz = square($meh);
    print($baz);

    $bar = 2;
    return $bar;
}
```

## :warning: Readable Functions: Guard Clause
Source: <https://www.entropywins.wtf/blog/2019/01/14/readable-functions-guard-clause/>
The simplification removes ALL the state in the function, including the nasty and completely not needed mutation in the first form of the code. You can read the new code sequentially, and the code after the Guard Clause is not polluted by extra complexity arising from the special case.

## :warning: Readable Functions: Do One Thing
Source: <https://www.entropywins.wtf/blog/2018/10/30/readable-functions-do-one-thing/>
### DO ONE THING
Often functions become less readable because they are doing multiple things. If your function Foo needs to do tasks A, B and C, then create a function for each of the tasks and call those from Foo.

### ONE LEVEL OF ABSTRACTION
Doing one thing includes dealing with a single level of abstraction.

See:
```php
function doThing() {
    if (condition) {
        low_level_write_api_call('write-mode', $this->somePath, 'Some error message');
    }
}
```
This makes it `harder to tell what the function is actually doing`, because details that don’t matter on the higher level of abstraction clutter the high level logic. These details should be in their own function.

```php
function doThing() {
    if (condition) {
        $this->log('Some error message');
    }
}

private function log(string $message) {
    low_level_write_api_call('write-mode', $this->somePath, $message);
}
```
