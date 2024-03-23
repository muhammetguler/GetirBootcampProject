func dailyRateFrom(hourlyRate: Int) -> Double {
    let total = hourlyRate * 8
    return Double(total)

}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {

    let total = 22 * 8 * hourlyRate 
    let disc = Double(total) * discount / 100 // they should be the same type
    var totalwithDiscount = Double(total) - disc
    totalwithDiscount = totalwithDiscount.rounded()
    return totalwithDiscount
    
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {

    var total:Int
    total = Int(budget/(1-(discount/100))) 
    // budget = total - (total * discount / 100)
    // b = t(1-discount/100)

    var workDays = Double(total / (hourlyRate * 8))
    workDays = workDays.rounded()
    // total = hourlyRate * workDays * 8

    return workDays
  
}
