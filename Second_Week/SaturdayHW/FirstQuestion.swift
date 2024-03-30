#!/usr/bin/env swift

import Foundation

/*
 Question 1
 
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 What is the 10001st prime number?
 
 */

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    if number <= 3 {
        return true
    }
    var i = 2
    while i * i <= number {
        if number % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

func findNthPrime(_ n: Int) -> Int {
    var count = 0
    var number = 2
    while true {
        if isPrime(number) {
            count += 1
            if count == n {
                return number
            }
        }
        number += 1
    }
}

let nthPrime = findNthPrime(10001)
print("The 10001st prime number is: \(nthPrime)")
