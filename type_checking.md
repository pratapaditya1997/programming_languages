## Type Checking
The process of verifying and enforcing the constraints of types is called type checking. Checking may occur either at compile time (**static check**) or at runtime (**dynamic check**). Type checking is all about ensuring that the program is type-safe, minimizing the possibility of type errors.
If a language specification requires its typing rules strongly (ie. more or less allowing only those automatic type conversions that do not lose information) that is called **strongly** typed, if not, as **weakly** typed.

## Statically typed languages
A language is statically typed if the type of variable is known as compile time instead of run-time. eg java, c++, c, pascal and scala. In statically typed languages, once a variable is declared with a type, it cannot ever be assigned to some other variable of different type and doing so will raise a type error at compile time. statically typed languages require you to declare the data types of your variables before you use them.
### Advantages
A large classes of errors are caught in the early stages of development process.
Static typing usually results in compiled code that executes more quickly because when the compiler knows the exact data types that are in use, it can produce optimized machine code (ie. faster and using less memory)

## Dynamically typed languages
A language is dynamically typed if the type of variable is checked during run-time.eg javascript, PHP, python, ruby, lisp etc. In dynamically typed languages, variables are bound to objects at run time by means of assignment statements, and it is possible to bind the same variables to objects of different types during the execution of the program. 
This results in less optimized code than static type checking. It also includes the possibility of run time type errors and forces run time checks to occur for every execution of the program (instead of just at compile time).
### Advantages
Implementations of dynamically type-checked languages generally associate each run time object with a type tag containing its type information. This run time type information (RTTI) can also be used to implement dynamic dispatch, late binding, down-casting, reflection and similar features.
The absence of a separate compilation step means that you don't have to wait for compiler to finish before you can test your code changes. This makes the debug cycle much shorter and less cumbersome.

## Strongly typed languages
A strongly typed language is one in which variables are bound to specific data types, and will result in type errors if types do not match up as expected in the expression - regardless of when type checking occurs. eg Python is strongly-typed and so is Java.

## Weakly typed languages
A weakly typed language is one in which variables are not bound to a specific data type, they still have a type, but type safety constraints are lower compared to strongly-typed languages. eg PHP is weakly typed and so is C
