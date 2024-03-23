#!/usr/bin/env swift
import Foundation

/*
 Euler Project - Question 5
 
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/


func findSmallestMultiple() -> Int {
    // Function to calculate the greatest common divisor (GCD) of two numbers
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    // Function to calculate the least common multiple (LCM) of two numbers
    func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }
    
    // Initialize lcmValue to 1
    var lcmValue = 1
    
    // Calculate the LCM of numbers from 1 to 20
    for i in 2...20 {
        lcmValue = lcm(lcmValue, i)
    }
    
    return lcmValue
}

let smallestMultiple = findSmallestMultiple()
print("The smallest positive number divisible by all numbers from 1 to 20 is:", smallestMultiple)


/*
 Turkish explanations:
 -ekokunu bulduktan sonra başka bir sayı ile olan ekokunu buluyorsun
 -Ör: 2 ile 3 ün ekoku yani 6 ile 4’ü yani diğer bir sayı ile olan ekokunu buluyorsun
 
 2, 3 ve 4 ün ekoku = 6 (2 ve 3 ün ekoku) ile 4 ün ekoku
 2,3,4,5’in ekoku = 12 (2,3,4 ün ekoku) ile 5 in ekoku
*/

