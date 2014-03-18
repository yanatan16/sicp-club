# Chapter 4

Finally, we reach the climax of the book: writing a Scheme Interpreter. I suggest starting from the metacircular evaluator given on the book's [website](http://mitpress.mit.edu/sicp/code/index.html), which I've renamed to [`mceval-base.scm`](https://github.com/yanatan16/sicp-club/blob/master/ch4/mceval-base.scm).

## 4.1 Metacircular Evaluator

This section details each part of the evaluator. The fun of these exercises is extending the evaluator. Starting from the base evaluator (`mceval-base.scm`), pick a few of the mentioned exercises and implement them.

#### Exercise 4.3 Rewrite eval to use data-directed style of 2.5
#### Exercise 4.4-4.9 Install various extensions to builtin procedures (4.6 ~ let is the best methinks)

#### Custom Exercise: Variadic Arguments

Our lambda doesn't handle variadic arguments. Add that.

```
(define (some-proc . args)
  (display args))
```

becomes

```
(define some-proc (lambda args (display args)))
```

Make `make-lambda` and `apply` handle these cases.

#### Custom Exercise: Macros

In the book, it talks about `cond` and `let` as _derived procedures_, that is, they are special forms (not normal procedures) that simply reduce to other, more primitive, special forms. In the same way as Exercise 4.3, we can create a data-directed dispatcher for derived procedures, or macros. Create `macro` as a corallary to `lambda` for macros (and `defmacro` in for `define`). Each macro should take a single argument of the expressions or clauses it is called from. For example, `(let ((a b)) a)` would be the argument to the macro `let`.

#### Custom Exercise: Frames as tables

Instead of using lookup lists, redefine frames as tables of variables so lookup and setting is faster.