# Wings Quest

Welcome to Wings Quest on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Swift has a type known as [`Bool`][bools], it is used to represent the values `true` and `false`.

## Logical operators

Swift has 3 [logical operators (`!`, `||`, `&&`)][logical-operators] which are used to combine Bools and make expressions that produce different values.

### And(`&&`)

The [_and_ operator][and] in Swift is represented by `&&` and returns `true` if both values given are `true` otherwise it returns `false`.
When using the _and_ operator, one Bool is placed on the right side of the `&&` and another one on the left side.

```Swift
true && true  // true
true && false // false
```

### Or(`||`)

The [_or_ operator][or] in Swift is represented by `||` and returns `true` if **at least one** of values given is `true`. If both of the values are `false` then it returns `false`.
When using the _or_ operator one bool should be placed on the right side of the `||` and another one on the left side.

```swift
true || true   // true
true || false  // true
false || false // false
```

### Not(`!`)

The [_not_ operator][not] in Swift is represented by `!` and returns `true` if the given Bool is `false`, and returns `false` if `true` is given.
When using the _not_ operator one Bool should be placed after the operator (`!`).

```swift
!true  // false
!false // true
```

## Using parentheses(`()`)

When working with booleans you can use [explicit parentheses][explicit-parentheses] to decide which Bools to evaluate first.
The result can differ depending on how the parentheses are used.
In Swift, what is in parentheses is evaluated first.

```swift
true && false && false || true   // true
true && false && (false || true) // false
```

Since what is in parentheses is evaluated first, in the following example, the _not_ operator will apply to the expression inside parentheses.

```Swift
!true && false   // false
!(true && false) // true
```

~~~~exercism/note
You should only use parentheses when they affect the result, otherwise, should they be omitted.
~~~~

[logical-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-Operators
[not]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-NOT-Operator
[and]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-AND-Operator
[or]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-OR-Operator
[explicit-parentheses]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Explicit-Parentheses
[bools]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Booleans

## Instructions

You are in process of developing the new highly appreciated game **Wings Quest**.
In the game you are a bird that moves around and collects seeds.
The player wins by picking up all the seeds.
If the player comes in contact with an eagle, then the player will lose all their seeds and lose the game.
There is an exception to this rule: the player can have an active power-up that makes them fly higher than other birds.

Your goal is to write some rules that will be used in the game.

## 1. Define if bird gets bonus points

In the game, the bird will get bonus points if they touch an eagle while having a power-up.

Define the function `bonusPoints(powerUpActive:touchingEagle:)` that takes two arguments `powerUpActive`, which holds if the bird has an active power-up, and the argument `touchingEagle` which holds if the bird is touching an eagle.
The function should return `true` only if the bird has a power-up active and is touching an eagle, and `false` otherwise.

```Swift
bonusPoints(powerUpActive: false, touchingEagle: true)
// Returns false
```

## 2. Define if bird scores

In the game, the player gets points when picking up a seed or a power-up.

Define the function `score(touchingPowerUp:touchingSeed:)` that takes two arguments `touchingPowerUp`, which holds if the bird is touching a power-up, the argument `touchingSeed` which holds if the bird is touching a seed.
The function should return `true` if the bird is touching a power-up or a seed, and return `false` otherwise.

```Swift
score(touchingPowerUp: true, touchingSeed: true)
// Returns true
```

## 3. Define if bird loses

Define the function `lose(powerUpActive:touchingEagle:)` that takes two arguments `powerUpActive`, which holds if the bird has an active power-up, and the argument `touchingEagle` which holds if the bird is touching an eagle.
The function should return `true` if the character is touching an eagle and does not have a power-up active, and return `false` otherwise.

```Swift
lose(powerUpActive: false, touchingEagle: true)
// Returns true
```

## 4. Define if bird wins

Define the `win(hasPickedUpAllSeeds:powerUpActive:touchingEagle:)` function that takes the arguments:

- `hasPickedUpAllSeeds` if the bird has picked up all of the seeds.
- `powerUpActive` if the bird has a power-up active.
- `touchingEagle` if the bird is an eagle.

The function should return `true` if the bird has gathered all of the seeds and has not lost based on the arguments defined in part 3, and return `false` otherwise.

```Swift
win(hasPickedUpAllSeeds: false, powerUpActive: true, touchingEagle: false)
// Returns false
```

## Source

### Created by

- @meatball133