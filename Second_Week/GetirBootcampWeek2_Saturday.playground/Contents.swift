import UIKit
import Foundation

/*
 
 -Class vs Struct
 -Class -> Reference type -> Kalitim (Miras alma) - Heap
 -Struct -> Value Type -> Protocol ile manipule edilebilir - Stack - Hizlidir
 
 
*/

class Arac {
    var tekerlekSayisi:Int
    var renk:String
    
    init(tekerlekSayisi: Int, renk: String) {
        self.tekerlekSayisi = tekerlekSayisi
        self.renk = renk
    }
    
}

let bmw = Arac(tekerlekSayisi: 4, renk: "kirmizi")
bmw.renk
bmw.tekerlekSayisi

let bmw2 = bmw
bmw2.renk = "Siyah"
bmw.renk
bmw2.renk

struct Araba {
    var model:Int
    var yakitTipi:String
}

var araba = Araba(model: 2019, yakitTipi: "hibrid")
araba.model
araba.yakitTipi

var araba2 = araba
araba.yakitTipi = "benzin"
araba.yakitTipi
araba2.yakitTipi

// PROTOCOLS (Interface)

/*
 -OOP -> POP (Protocol Oriented Programming)
 -Sozlesme gibidir, uygulamasi zorunludur
 -Method, property taslak olarak tanimlanir
 */

protocol Player {
    var playName:String { get }
    var alive:Bool { get set }
    var health: Int { get set }
    func shot()
}

enum Genre {
    case war
    case race
    
}

class Game:Player {
    var name:String
    var platform:String
    var genre: Genre
    
    var playName:String
    var alive:Bool = true // first occasion
    var health: Int = 3 // first occasion
    
    func shot() {
        if health > 0 {
            health -= 1
            if health == 0 {
                alive = false
            }
        } else {
            alive = false
        }
        
        // kisinin can sayisi kadar kalp, olduyse kuru kafa
        
        let healthStatus = alive ? String(repeating: "❤️", count: health) : "💀"
        print("\(playName), Health Status: \(healthStatus)")
        
    }
    
    init(name: String, platform: String, genre: Genre, playName: String, alive: Bool, health: Int) {
        self.name = name
        self.platform = platform
        self.genre = genre
        self.playName = playName
        self.alive = alive
        self.health = health
    }
    
}
              
var cod = Game(name: "Call of Duty", platform: "mobile", genre: .war, playName: "Swift", alive: true, health: 3)
cod.shot()
cod.shot()
cod.shot()
              
/* protocol LessThan {
            static func < (lhs:)
}
              
func kucukMu<T: >(x:T, y:T) -> Bool {
    x<y
}
 
 extension Int:LessThan {}
 extension Double:LessThan {}
 */
              
// Karatsuba Algoritmasi
              

              
              




