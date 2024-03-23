#!/usr/bin/env swift

import Foundation

/*
 Question 1
 
 - Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun stringler olsun. Bu stringler içinde bazı harflerin tekrar edeceğini düşünün. Mesela 'a' harfi 20 farklı yerde geçiyor 
olabilir. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfleri siliniz.Sonra geriye kalan stringi ekrana yazdırınız.

   Örnek string: "aaba kouq bux"
   Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazılmalı
   Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux"
   tekrar sayısı 4 verildiğinde : hiç bir harf silinmeyip aynı string yazılmalı
 */

func removeDuplicateCharacters(number:Int) -> String {
    
    var word = "aaba kouq bux"
    
    for character in word {
        var count = 0

        for ch in word {
            if character == ch && character != " " {
                count = count + 1
            }
        }
        
        if count >= number {
            word.removeAll { ch in
                if ch == character {
                    return true
                }
                else {
                    return false
                }
            }
        }
    }
    
    return word
}

var word = removeDuplicateCharacters(number: 3)
print(word)
