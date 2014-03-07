# Chapter 3

Chapters 1 and 2 were about building blocks: types, procedures, and complex uses of lists. Chapter 3 focuses on how we use those building blocks to build complex systems. We focus on two prominant models. The first, you will all be utterly familiar with, the _object_-based approach, as it is available in all types of programming languages and used prominantly in some. The second is the _stream_-based approach, where we view inputs streaming through modification operations and being output much like signals through an electrical system.

## 3.1 Assignment and State

3.1.1 shows how to create "objects" by combining `lambda`, `set!` and `dispatch` methods. Note how similar the bank account example is to creating a fully scoped javascript object using Crockford's style (i.e. `function createMyObject() { var internal; return { method: ... }; }`.

#### Exercise 3.2 - Call-counter

This pattern is so useful! Try creating a version that display the call to `stdout`.

3.1.2 shows why `set!` is useful, for example a `rand` function.

3.1.3 talks about the _costs_ of introducing assignment. Essentially a diatribe against imperative programming. It makes some good points:

- loss of referential transparency - i.e. we can't determine if two things are equal by reference
- differences in equality and sameness
- bugs caused by ordering of assignment

> In general, programming with assignment forces us to carefully consider the relative orders of the assignments to make sure that each statement is using the correct version of the variables that have been changed. This issue simply does not arise in functional programs.

## 3.2 Environment model

This is the beginning of creating an interpreter. Pay attention. We deepen our understanding of the model to evaluate procedures (from the interpreter's point of view) in view of the introduction of the `set!` procedure.

No exercise in this section because its mostly examples after the lecture of 3.2.1.

## 3.3 Mutable Data

Expanding `set!` to advanced data structures. With `set-car!` and `set-cdr!`, we see familiar ideas of sameness and equality popping up. The are no matter just using the functional `car` and `cdr`, but when using imparative methods, we have to worry about which pairs belong to which data structures. See the exercises 3.15-3.19.

#### Exercise 3.16-3.17

These may be a bit basic for some, but its good practice to think through it.

3.3.2 Queues!

#### Exercise 3.23 A deque

This is a basic data structure, made more complicated by the rawness of the pair data structure. It took me an hour to build, so skip if low on time.

3.3.3 Tables (aka objects, hashes, dicts)

Pretty important stuff. Read over exercise 3.27, as its a pretty useful tool.

3.3.4+ is all examples. Good to read, but not of core importance.

## 3.4 Concurrency

I <3 concurrency. I could talk about it all day. 3.4.1 is an introduction into a common pitfall of concurrent systems. 3.4.2 is where the meat of the discussion starts, with a solution to the problem of concurrency: the serializer. By serializing, we control access to shared state. Note that this model is the common approach in Java.

## 3.5 Streams

Streams are an alternative to object oriented programming. By viewing our program as a pipeline to pass data through, we can avoid imperative paradigms that cause more problems than they are worth. Introduced here is delayed (lazy) evaluation, a powerful technique for evaluating data (heavily used in Haskell and clojure, and easily used in python as well).

#### Exercise 3.55 Partial Sums

Use streams to create `partial-sums`. Try defining it normally AND implicitly.

#### Exercise 3.62 Integrating Power Series

Anyone remember Taylor Series from Calculus? Like the annoying guy from Independence Day, its baaaack! I really like part (b).

#### Exercise 3.63 The importance of implicit definitions

Note how the first definition is more efficient because accessing already calculated elements is O(1) instead of O(n) in the version written in the exercise. If neither used `memo-proc`, they both would be as inefficient as each other.