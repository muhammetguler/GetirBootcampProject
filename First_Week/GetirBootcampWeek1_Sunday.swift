#!/usr/bin/env swift
import Foundation
import UIKit

// -------------------------

func selamlama(name:String, age:Int) -> String {
    
    return "Merhaba ben \(name), \(age) yasindayim."
    
}

selamlama(name: "Muhammet", age: 25)

func anything() -> (a:Int, b:String, c:Double) {
    return (1, "", 2.5)
}

// VARIADIC FUNCTION

func sumVariadic(numbers:Int ... , y:String) {
    print("")
}

sumVariadic(numbers: 1,2,3,4,5,6, y: "Sayilar")

// INOUT

func value(x: inout Int) {
    x = x+1
    print(x)
}

var k = 4
value(x: &k)

k

// -------------------------

// CLOSURES

let merhaba:() -> () = {
    print("Merhaba ben bir closure")
}

merhaba()

let merhaba2:(String) -> () = { name in
    print("Merhaba ben \(name)")
}

merhaba2("Swift")

let compare:(Int,Int)->Bool = {x,y -> Bool in
    return x > y
    // tek satir oldugu icin return yazmasam da yazilir
}

compare(5,3)

let names = ["Umut", "Erkut", "Enes", "Pinar", "Ecem"]

let sortedNames = names.sorted { (isim1:String, isim2:String)->Bool in
    return isim1 < isim2
}

let sortedNames2 = names.sorted { (isim1, isim2)->Bool in
    return isim1 < isim2
}

let sortedNames3 = names.sorted { (isim1, isim2) in
    return isim1 < isim2
}

let sortedNames4 = names.sorted {
    $0 < $1
}

let sortedNames5 = names.sorted(by: <)


// NETWORKING DE KULLANILIR..

func myFunc(myClosure: ()->Void) {
    print("Fonksiyon Basladi..")
    myClosure()
    print("Fonksiyon sona erdi..")
}

let exampleClosure = {
    print("Closure basladi..")
}

myFunc(myClosure: exampleClosure)
myFunc {
    print("Closure basladi..")
}

// COMPLETION HANDLER (En fazla kullanilan closure turu)

let url = "https://getir.com"
let myURL = URL(string: url)

let handler: (Data?, URLResponse?, Error?) -> () = { (data, response, error) in
    print(String(data:data!, encoding: .utf8)!)
}

let task = URLSession.shared.dataTask(with: myURL!, completionHandler: handler)

/* let task = URLSession.shared.dataTask(with: myURL!) { data, response, error in
    print(String(data:data!, encoding: .utf8)!)
} */

// islem bittiginde ben bunu sana cagircam, parametrelerim de bunlar (bunlari donucem), artik bunu nasil tanimlayacagini (kullanacagini) sen belirle...

// -------------------------

// ENUM

enum Direction {
    case right
    case left
    case up
    case down
}

enum Direction2 {
    case right, left, up, down
}

let rightSide = Direction.right
let leftSide = Direction.left
let downSide:Direction = .down

enum Numbers:Int {
    case first = 1, second = 3, third, fourth,fifth
}

let besinci = Numbers.fifth
print(besinci.rawValue) // why 6?

enum Hata:Error {
    case serverError(note: String)
    case userError(note:String)
}

let hata = Hata.serverError(note: "Server error")
print(hata)

enum Cities:String {
    case Izmir = "Boyoz"
    case Erzurum = "Cag Kebabi"
    case Aydin = "Incir"
    case Maras = "Dondurma"
    case Edirne = "Ciger"
    case Diyarbakir = "Karpuz"
    case Samsun = "Pide"
    case Sinop = "Keskek"
}

let city = Cities.Aydin
print(city.rawValue)

// function ornegi ??

let direct:Direction = .up

switch direct {
case .right:
    print("right")
case .left:
    print("left")
case .up:
    print("up")
case .down:
    print("down")
}

enum Orchestra {
    enum Strings {
        case guitar
        case baglama
    }
    
    enum Keyboards {
        case piano
        case org
    }
    
    enum Percussion {
        case drum
        case bell
    }
}

let inst1 = Orchestra.Strings.guitar
let inst2 = Orchestra.Keyboards.piano

print(inst1)
print(inst2)

// ---------------------------

// OPTIONALS

var number: Int?
number = 3 // eger deger atamazsan if bloktaki else girer
print(number ?? 0)

// if let kullanimi
    
if let sayi = number {
    print("number: \(sayi)")
} else {
    print("number was not assigned a value")
}

var sehir:String?
sehir = "Ankara"

if let il = sehir {
    print(il)
}

struct Member {
    let name:String?
    let email:String?
    let password:String?
}

let member = Member(name: "Kerim", email: "kerim.caglar@gmail.com", password: nil)

func getMember(member:Member) {
    if let name = member.name, let email = member.email, let password = member.password {
        print(name)
        print(email)
        print(password)
        // virgulle baglandigi icin hepsini saglamasi lazim.
    } else {
        print("Veriler okunamadi")
    }
    
}

