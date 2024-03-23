func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    var newArr = [Int]()
    newArr = stack

    if index >= 0 && index < newArr.count {
        newArr[index] = newCard
    }

    return newArr           
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    var newArr = [Int]()
    newArr = stack
    newArr.append(newCard)
    return newArr
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    var newArr = [Int]()
    newArr = stack
    
    if index >= 0 && index < newArr.count {
        newArr.remove(at: index)
    }
    
    return newArr
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    var newArr = [Int]()
    newArr = stack

    if !newArr.isEmpty {
        newArr.removeLast()   
        return newArr
    } else {
        return newArr
    }
    
    
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    var newArr = [Int]()
    newArr = stack
    newArr.insert(newCard, at: 0)
    return newArr
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    var newArr = [Int]()
    newArr = stack
    newArr.removeFirst()
    return newArr
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
    if stack.count == size {
        return true 
    } else {
        return false
    }
}

func evenCardCount(_ stack: [Int]) -> Int {
    var count = 0
    for i in stack {
        if i%2 == 0 {
            count += 1
        }
    }

    return count
}
