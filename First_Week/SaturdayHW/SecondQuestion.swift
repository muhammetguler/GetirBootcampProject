#!/usr/bin/env swift
import Foundation

/*
 Question 2
 
 - Elimizde uzun bir cümle olsun. Bazı kelimelerin tekrar ettiği bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmak.
   String = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
   Merhaba 1 kere, nasılsınız 2 kere iyiyim 2 kere
 */

var text = "Merhaba nasilsiniz iyiyim siz nasilsiniz bende iyiyim"

var textArr = text.split(separator: " ")

var printedWords = [String: Int]()

for word in textArr {
    if let count = printedWords[String(word)] { // every key is unique in dictionary
        printedWords[String(word)] = count + 1
    } else {
        printedWords[String(word)] = 1
    }
}

printedWords.keys
printedWords.values
for (word, count) in printedWords {
    print("\(word): \(count)")
}

//Alternative Solution Using Built-in Methods Defined in Swift:

// Count occurrences of each word
var wordCounts = Dictionary(grouping: textArr, by: { $0 })
    .mapValues { $0.count }


printedWords.keys
printedWords.values
for (word, count) in wordCounts {
    print("\(word): \(count)")
}

