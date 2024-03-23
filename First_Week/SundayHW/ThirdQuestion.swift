#!/usr/bin/env swift
import Foundation

/*
 Euler Project - Question 4
 
 A palindromic number reads the same both ways. The largest palindrome made from the product of two - 2 digit numbers is 9009 = 91 x 99.

 Find the largest palindrome made from the product of two - 3 digit numbers.
*/


 func findLargestPalindrome() -> Int? {
     var product:Int
     var productStr:String
     var productArr:[Int] = [Int]()
     var pal:Int = 0
     
     for i in stride(from: 999, through: 100, by: -1) {
         
         for j in stride(from: i, through: 100, by: -1) {
             
             product = i * j
             productStr = String(product)
             productArr = productStr.compactMap({ ch in
                 Int(String(ch))
             })
             
             var isPalindrome = true // we accept that after production isPalindrome will be true.
                                                     
             for a in 0..<productArr.count/2 {
                 if productArr[a] != productArr[(productArr.count-1)-a] {
                     isPalindrome = false
                     break
                 }
             }
             
             if isPalindrome && pal < product {
                 pal = product
             }
             
         }
     }
     
     return pal
 }

 if let palindrome = findLargestPalindrome() {
     print(palindrome)
 }

