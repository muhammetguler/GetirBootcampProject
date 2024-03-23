// TODO: define the 'birthday' String constant

let birthday:String = "Birthday"

// TODO: define the 'valentine' String constant

let valentine:String = "Valentine's Day"

// TODO: define the 'anniversary' String constant

let anniversary:String = "Anniversary"

// TODO: define the 'space' Character constant

let space:Character = " " // it will convert string to character

// TODO: define the 'exclamation' Character constant

let exclamation:Character = "!" // it will convert string to character

func buildSign(for occasion: String, name: String) -> String {
    switch occasion {         
    case "Birthday":
        return "Happy Birthday \(name)!"
    case "Valentine's Day":
        return "Happy Valentine's Day \(name)!"
    case "Anniversary":   
        return "Happy Anniversary \(name)!"
    default:
        return "Nothing"
    }

    // "Happy \(occasion) \(name)!" you can write simply.
}

func graduationFor(name: String, year: Int) -> String {
    return "Congratulations \(name)!\nClass of \(year)"

}

func costOf(sign: String) -> Int {
    var price = 20 + (sign.count*2)
    return price
    
}
