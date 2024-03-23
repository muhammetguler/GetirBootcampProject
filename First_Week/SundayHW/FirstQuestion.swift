#!/usr/bin/env swift

import Foundation

/*
 Question
 
 Fonksiyonun parametre oalrak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yazınız
 Örneğin; 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde
*/

func printCharacter(number:Int) -> String {
    
    var sumCharacters:String = ""
    
    if number != 0 {
        for i in 1...number {
            
            if i%2 == 0 {
                sumCharacters += "-"
            } else {
                sumCharacters += "+"

            }
            
        }
    }
    
    return sumCharacters

}

var mystring = printCharacter(number: 2)
print(mystring)