getMember(member: member)

func uyeGetir(_ uye:Member) {
    guard let name = uye.name, let email = uye.email, let password = uye.password else {
        print("Veriler okunamadi")
        return
    }
    
    print(name)
    print(email)
    print(password)
}

let uye = Member(name: "Ahmet", email: "ahmet@gmail.com", password: nil)

uyeGetir(uye)

// if let guard let farkli kullanimlarini inceleyiniz..

// --------------------------------

// ERROR HANDLING

enum NameError:Error {
    case tooShort
    case tooLong
}

func nameValidation(_ name:String) throws -> String {
    if name.count > 0 {
        throw NameError.tooLong
    } else if name.count < 2 {
        throw NameError.tooShort
    } else {
        return name
    }
}

// try: hata varsa ben onu yakalarim, do try catch yapisini severim

do {
    try nameValidation("Ensar Batuhan Unverdi") // fonksiyonun throws ozelligi olmasi lazim..
} catch NameError.tooShort {
    print("Name is too short")
} catch NameError.tooLong {
    print("Name is too long")
}

// try?: Herkes hata yapabilir, do catch kullanilmasina ihtiyacim yok.

if let isim = try? nameValidation("Efe") { // hata varsa nil atar o yuzden boyle yazdik..
    print("Name is valid: ")
} else {
    print("Name is non valid")
}

// try!: Ben hatalari hic sevmem hata yakalarsam bozulurum. (do or die)
//let result = try! nameValidation("Kerim Caglar") // uygulama coker..


var screen = "0.0"

enum CalculateError: Error {
    case nanError // 0 bolu 0 hatasi
    case InfError // 0 a bolme hatasi
    case baseError // Bolunen 0 ise
}

func bolme(bolunen:Double, bolen:Double) throws -> Double {
    
    guard bolunen != 0 || bolen != 0 else {
        print("nan error hatasi meydana geldi")
        throw CalculateError.nanError
    }
    
    guard bolunen != 0  else {
        print("base hatasi meydana geldi")
        throw CalculateError.baseError
    }
    
    guard bolen != 0  else {
        print("inf hatasi meydana geldi")
        throw CalculateError.InfError
    }
    
    return bolunen / bolen

}

do {
    try bolme(bolunen: 3, bolen: 0)
} catch CalculateError.nanError {
    print("nanerror")
} catch CalculateError.InfError {
    print("inferror")
} catch CalculateError.baseError {
    print("baseerror")
}


// exercism // haftaya kadar 10 easy soru coz.
// Euler project 4,5

// built in fonksyionlari sorularin cozuumunad kolaylik sagliyor, cozum yontemi farkeder mi?

// ve 2 soru..

// ---------------------------------------------

// EXTENSIONS

// YUVARLAMA ALGORITMASI:
// Virgulden sonra 2 basamak icin 100 ile yani 10 uzeri 2 ile carp.
// Sayiyi yuvarla.
// 13 bolu 10 uzeri 2 (carptigimiz sayiya bolduk)


extension Double {
    func sayiyiYuvarla(_ basamakSayisi:Int) -> Double {
        let carpan = pow(10.0, Double(basamakSayisi))
        return (self*carpan).rounded() / carpan // self sayinin kendisini ifade ediyor.
    }
}

var m = 0.00291970802919708

m.sayiyiYuvarla(3) // 0,003

extension Int {
    func kupuAl() -> Int {
        self * self * self
    }
    
    /*mutating func kareAl() -> Int {
        self = self * self
    }*/
    
    func isEven() -> Bool {
        self % 2 == 0
    }
}

5.kupuAl()
var o = 3
//o.kareAl()


3.isEven()

// ---------------------------------------------

// GENERICS

let sehirler = ["Antep", "Erzurum", "Izmir"]
let numbers = [1,2,3]
let doubleNumbers = [3.14, 2.4, 5.3]

func myCities(cities: [String]) {
    for city in cities {
        print(city)
    }
}

func myNumbers(numbers: [Int]) {
    for number in numbers {
        print(number)
    }
}

func anyArray<T>(array: [T]) { // alacagimiz arrayin tipi T, herhangi bir tur olabilir..
    array.map { eleman in
        print(eleman)
    }
}

anyArray(array: sehirler)
anyArray(array: numbers)

func sumNumber<T: Numeric>(first: T, second: T) -> T {
    first + second
}

sumNumber(first: 3, second: 4)
// Bunlar toplanacagi icin sayi oldugunu ispatlayacak bir sey yapmamiz lazim: Numeric protokolu ekledim.

func findFirstIndex<T:Equatable>(foundItem: T, items: [T]) -> Int? {
    
    for (index, item) in items.enumerated() {
        if item == foundItem {
            
            return index
        }
    }
    
    return nil
    
}

if let sonuc = findFirstIndex(foundItem: "Erzurum", items: sehirler) {
    print(sonuc)
} else {
    print("Array icerisinde bu sehir bulunamadi")
}

// Iki parametreli ve Farkli tipli bir generic ornegi yapinz. (T,U)

