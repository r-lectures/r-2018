---
layout: slide
title:  "YAML using types effectively"
transition: convex
theme: moon
---


# Using Types Effectively


# What does that mean?

The recent evolution of C++ is (from one point of view) largely about
**strengthening** and **expanding** the **capabilities for dealing with types**.

-   expansion of `type_traits`
-   `decltype` to utter types
-   `auto` to preserve types, prevent conversions, infer return types
-   `nullptr` to prevent `int` / pointer confusion
-   scoped `enum`
-   GSL: `owner<T>`, `not_null<T>`
-   Concepts TS

<div class="NOTES">
Some of the features added to modern C++ to deal with types.

Obviously someone thinks that types are important. And the ability to wrangle
them and mould them to our purposes is an important part of C++.

Types are the currency of metaprogramming, but also important for safety in
"regular" programming; hence we see things like the GSL's `owner<>` and `not_null<>`.

</div>


## FP isn't (only) about

-   first class functions
-   higher order functions
-   lexical scoping, closures
-   pattern matching
-   value semantics
-   immutability
-   concurrency through immutability
-   laziness
-   garbage collection
-   boxed data types / "inefficient" runtime models
-   the M-word

<div class="NOTES">
Functional languages can teach us a thing or two about types. (After all, they
seem to be teaching us everything else.)

Here are some things you may think of when functional programming is mentioned&#x2026;

</div>


## FP is (also, importantly) about

-   using types effectively and expressively
-   making illegal states unrepresentable
-   making illegal behaviour result in a type error
-   using total functions for easier to use, harder to misuse interfaces

<div class="NOTES">
These aspects of functional programming are often overlooked.

Many functional languages have well-developed, expressive type systems.

C++ is moving in that direction.

</div>


## What is a type?

