# The Fallacy of DRY

Source: <https://www.entropywins.wtf/blog/2017/09/06/the-fallacy-of-dry/>
DRY, standing for `Don’t Repeat Yourself`, is a well-known design principle in the software development world.

## THE GOAL OF SOFTWARE

First and foremost, software exists to fulfill a purpose. Your client, which can be your employer, is paying money because they want the software to provide value. As a developer it is your job to provide this value as effectively as possible. This includes tasks beyond writing code to do whatever your client specifies, and might best be done by not writing any code. The creation of code is expensive. Maintenance of code and extension of legacy code is even more so.

The DRY principle mainly situates itself in the latter category: reducing maintenance costs. Unfortunately applying DRY blindly often leads to increased maintenance costs.

## THE GOOD SIDE OF DRY

So how does DRY help us reduce maintenance costs? If code is duplicated, and it needs to be changed, you will need to find all places where it is duplicated and apply the change. This is (obviously) more difficult than modifying one place, and more error prone.

This is also known as `Shotgun Surgery`. Duplicated code tends to also obscure the structure and intent of your code, making it harder to understand and modify. And finally, it conveys a sense of carelessness and lack of responsibility, which begets more carelessness.

## THE FALLACY OF DRY`
Since removal of duplication is a means towards more maintainable code, we should only remove duplication if that removal makes the code more maintainable.

Hence trying to remove all duplication is likely to be counter productive.

### Cost of unification

The first cost is added `complexity`. If you have two classes with a little bit of common code, you can extract this common code into a service, or if you are a masochist extract it into a base class.

Still, if the only reason for the extraction is reducing duplication, ask yourself if you are reducing the overall complexity or adding to it.

Another cost is `coupling`. If you have two classes with some common code, they can be fully independent. If you extract the common code into a service, both classes will now depend upon this service. This means that if you make a change to the service, you will need to pay attention to both classes using the service, and make sure they do not break.`

The coupling increases the need for `communication`. This is especially true in the large, when talking about unifying code between components or application, and when different teams end up depending on the same shared code.

Another result of unification is that code can no longer `evolve separately`. If we have our two classes with some common code, and in the first a small behavior change is needed in this code, this change is easy to make. If you are dealing with a common service, you might do something such as adding a flag.

That might even be the best thing to do, though it is likely to be harmful design wise. Either way, you start down the path of `corrupting your service`, which now turned into a frog in a pot of water that is being heated.

You might be able to represent two `different concepts` with the same bit of code. This is problematic not only because different concepts need to be able to evolve individually, it’s also `misleading` to have only a single representation in the code, which effectively hides that you are dealing with two different concepts. This is another point that gains importance the bigger the scope of reuse. This is another point that gains importance the bigger the scope of reuse. Domain Driven Design has a strategic pattern called [Bounded Contexts](https://martinfowler.com/bliki/BoundedContext.html), which is about the separation of code that represents different (sub)domains. Generally speaking it is good to avoid sharing code between Bounded Contexts.

![BoundedContext](./img/bounded_context.png)

## CONCLUSION

Duplication itself does not matter. We care about code being easy (cheap) to modify without introducing regressions.

:movie_camera: [Ruby on Ales 2014 All The Little Things by Sandi Metz](https://www.youtube.com/watch?v=x1wnI0AxpEU) (TODO)
