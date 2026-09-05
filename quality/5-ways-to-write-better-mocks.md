# 5 Ways to write better mocks

Source: <https://www.entropywins.wtf/blog/2016/05/13/5-ways-to-write-better-mocks/>

These will help you write tests that `break less`, are `easier to read`, are more `IDE friendly`, and are `easier to refactor`. 

The focus is on PHPUnit and PHP, yet most of the techniques used, and principles touched upon, are also applicable when using different languages and testing frameworks.

> I will use the following, more precise, terminology for the rest of the post:

- `Test Double`: General term for test code that stands in for production code
- `Stub`: A Test Double that does nothing except for returning hardcoded values
- `Fake`: A Test Double that has real behavior in it, though does not make any assertions
- `Spy`: A Test Double that records calls to its methods, though does not make assertions
- `Mock`: A Test Double that makes assertions

## 1. Reference classes using ::class
Nothing to say.

## 2. Don’t bind to method names when you don’t have to
I don't understand.

## 3. Don’t bind to call count when you don’t have to

If you are not intentionally creating a Mock, then don’t make assertions about the call count. It’s easy to add the assertion in nearly all cases, yet it does not come for free.

Use `any` ore `once`.

## 4. Encapsulate your Test Double creation

```php
private function newThrowingRepository(): KittenRepository {
    $repository = $this->getMock( KittenRepository::class );

    $repository->expects( $this->once() )->method( $this->anything() )
        ->willThrowException( new RuntimeException() );

    return $repository;
}

// Now tools will stop complaining that you are giving a MockObject to code expecting a KittenRepository.
```
This extraction has two additional benefits. Firstly, `you hide the details of Test Double construction from your actual test method`, which now no longer knows about the mocking framework. Secondly, `your test method becomes more readable`, as it is no longer polluted by details on the wrong level of abstraction.`

## 5. Create your own Test Doubles

While often it’s great to use the PHPUnit Test Double API, there are plenty of cases where creating your own Test Doubles yields significant advantages.