-   A way for the compiler to know what opcodes to output (dmr's motivation)?
-   The way data is stored (representational)?
-   Characterised by what operations are possible (behavioural)?
-   Determines the values that can be assigned?
-   Determines the meaning of the data?


## What is a type?

![img](./int_bool_1.png)

"Only Lua would have '`1 == true`' evaluate to `false`. #wantmydayback"

![img](./int_bool_2.png)

"But, how can `1` be equal to `true`? `1` is an integer, and `true` is a boolean. Lua
seems to be correct here. It's your view of the world that has been warped."

(Smiley faces make criticism OK!)


## What is a type?

-   The set of values that can inhabit an expression
    -   may be finite or "infinite"
    -   characterized by cardinality
-   Expressions have types
    -   A program has a type


## Let's play a game

To help us get thinking about types.

I'll tell you a type.

You tell me how many values it has.

There are no tricks: if it seems obvious, it is!


## Level 1

Types as sets of values


## Level 1

How many values?

    bool;

2 (`true` and `false`)


## Level 1

How many values?

    char;

256


## Level 1

How many values?

    void;

0

    struct Foo { Foo() = delete; };

    struct Bar { template <typename T> Bar(); };

<div class="NOTES">
cf BASIC's function vs procedure

</div>


## Level 1

How many values?

    struct Foo {};

1


## Level 1

How many values?

    enum FireSwampDangers : int8_t {
      FLAME_SPURTS,
      LIGHTNING_SAND,
      ROUSES
    };

3

<div class="NOTES">
It is possible to put something into FireSwampDangers that fits
representationally (eg. the value 4). But that would be meaningless: there would
be no connection between the value represented and its interpretation. Because
there is no interpretation: cf. an unconstructed object.

</div>


## Level 1

How many values?

    template <typename T>
    struct Foo {
      T m_t;
    };

`Foo` has as many values as `T`


## End of Level 1

Algebraically, a type is the number of values that inhabit it.

These types are equivalent:

    bool;
    
    enum class InatorButtons {
      ON_OFF,
      SELF_DESTRUCT
    };

Let's move on to level 2.


## Level 2

Aggregating Types


## Level 2

How many values?

    std::pair<char, bool>;

256 \* 2 = 512


## Level 2

How many values?

    struct Foo {
      char a;
      bool b;
    };

256 \* 2 = 512


## Level 2

How many values?

    std::tuple<bool, bool, bool>;

2 \* 2 \* 2 = 8


## Level 2

How many values?

    template <typename T, typename U>
    struct Foo {
      T m_t;
      U m_u;
    };

(# of values in `T`) \* (# of values in `U`)


## End of Level 2

When two types are "concatenated" into one compound type, we <span class="underline">multiply</span> the # of
inhabitants of the components.

This kind of compounding gives us a <span class="underline">product type</span>.

On to Level 3.


## Level 3

Alternating Types


## Level 3

How many values?

    std::optional<char>;

256 + 1 = 257


## Level 3

How many values?

    std::variant<char, bool>;

256 + 2 = 258


## Level 3

How many values?

    template <typename T, typename U>
    struct Foo {
      std::variant<T, U>;
    }

(# of values in `T`) + (# of values in `U`)


## End of Level 3

When two types are "alternated" into one compound type, we <span class="underline">add</span> the # of
inhabitants of the components.

This kind of compounding gives us a <span class="underline">sum type</span>.


## Level 4

Function Types


## Level 4

How many values?

    bool f(bool);

4


## Level 4

Four possible values
 ![img](./function_bool.svg)


## Level 4

    bool f1(bool b) { return b; }
    bool f2(bool) { return true; }
    bool f3(bool) { return false; }
    bool f4(bool b) { return !b; }


## Level 4

How many values?

    char f(bool);

256 \* 256 = 65,536


## Level 4

How many values (for `f`)?

    enum class Foo
    {
      BAR,
      BAZ,
      QUUX
    };
    char f(Foo);

256 \* 256 \* 256 = 16,777,216


## Level 4

The number of values of a function is the number of different ways we can draw
arrows between the inputs and the outputs.
 ![img](./function.svg)


## Level 4

How many values?

    template <class T, class U>
    U f(T);

\(|U|^{|T|}\)


## End of Level 4

When we have a <span class="underline">function</span> from \(A\) to \(B\), we raise the # of inhabitants of
\(B\) to the power of the # of inhabitants of \(A\).


## End of Level 4 (corollary)

Hence a curried function is equivalent to its uncurried alternative.

\[\begin{align*}
F_{uncurried}::(A,B) \rightarrow C & \Leftrightarrow C^{A*B} \\
& = C^{B*A} \\
& = (C^B)^A \\
& \Leftrightarrow (B \rightarrow C)^A \\
& \Leftrightarrow F_{curried}::A \rightarrow (B \rightarrow C)
\end{align*}\]


## Victory!


## Equivalences

    template <typename T>
    struct Foo {
      std::variant<T, T> m_v;
    };
    
    template <typename T>
    struct Bar {
      T m_t;
      bool m_b;
    };

We have a choice over how to represent values. `std::variant` will quickly
become a very important tool for proper expression of states.

This is one reason why `std::variant`'s "never-empty" guarantee is important.

<div class="NOTES">
T + T = 2T.

But note that in `Bar`, we need to manually keep the two variables "in sync".

</div>


## Algebraic Datatypes

This is what it means to have an algebra of datatypes.

-   the ability to reason about equality of types
-   to find equivalent formulations
    -   more natural
    -   more easily understood
    -   more efficient
-   to identify mismatches between state spaces and the types used to implement
    them
-   to eliminate illegal states by making them inexpressible


## Making Illegal States Unrepresentable

`std::variant` is a game changer because it allows us to (more) properly express
types, so that (more) illegal states are unrepresentable.

![img](./variant-tweet.png)

<div class="NOTES">
C++'s type system is still not perfect by a long shot. But `std::variant` is an
amazing upgrade.

</div>


## Making Illegal States Unrepresentable

Let's look at some possible alternative data formulations, using sum types
(`variant`, `optional`) as well as product types (structs).


## Example: Connection State

    enum class ConnectionState {
      DISCONNECTED,
      CONNECTING,
      CONNECTED,
      CONNECTION_INTERRUPTED
    };
    
    struct Connection {
      ConnectionState m_connectionState;
    
      std::string m_serverAddress;
      ConnectionId m_id;
      std::chrono::system_clock::time_point m_connectedTime;
      std::chrono::milliseconds m_lastPingTime;
      Timer m_reconnectTimer;
    };

<div class="NOTES">
A very simple example of what a connection class might look like today.

Functions interacting with this class would typically use a switch statement
over the `ConnectionState`.

There are hidden invariants here that aren't enforced by the Connection type.

Some of the fields are dependent on the connection state (reconnect time, last
ping time). So it seems that some of these fields need sentinel values (eg
invalid connection id).

Worse, there is temptation to reuse fields for multiple states. Connected
timestamp is perhaps likely to get reused to mean the instant of connection and
the instant of disconnection.

</div>


## Example: Connection State

    struct Connection {
      std::string m_serverAddress;
    
      struct Disconnected {};
      struct Connecting {};
      struct Connected {
        ConnectionId m_id;
        std::chrono::system_clock::time_point m_connectedTime;
        std::optional<std::chrono::milliseconds> m_lastPingTime;
      };
      struct ConnectionInterrupted {
        std::chrono::system_clock::time_point m_disconnectedTime;
        Timer m_reconnectTimer;
      };
    
      std::variant<Disconnected,
    	       Connecting,
    	       Connected,
    	       ConnectionInterrupted> m_connection;
    };

<div class="NOTES">
With types structured correctly, it's not possible to express illegal states.

e.g. Ping time does not exist if we're not connected.

(There are still things that are common to all states, e.g. perhaps this class
represents connection to a specific server.)

A switch statement could still exist, switching on the `variant`'s `index()`, or
a visitor-based approach could be used.

</div>


## Example: Nullable field

    class Friend {
      std::string m_alias;
      bool m_aliasPopulated;
      ...
    };

These two fields need to be kept in sync everywhere.

<div class="NOTES">
Here, a field is populated from a remote source and happens lazily and/or
asynchronously. It is possible that the field never gets populated.

All the code that deals with this field has to ensure that both variables are
kept up to date in sync with each other.

</div>


## Example: Nullable field

    class Friend {
      std::optional<std::string> m_alias;
      ...
    };

`std::optional` provides a sentinel value that is outside the type.

<div class="NOTES">
`std::optional` captures the true state space of the variable. It is not
possible for two fields to get out of step now.

</div>


## Example: Monster AI

    enum class AggroState {
      IDLE,
      CHASING,
      FIGHTING
    };
    
    class MonsterAI {
      AggroState m_aggroState;
    
      float m_aggroRadius;
      PlayerId m_target;
      Timer m_chaseTimer;
    };

<div class="NOTES">
Once again, presumably PlayerId has some invalid sentinel value.

</div>


## Example: Monster AI

    class MonsterAI {
      struct Idle {
        float m_aggroRadius;
      };
      struct Chasing {
        PlayerId m_target;
        Timer m_chaseTimer;
      };
      struct Fighting {
        PlayerId m_target;
      };
    
      std::variant<Idle, Chasing, Fighting> m_aggroState;
    };

<div class="NOTES">
Now the variables are properly placed into the states that use them.

Chasing and Fighting states could inherit from an Aggroed state that holds a target.

</div>


## Example: Design Patterns

The addition of sum types to C++ offers an alternative formulation for some
design patterns.

State machines and expressions are naturally modelled with sum types.

<div class="NOTES">
Traditional runtime polymorphism approach can lead to bloated base class issue.

Type erasure is another way to go.

Sum types + visitor/pattern matching is a third possibility, particularly
natural for things like ASTs.

</div>


## Example: Design Patterns

-   Command
-   Composite
-   State
-   Interpreter

<div class="NOTES">
Command uses a flat, wide class hierarchy to encapsulate requests in objects.

Composite: model part-whole hierarchies with uniform interface.

State is obvious: simply replace the contained polymorphic object with a
variant.

Sum types are especially good for representing expressions (think JSON).

Interpreter tackles the expression problem: easy to add new classes (use
OO/interfaces) or new operations (use sum types/visitors)?

</div>


## Designing with Types

`std::variant` and `std::optional` are valuable tools that allow us to model the
state of our business logic more accurately.

When you match the types to the domain accurately, certain categories of tests
just disappear.

<div class="NOTES">
You don't have to test the edge cases where the representation can fall outside
your reality - because that can't happen.

</div>


## Designing with Types

Fitting types to their function more accurately makes code easier to understand
and removes pitfalls.

The bigger the codebase and the more vital the functionality, the more value
there is in correct representation with types.

<div class="NOTES">
When illegal states are unrepresentable, you don't have to worry about other
programmers misunderstanding the code, or misusing data. In a sense, they
*cannot* write something that is wrong.

And when I say "other programmers" of course I mean myself in 3 months&#x2026;

Questionably reusing fields, bending semantics, etc. These are bad practices.
But they happen when we're chasing a deadline.

</div>


## Using Types to Constrain Behaviour

We've seen how an expressive type system (with product and sum types) allows us
to model state more accurately.

"Phantom types" is one technique that helps us to model the *behaviour* of our
business logic in the type system. Illegal behaviour becomes a type error.


## Phantom Types: Before

    std::string GetFormData();
    
    std::string SanitizeFormData(const std::string&);
    
    void ExecuteQuery(const std::string&);

An injection bug waiting to happen.

<div class="NOTES">
Let's hope we don't meet little Bobby Tables, and that everywhere we execute a
query we remembered to sanitize the data provided by the user.

The type system is not helping us here. How can we use types to make sure that
we stay safe?

</div>


## Phantom Types: The setup

    template <typename T>
    struct FormData {
      explicit FormData(const string& input) : m_input(input) {}
      std::string m_input;
    };
    
    struct sanitized {};
    struct unsanitized {};

`T` is the "Phantom Type" here.

<div class="NOTES">
Note that the template argument is unused. It exists <span class="underline">only</span> for compile time
type checking. There is no runtime overhead.

</div>


## Phantom Types: After

    FormData<unsanitized> GetFormData();
    
    std::optional<FormData<sanitized>>
    SanitizeFormData(const FormData<unsanitized>&);
    
    void ExecuteQuery(const FormData<sanitized>&);

<div class="NOTES">
User input is born unsanitized.

It is impossible for us to execute unsanitized input. The compiler simply won't
compile it.

We've used types to help enforce the business logic.

This is something similar to a strong typedef, or what enum class effectively
does for integral types. This technique can also be used e.g. in a units
library.

</div>


## Total Functions

A *total function* is a function that is defined for all inputs in its domain.

`template <typename T>
const T& min(const T& a, const T& b);`

`float sqrt(float f);`

<div class="NOTES">
We are straying into the realm of Concepts here.

I'm not saying that total is the same thing as "no preconditions". The type must
satisfy the requirements on it. But you can see that with functions like `sqrt`
there is a clear mismatch between the type of the function and the actual type
of its domain.

</div>


## Let's play another game

To help us see how total functions with the right types can result in
unsurprising code.

I'll give you a function signature with no names attached.

You tell me what it's called&#x2026; (and you'll even know how to implement it).

The only rule&#x2026; it must be a *total* function.

<div class="NOTES">
Assume regular types. Assume that the function is doing something "interesting"
rather than "boring" when you have a choice. (ie. that it uses its argument).
But you needn't assume anything else.

And there are always ways to make things unexpected in C++. But assume nothing
surprising here.

</div>


## Name That Function

    template <typename T>
    T f(T);

`identity`

    int f(int);

<div class="NOTES">
Note the odd situation here: we know more about `f(T)` than we do about
`f(int)`.

</div>


## Name That Function

    template <typename T, typename U>
    T f(pair<T, U>);

`first`


## Name That Function

    template <typename T>
    T f(bool, T, T);

`select`


## Name That Function

    template <typename T, typename U>
    U f(function<U(T)>, T);

`apply` or `call`


## Name That Function

    template <typename T>
    vector<T> f(vector<T>);

`reverse`, `shuffle`, &#x2026;

<div class="NOTES">
For simplicity, I haven't written this signature in terms of iterators, but it
would be just the same.

</div>


## Name That Function

    template <typename T>
    T f(vector<T>);

Not possible! It's a partial function - the `vector` might be empty.

    T& vector<T>::front();


## Name That Function

    template <typename T>
    optional<T> f(vector<T>);


## Name That Function

    template <typename T, typename U>
    vector<U> f(function<U(T)>, vector<T>);

`transform`


## Name That Function

    template <typename T>
    vector<T> f(function<bool(T)>, vector<T>);

`remove_if`, `partition`, &#x2026;


## Name That Function

    template <typename T>
    T f(optional<T>);

Not possible!


## Name That Function

    template <typename K, typename V>
    V f(map<K, V>, K);

Not possible! (The key might not be in the `map`.)

    V& map<K, V>::operator[](const K&);


## Name That Function

    template <typename K, typename V>
    optional<V> f(map<K, V>, K);

`lookup`


## What Just Happened?

I gave you *almost nothing*.

No variable names. No function names. No type names.

Just bare type signatures.

You were able to tell me exactly what the functions should be called, and likely
knew instantly how to implement them.

You will note that partial functions gave us some issues&#x2026;

<div class="NOTES">
Naming is one of the hardest problems in Comp Sci. Getting the types right is
much easier. And if your types model the logic properly, perhaps you have
"self-documenting code"?

</div>


## Well-typed Functions

Writing *total functions* with well-typed signatures can tell us a lot about
functionality.

Using types appropriately makes interfaces unsurprising, safer to use and harder
to misuse.

Total functions make more test categories vanish.


## About Testing&#x2026;

In a previous talk, I talked about unit testing and in particular property-based testing.

Effectively using types can reduce test code.

Property-based tests say "for all values, this property is true".

That is exactly what types *are*: universal quantifications about what can be
done with data.

Types scale better than tests. Instead of TDD, maybe try TDD!

<div class="NOTES">
C++'s type system isn't yet powerful enough to be able to say goodbye to tests,
but it is powerful enough that used effectively, we can reduce some of the
drudgery of writing tests.

Any time you're thinking something is true for all values, that's what a type
can do.

</div>


## Further Down the Rabbit Hole

-   <http://en.wikipedia.org/wiki/Algebraic_data_type>
-   <http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/>
-   <https://vimeo.com/14313378> (Effective ML: Making Illegal States Unrepresentable)
-   <http://www.infoq.com/presentations/Types-Tests> (Types vs Tests: Strange Loop 2012)


## Thanks For Listening

"On the whole, I'm inclined to say that when in doubt, make a new type."

&#x2013; Martin Fowler, [*When to Make a Type*](http://martinfowler.com/ieeeSoftware/whenType.pdf)

"Don't set a flag; set the data."

&#x2013; Leo Brodie, *[Thinking Forth](http://thinking-forth.sourceforge.net/)*


## Goals for Well-typed Code

-   Make illegal states unrepresentable
-   Use `std::variant` and `std::optional` for formulations that
    -   are more natural
    -   fit the business logic state better
-   Use phantom types for safety
    -   Make illegal behaviour a compile error
-   Write total functions
    -   Unsurprising behaviour
    -   Easy to use, hard to misuse


## Epilogue

A taste of algebra with datatypes


## A Taste of Algebra with Datatypes

How many values?

    template <typename T>
    class vector<T>;

We can define a `vector<T>` recursively:

\({v(t)} = {1 + t v(t)}\)

(empty vector or (+) head element and (\*) tail vector)


## A Taste of Algebra with Datatypes

And rearrange&#x2026;

What does that mean? Subtracting and dividing types?


## A Taste of Algebra with Datatypes

When we don't know how to interpret something mathematical?


## A Taste of Algebra with Datatypes

Series expansion at \({t = 0}\):

\({1 + t + t^2 + t^3 + t^4 +{ }...}\)

A `vector<T>` can have:

-   0 elements (\({1}\))
-   or (+) 1 element (\({t}\))
-   or (+) 2 elements (\({t^2}\))
-   etc.


## Goals for Well-typed Code

-   Make illegal states unrepresentable
-   Use `std::variant` and `std::optional` for formulations that
    -   are more natural
    -   fit the business logic state better
-   Use phantom types for safety
    -   Make illegal behaviour a compile error
-   Write total functions
    -   Unsurprising behaviour
    -   Easy to use, hard to misuse

