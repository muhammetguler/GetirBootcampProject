#!/usr/bin/env swift
import Foundation

/*
 Question
 
 Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını ilgili basamağa koyunuz. Örneğin; parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 528, parametre 920 için 9520 
olmalıdır

*/

func makeNumberBigger(number:Int)->[Int] {
    
    var num = number
    var string = String(number)
    var stringArr = string.compactMap { ch in
        Int(String(ch))
    }
    
    for i in 0...stringArr.count-1 {
        if 5 > stringArr[i] {
            stringArr.insert(5, at: i)
            break
        } else if i == stringArr.count-1 {
            stringArr.insert(5, at: i+1)
        }
        
    }
    
    // instead of else if you can write like this:
    /*
     
     if !stringArr.contains(5) {
         stringArr.append(5)
     }
     
     */
    
    return stringArr
        
}

var arr = makeNumberBigger(number: 746)
print(arr)

