# Freelancer Rates

Welcome to Freelancer Rates on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Numbers

Swift has 2 main types of numbers: integers and floating-point numbers.
[Integers][integers] are whole numbers, e.g. `0`, `1`, `-1`, `42`, and `-273`.
[Floating-point numbers][floatingpoint] are numbers with a fractional component, e.g. `0.0`, `3.14`, and `-1.36969e-10`.
Swift also allows using underscores to make numbers more readable, e.g. `1_000_000` is the same as `1000000`.
Floating-points can be written in either decimal or exponential notation.

In most cases you would define the type for integers as [`Int`][int] and for floating-point numbers as [`Double`][double].

To declare a variable or constant to be of type `Int` or `Double`, you can use a type annotation:

```swift
let speed: Int = 42                           // speed is an Int
let pi: Double = 3.14                         // pi is a Double
let giga: Double = 1_000_000_000              // giga is a Double
let plancksConstant : Double = 6.62607015e-34 // plancksConstant is a Double
```

## Arithmetic operators

~~~~exercism/caution
In Swift can't mix types in arithmetic operations, so you can't use any arithmetic operator on an `Int` with a `Double` or vice versa.
Thereby you have to do a type conversion first.
~~~~

Swift does have a set of [arithmetic operators][arithmetic-operators] that can be used to perform basic mathematical operations.
The `+` operator is used for addition, the `-` operator is used for subtraction, and the `*` operator is used for multiplication.

| Operator | Example                 |
| -------- | ----------------------- |
| `+`      | `4 + 6   // equals  10` |
| `-`      | `15 - 10 // equals  5`  |
| `*`      | `2 * 3   // equals  6`  |

### Division

The `/` operator is used for division.
When using a floating-point number, the result will be a floating-point number.
When using integers, the result will be an integer.

```swift
5 / 2.0 // equals 2.5
5 / 2   // equals 2
```

When dividing by zero, depending on the type of number, you will get a different result.
If you divide a floating-point number by zero, the result will be `inf`, or `-inf` if the number being divided is negative.
Only exception is when you divide zero by zero, and one of them being a floating point number which will result in `nan`.
If you divide an integer by zero, you will get a compile error.

```swift
print(5.0 / 0.0)  // Prints inf
print(-5.0 / 0.0) // Prints -inf
print(0.0 / 0.0)  // Prints nan

// The following code will not compile
print(5 / 0) // error: division by zero
```

### Remainder

The [`%` operator][reminder-operator] is used to get the remainder of a division and does only work with integers.
The operator returns the remainder of the division of the first argument by the second argument.
And as with division, having the second argument having the value of zero will result in a compile error.

~~~~exercism/note
In other languages, is this operator also known as the modulo operator.
But in Swift, it does not work the same way as the modulo operator, since it strictly speaking, returns the remainder, not the modulo.
~~~~

```swift
5 % 2  // equals 1
-5 % 2 // equals -1

// The following code will not compile
5 % 0 // error: division by zero
```

## Rounding numbers

Rounding numbers is done by using the `rounded()` method on a floating-point number.
To round to the nearest integer, you can use the `rounded()` method without any arguments.
To round up or down, you can use the `rounded(.up)` or `rounded(.down)` methods respectively.

```swift
let x = 3.14
let y = x.rounded()      // y equals 3.0
let w = x.rounded(.down) // w equals 3.0
let z = x.rounded(.up)   // z equals 4.0
```

## Type inference

Swift can [infer what type][typeinference] a number is based on the context, without extra context will the compiler assume that number is an `Int`.
If you want to tell the compiler that you want a whole number to be a `Double` you must use either a type annotation or append a `.0` onto the end of the number literal. E.g.

```swift
let x = 42         // x is an Int
let y = 42.0       // y is a Double
let z: Double = 42 // z is a Double
```

## Type Conversion

In Swift, to convert a value from one type to another, you need to do a [type Conversion][type-conversion].
For example, to convert an `Int` to a `Double` and vice versa, you would need to do the following:

```swift
let x = 42
let d = Double(x)
print(d)           // Prints 42.0
print(type(of: d)) // Prints Double

let pi = 3.14
let iPi = Int(pi)
print(iPi)           // Prints 3
print(type(of: iPi)) // Prints Int
```

[integers]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Integers
[floatingpoint]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Floating-Point-Numbers
[int]: https://developer.apple.com/documentation/swift/int
[double]: https://developer.apple.com/documentation/swift/double
[arithmetic-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Arithmetic-Operators
[reminder-operator]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Remainder-Operator
[typeinference]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Type-Safety-and-Type-Inference
[type-conversion]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Integer-and-Floating-Point-Conversion

## Instructions

In this exercise you will be writing code to help a freelancer communicate with their clients about the prices of certain projects. You will write a few utility functions to quickly calculate the costs for the clients.

## 1. Calculate the daily rate given an hourly rate

A client contacts the freelancer to enquire about their rates.
The freelancer explains that they **_work 8 hours a day._**
However, the freelancer knows only their hourly rates for the project.
Help them estimate a day rate given an hourly rate.

Implement the function `dailyRateFrom(hourlyRate:)`, that takes the argument `hourlyRate` which holds the freelancers hourly rate.  
The function should return the daily rate based on the hourly rate.

```swift
dailyRateFrom(hourlyRate: 60)
// Returns 480.0
```

The returned daily rate should be a `Double`.

## 2. Calculate the monthly rate, given an hourly rate and a discount

Sometimes, a client is interested in hiring the freelancer for a longer period of time.
The freelancer is willing to give a discount to the client, but only if the client hires them for at least a month.
There is in total  **_22 workdays_**.
Help the freelancer calculate their monthly rate given their hourly rate and the percentage discounted to the flat rate they are willing to give, rounded to the nearest whole number.

Implement the function `monthlyRateFrom(hourlyRate:withDiscount:)`, that takes the arguments `hourlyRate` which holds the freelancers hourly rate, and `withDiscount` which holds the discount the freelancer is willing to give to the client.
The function should return the monthly rate rounded to the nearest whole number.

```swift
monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5)
// Returns 12129
```

## 3. Calculate the number of workdays given a budget, hourly rate and discount

Another day, a project manager offers the freelancer to work on a project with a fixed budget.
Given the fixed budget and the freelancer's hourly rate, help them calculate the number of days they would work until the budget is exhausted.
Take into account that in this scenario the freelancer is always willing to give the discount regardless of the number of days hired.
The result _must_ be **rounded down** to the nearest whole number.

Implement the function `workdaysIn(budget:hourlyRate:withDiscount:)`, that takes the arguments:
- `budget` which holds the budget for the project.
- `hourlyRate` which holds the freelancers hourly rate.
- `withDiscount` which holds the discount the freelancer is willing to give to the client.

The function should return the number of workdays the freelancer will work on the project rounded down.

```swift
workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11.0)
// Returns 35.0
```

## Source

### Created by

- @wneumann
- @meatball133