# Vexing Vehicle Purchase

Welcome to Vexing Vehicle Purchase on Exercism's Swift Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Comparison operators

[Comparison operators][comparison-operators] are used to compare values and return a `true` or `false` value.
These operators require 2 values to be compared of the same type.
If the values are not of the same type then the compiler will throw an error.
Here is a list of the comparison operators and an example of when they give a `true` value:

| Method | Description           | Example |
| ------ | --------------------- | ------- |
| ==     | equal                 | 1 == 1  |
| !=     | not equal             | 1 != 2  |
| <      | less than             | 4 < 5   |
| <=     | less than or equal    | 4 <= 4  |
| >      | greater than          | 3 > 1   |
| >=     | greater than or equal | 2 >= 2  |

## If & Else statements

A [conditional statement][conditional-statement] allows you to execute code based on a condition which is either `true` or `false`.
The most basic conditional statement is an [if statement][if] which executes code when the condition is `true`.
To declare an if statement you use the `if` keyword followed by the condition and then the code to execute in curly braces.

```swift
let wheelCount = 4
if wheelCount == 4 {
  print("Your vehicle is a car")
}
// Prints "Your vehicle is a car"
```

If can be combined with else to execute code when the condition is `false`.
The else statement needs to be used with an if statement and cannot be used on its own.
To declare an else statement you use the `else` keyword after an if statements curly braces, followed by the code to execute in curly braces.

```swift
Let precipitationInMM = 0.5
if precipitationInMM > 0.5 {
  print("You will need an umbrella")
} else {
  print("You will not need an umbrella")
}
// Prints "You will not need an umbrella"
```

If statements can also be chained together using else if to check multiple conditions.
It follows the same principle as defining an if statement but the keyword is `else if` instead of `if`.
As If statement don't they need an else statement to be valid, but they can have one if needed.

```swift
let favoriteFruit = "Apple"

if favoriteFruit == "Banana" {
    print("Your favorite fruit is a banana")
} else if favoriteFruit == "Orange" {
    print("Your favorite fruit is an orange")
} else if favoriteFruit == "Apple" {
    print("Your favorite fruit is an apple")
} else {
    print("Your favorite fruit is not a banana, orange or apple")
}
// Prints "Your favorite fruit is an apple"
```

## If expression

If statements can also be used as expressions to assign a value to a variable.
The last statement in the if block is used as the value of the if expression.
This can be useful when you want to assign a value to a variable based on a condition.

```swift
let CpuBits = 32
let largest = if CpuBits == 64 {
  "x86_64"
} else {
  "x86_32"
}

print(largest)
// Prints "x86_32"
```

## Ternary operator

[Ternary operator][ternary-operator] is a short form of an if-else statement.
It takes a boolean expression and two expressions separated by a colon.
The first expression is evaluated if the boolean expression is true, otherwise the second expression is evaluated.
It has the following setup: `Boolean-expression ? expression1 : expression2`.

The ternary operator is great when you want a short form of an if-else statement and the expressions are short:

```swift
let showFahrenheit = true
let temperatureInCelsius = 30

let temperature = showFahrenheit ? temperatureInCelsius * 9 / 5 + 32 : temperatureInCelsius
print(temperature)
// Prints 86
```

The example above is shorthand for the code below:
    
```swift
let showFahrenheit = true
let temperatureInCelsius = 30

let temperature = if showFahrenheit {
    temperatureInCelsius * 9 / 5 + 32
} else {
    temperatureInCelsius
}
```

[comparison-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators#Comparison-Operators
[conditional-statement]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Conditional-Statements
[if]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#If
[ternary-operator]: https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID71

## Instructions

In this exercise, you will write some code to help you prepare to buy a vehicle.

You have three tasks, one to determine if you will need one to help you choose between two vehicles, determine which license you will need and one to estimate the acceptable price for a used vehicle.

## 1. Compute whether or not you can afford the monthly payments on a given car

The auto dealers in your town are all running a five year, 0% interest promotion that you would like to take advantage of.
But you are not sure if you can afford the monthly payments on the car you want.

Implement the `canIBuy(vehicle:price:monthlyBudget:)` function that takes the following arguments:
- `vehicle` - The name of the vehicle you want to buy.
- `price` - The price of the vehicle you want to buy.
- `monthlyBudget` - The amount of money you can afford to pay each month.

The function should return the following message based on the following conditions:
- If the price of the vehicle is less than or equal to the monthly budget, return the message `"Yes! I'm getting a <vehicle>"`.
- If the price of the vehicle is 10% above your monthly budget, return the message `"I'll have to be frugal if I want a <vehicle>"`.
- If the price of the vehicle is more than 10% above your monthly budget, return the message `"Darn! No <vehicle> for me"`.

```swift
canIBuy(vehicle: "1974 Ford Pinto", price: 516.32, monthlyBudget: 100.00)
// returns "Yes! I'm getting a 1974 Ford Pinto"
canIBuy(vehicle: "2011 Bugatti Veyron", price: 2_250_880.00, monthlyBudget: 10000.00)
// returns "Darn! No 2011 Bugatti Veyron for me"
canIBuy(vehicle: "2020 Indian FTR 1200", price: 12_500, monthlyBudget: 200)
// returns "I'll have to be frugal if I want a 2020 Indian FTR 1200"
```

## 2. Determine the type of drivers license you will need

You have decided to buy a used vehicle and you need to determine what type of drivers license you will need to operate it.

Implement the `licenseType(numberOfWheels:)` function that takes the argument `numberOfWheels` which is the number of wheels on the vehicle you want to buy.

The function should return the following message based on the following conditions:
- If the number of wheels is 2 or 3, return the message `"You will need a motorcycle license for your vehicle"`.
- If the number of wheels is 4 or 6, return the message `"You will need an automobile license for your vehicle"`.
- If the number of wheels is 18, return the message `"You will need a commercial trucking license for your vehicle"`.
- If the number is any other number, return the message `"We do not issue licenses for those types of vehicles"`.

```swift
licenseType(numberOfWheels: 2)
// returns "You will need a motorcycle license for your vehicle"
licenseType(numberOfWheels: 6)
// returns "You will need an automobile license for your vehicle"
licenseType(numberOfWheels: 18)
// returns "You will need a commercial trucking license for your vehicle"
licenseType(numberOfWheels: 0)
// returns "We do not issue licenses for those types of vehicles"
```

## 3. Calculate an estimation for the price of a used vehicle

Now that you made your decision you want to make sure you get a fair price at the dealership.
Since you are interested in buying a used vehicle, the price depends on how old the vehicle is.
For a rough estimate, assume if the vehicle is less than 3 years old, it costs 80% of the original price it had when it was brand new.
If it is at least 10 years old, it costs 50%.
If the vehicle is at least 3 years old but not older than 10 years, it costs 70% of the original price.

Implement the `calculateResellPrice(originalPrice:yearsOld:)` function that takes the arguments `originalPrice` which holds the vehicles original price, and `yearsOld` which holds the age of the vehicle in years.
The function should return the resell price of the vehicle. 

```swift
calculateResellPrice(originalPrice: 1000, yearsOld: 1)
// returns 800
calculateResellPrice(originalPrice: 1000, yearsOld: 5)
// returns 700
calculateResellPrice(originalPrice: 1000, yearsOld: 15)
// returns 500
```

## Source

### Created by

- @wneumann
- @meatball133