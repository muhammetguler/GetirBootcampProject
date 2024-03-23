#!/usr/bin/env swift
import Foundation
import UIKit

var greeting = "Hello, playground"
let selamlama = "Merhaba, Getir Bootcampine Hosgeldiniz"

greeting = "Merhaba, playground"

let icon = "\u{1f44d}"
let 👍 = "onay isareti"

print(👍)
print(icon)

// --------------------

var x = 2 // var x:Int = 2, x integer.
x = Int(3.4)

let a:Double = 5 // a double.
print(a) //

// ---------------------

let b:Int = Int(-5.3)

print("b nin degeri: \(b)")
print("b nin degeri", b)

let y = "y" // y string.
let z:Character = "y" // z character.

// ---------------------

var name:String? // Optional
name = "Ahmet Yasin"

print(name ?? "isimsiz")
print(name!)
print(name as Any)
print(name)

name?.count

for item in name! {
    print(item)
}

var version = 12

if version >= 13 {
    print("SwiftUI yazilabilir")
} else if version == 12 {
    print("...")
} else {
    print("1 surum daha guncel olmalisiniz")
}

// Ternary If
version >= 13 ? print("SwiftUI yazilabilir") : print("1 surum daha guncel olmalisiniz")

// ---------------------

let tuples = (404, "Not found")

print(tuples.0)
print(tuples.1)

// Isimli tuples
var namesTuples = (first:1, second:2, last:3)
namesTuples.first
namesTuples.last

var aile = (Ad:"Muhammet", Soyad:"Guler") // ilk ifadeleri (Ad ve Soyad) degisken gibi dusun.

aile.Ad
aile.Soyad

/*
var kisi = (isim:String?, yas:Int?)

kisi.isim = "Muhammet"
kisi.yas = 25
*/
 
// Swap

// ---------------------

var cars:[Any] = ["Mercedes", 3] // var cars:Any = ["Mercedes", 3] as [Any]
cars.first
cars.last
cars[0]
cars[1]

var array1:[String] = []
var array2 = [String]() // Genellikle bu kullanilir.
var array3 = Array<String>() // Genellikle set de de bu kullanilir
var array4:Array<String> = Array()

array2.append("Antalya")
array2.append("Sinop")
array2.append("Izmir")
array2.append("Mersin")

array2.count
array2[array2.count-1]

var stringArray = Array(repeating: "Izmir", count: 4)

let matrix = [["A","B",1], [3,5,10]]

matrix[0][2]
matrix.first?.last

var numberArray = [1,2,3]

numberArray.max()
numberArray.min()

// ---------------------

// Set -> unordered - tekrar etmeyen

var colors = Set<String>() // Elemanlari String olan bir set
var myColors: Set<String> = ["Sari", "Kirmizi", "Kirmizi"]
var otherColors: Set<String> = ["Sari", "Mor", "Mavi"]

let intersection = myColors.intersection(otherColors)
let union = myColors.union(otherColors)

let difference = myColors.symmetricDifference(otherColors) // KESISIM DISINDAKILER
let substract = myColors.subtracting(otherColors) // ILKINDE OLUP DIGERINDE OLMAYAN

// ---------------------

// Dictionary -> unordered - sozluk

var hayvanlar1:Dictionary<String, String> = Dictionary<String, String>() // bos
var hayvanlar2: [String:String] = [:] // bos
var hayvanlar3 = [String:String]() // bos

var hayvanlar: [String:String] = ["Robin":"Kopek", "Bihter":"Kedi", "Husnu":"Papagan"]

hayvanlar["Robin"]
hayvanlar["Bihter"] = "Balik"
hayvanlar["Pihter"] = "Balik" // Yeni bir key value ekler

hayvanlar.keys
hayvanlar.values

var otherDict = [String:Any]() // JSON modelden veri alirken gelen veriyi cast etmeden once..

//-----------------------------------------------------------


