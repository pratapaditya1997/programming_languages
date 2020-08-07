1. Purity
pure functions are very simple. They only operate on their input parameters.
Most useful pure functions must take at least one parameter.
All useful pure functions must return something.
Pure functions will always produce the same output given the same inputs.
Pure functions have no side effects.
Since programs have to interface to the real world, some parts of every program must be impure. The goal is to minimize the amount of impure code and segregate it from the rest of our program.

2. Immutability
once a variable 'x' takes on a value, it's that value for life. Usually these are local variables so its life is short. But while it's alive, it can never change.
One question is - how will we work without variables? There are 2 general cases when we want to modify variables - multi valued changes (eg. changing a single value of an object or record) and single valued changes (eg. loop counters)
FP deals with changes to values in a record by making a copy of the record with the values changed. Obvio, it does this efficiently without having to copy all parts of the record by using data structures that makes this possible. Same for single-valued change, by making a copy of it.
FP uses recursion to do looping.
One obvious benefit is that if you have access to a valuue in your program, you only have read access, which means that no one else can change that value. Even you, so no accidental mutations. Also, if the program is multi-threaded, then no other thread can pull the rug out from under you. That value is constant and if another thread wants to change it, it'll have to create a new value from the old one.

3. Higher-Order Functions
In FP, a function is a first class citizen of the language. In other words, a function is just another value.
Since functions are just values, we can pass them as parameters.
Higher-order function either take functions as parameters, returns functions or both.

4. Closures
`function grandParent(g1,g2) {
    var g3 = 3;
    return function parent(p1,p2) {
        var p3 = 33;
        return function child(c1,c2) {
            var c3 = 333;
            return g1+g2+g3+p1+p2+p3+c1+c2+c3;
        };
    };
}`
In this example, child has access to its variables, the parent's variables and grandparent's variables. The parent has access to its variables and grandParent's variables. The grandParent only has access to its variables.
Using them,
`var parentFunc = grandParent(1,2); //returns parent()
 var childFunc = parentFunc(11,22); // returns child()
 console.log(childFunc(111,222)); // prints 738`
here, parentFunc keeps the parent's scope alive since grandParent returns parent and childFunc keeps the child's scope alive since ParentFunc returns child.
When a function is created, all of the variables in its scope **at the time of creation** are accessible to it for the lifetime of the function. 
A closure is a function's scope that's kept alive by a reference to that function. and this is possible and better used when immutability is also guaranteed.

5. Function Composition
composition is a higher order function which takes two functions, f and g, of compatible types and returns another function - the function which is computed by first applying the g to a value and then applying f to the result.
`fun compose (f,g) x = f(g(x))`
there is `o` operator in SML/NJ to do the same thing.
`(f o g) x`

6. Currying
currying is the process of taking the function of multiple arguments and converting it into a series of functions that each take a single argument and return a function of a single argument, or in the case of the final function, return the actual result.
The advantage of currying is that we can bind one argument and leave the remaining arguments free.
Parameter order is important to fully leverage currying.
such functions are called curried functions and named after Haskell B. Curry
In SML syntax,
`fun f x y = expression`
defines a function f (of x) that returns a function (of y)





