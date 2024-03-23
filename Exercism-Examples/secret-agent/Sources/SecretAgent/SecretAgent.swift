func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {

    func secretFunction(_ passw:String) -> String {
        if passw == password {
            return secret
        } else {
            return "Sorry. No hidden secrets here."
        }
    }

    return secretFunction

}

/*
let secretFunc = protectSecret("Steal the world's supply of french fries!", withPassword: "5up3r53cr37")
// secretFunc: (String)->String ... we defined its functionality (its body)

secretFunction("Open sesame")
// => "Sorry. No hidden secrets here."

secretFunction("5up3r53cr37")
// => "Steal the world's supply of french fries!" 
*/

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {

var a = f(room)
var b = f(a)
var c = f(b)

    return (a,b,c)
}

func makeCombo(_ x: Int) -> Int {
  (x * 13) % 256
}






