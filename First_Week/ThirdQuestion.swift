#!/usr/bin/env swift
import Foundation

/*
 Question 3
 
 Users ları tüm harflerini büyütüp Z - A ya sıralı olcak şekilde yazınız
 */

//var users = [String]()
var users:[String] = ["Ali", "Fatma", "Eren", "Zehra", "Kaya", "Ece"]

//for (index, user) in users.enumerated() {

for i in 0...users.count-1 {
    for j in (i+1)..<users.count {
        
        if users[j] > users[i] {
            (users[i], users[j]) = (users[j], users[i])
        }
    }
    
    users[i] = users[i].uppercased() // thats the correct place to write it
}

users
