Ark.DelegateConstraint
==================

# Summary #
Ark.DelegateConstraint is a NuGet package that allows constraining generic type parameters to the Delegate type. (Like `class MyClass<T> where T : Delegate { }`)

# Description #
This package ultimately lets you constrain generic type parameters to the `System.Delegate` type. Just replace the problematic constraints and types with the `Ark.IDelegate` stubs which are wiped away without a trace after the assembly is compiled.

If you try to write `class MyClass<T> where T : Delegate { }` the C# compiler won't let you.

Install this package and replace that code with `class MyClass<T> where T : Ark.IDelegate { }`.

If you need to refer to a concrete delegate-constrained class in the same library then instead of `MyClass<Action>` you'd need to write `MyClass<Ark.IDelegate<Action>>` so that the code compiles. Don't worry - all these stubs are removed from the resulting assembly.
