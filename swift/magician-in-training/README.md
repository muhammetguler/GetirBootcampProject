# Magician-in-Training

Welcome to Magician-in-Training on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Arrays are one of Swift's three primary collection types. Arrays are ordered lists of elements where the elements can be of any type, however, all elements of any given list must have the same type.

Arrays literals are written as a series of elements, each separated by commas, enclosed in square brackets. Empty arrays are just a pair of square brackets. Type names for arrays are written in one of two ways: `Array<T>` or `[T]` where `T` is the type of the elements in the array. When creating an empty array, the type must be specified.

```swift
let evenInts: Array<Int> = [2, 4, 6, 8, 10, 12]
var oddInts: [Int] = [1, 3, 5, 7, 9, 11, 13]
let greetings = ["Hello!", "Hi!", "¡Hola!"]
var myStringArray: [String] = []
```

Elements of an array can be accessed individually by supplying the index of the element inside square brackets following the array; array indices are `Int`s and start with `0` for the first (leftmost) element. This subscript notation can be used to get the element at that index as well as to set the element at that index, provided the array was defined as a variable (i.e. using `var`).

Trying to access elements at indices outside the valid range of indices will result in a runtime error that crashes the program. Since any invalid array index access will crash a program, it is common to test arrays to see if they are empty before working with them by checking the `isEmpty` property or checking if an index is valid by ensuring that it is greater than or equal to 0 and less than the array's `count` property.

```swift
evenInts[2]
// =>  6
oddInts[0] = 27
// oddInts is now [27, 3, 5, 7, 9, 11, 13]

// these operations are not allowed
greetings[3]
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
evenInts[1] = 0
// Cannot assign through subscript: 'evenInts' is a 'let' constant
```

The elements of an array can be stepped through one at a time using a for-in loop. This type of loop takes each element of the array, in order, and binds the element to a specified name for further processing inside the loop body. For example, to print out all of the odd integers in an array one can write:

```swift
let ints = [1, 3, 6, 14, 17, 8, 23, 5, 18, 11]

for int in ints {
  if !int.isMultiple(of: 2) {
    print(int)
  }
}

// prints out:
// 1
// 3
// 17
// 23
// 5
// 11
```

## Instructions

As a magician-to-be, Elyse needs to practice some basics. She has a stack of cards that she wants to manipulate.

To make things a bit easier she only uses the cards 1 to 10.

## 1. Retrieve a card from a stack

Implement the function `getCard(at:from:)` that returns the card at position `index` from the given stack.

```swift
let index = 2
getCard(at: index, from: [1, 2, 4, 1])
// => 4
```

## 2. Change a card in the stack

Implement the function `setCard(at:in:to)` that returns a new stack that is a copy of the input stack but which has the card at position `index` changed to the new card provided. If the given `index` is not a valid index in the stack, the original stack should be returned, unchanged.

```swift
let index = 2
let newCard = 6
setCard(at: index, in: [1, 2, 4, 1], to: newCard)
// => [1, 2, 6, 1]
```

## 3. Insert a card at the of top the stack

Implement the function `insert(_:atTopOf:)` that returns a copy of the stack with the new card provided added to the top of the stack.

```swift
let newCard = 8
insert(newCard, atTopOf: [5, 9, 7, 1])
// => [5, 9, 7, 1, 8]
```

## 4. Remove a card from the stack

Implement the function `removeCard(at:from:)` that returns a copy of the stack which has had the card at position `index` removed. If the given `index` is not a valid index in the stack, the original stack should be returned, unchanged.

```swift
let index = 2
removeCard(at: index, from: [3, 2, 6, 4, 8])
// => [3, 2, 4, 8]
```

## 5. Remove the top card from the stack

Implement the function `removeTopCard(_:)` that returns a copy of the stack which has had the card at the top of the stack removed. If the given stack is empty, the original stack should be returned, unchanged.

```swift
removeTopCard([3, 2, 6, 4, 8])
// => [3, 2, 6, 4]
```

## 6. Insert a card at the bottom of the stack

Implement the function `insert(_:atBottomOf:)` that returns a copy of the stack with the new card provided added to the bottom of the stack.

```swift
let newCard = 8
insert(newCard, atBottomOf: [5, 9, 7, 1])
// => [8, 5, 9, 7, 1]
```

## 7. Remove a card from the bottom of the stack

Implement the function `removeBottomCard(_:)` that returns a copy of the stack which has had the card at the bottom of the stack removed. If the given stack is empty, the original stack should be returned, unchanged.

```swift
removeBottomCard([8, 5, 9, 7, 1])
// => [5, 9, 7, 1]
```

## 8. Check size of the stack

Implement the function `checkSizeOfStack(_:_:)` that checks whether the size of the stack is equal to a given `stackSize` or not.

```swift
let stackSize = 4
checkSizeOfStack([3, 2, 6, 4, 8], stackSize)
// => false
```

## 9. Count the number of even cards in the stack

Implement the function `evenCardCount(_:)` that steps through the stack and counts the number of even cards in it.

```swift
evenCardCount([3,8,4,5,1,6,10])
// => 4
```

## Source

### Created by

- @wneumann