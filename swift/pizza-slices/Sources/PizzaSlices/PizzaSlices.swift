func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    
    if let dia = diameter, let sli = slices {
        if dia < 0 || sli < 1 {
            return nil
        } else {
            let radius = dia / 2
            let areaOfWholePizza = Double.pi * radius * radius
            let areaOfOneSlice = areaOfWholePizza / Double(sli)
            return areaOfOneSlice
        }                       
    }

    return nil
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {

   let areaOfOneSliceA:Double?
    let areaOfOneSliceB:Double?

    if let diaA = Double(diameterA), let sliA = Double(slicesA) {
        if diaA >= 0 && sliA > 0 {
            let radiusA = diaA / 2
            let areaOfWholePizzaA = Double.pi * radiusA * radiusA
            areaOfOneSliceA = areaOfWholePizzaA / Double(sliA)                  
        } else {
            areaOfOneSliceA = nil  
        }
    } else {
        areaOfOneSliceA = nil
    }
    
    if let diaB = Double(diameterB), let sliB = Double(slicesB) {
        if diaB >= 0 && sliB >= 0 {
            let radiusB = diaB / 2
            let areaOfWholePizzaB = Double.pi * radiusB * radiusB
            areaOfOneSliceB = areaOfWholePizzaB / Double(sliB)
        } else {
            areaOfOneSliceB = nil  
        }
    } else {
        areaOfOneSliceB = nil
    }
    
    
    if areaOfOneSliceA != nil && areaOfOneSliceB == nil {
        return "Slice A is bigger"
    } else if areaOfOneSliceA == nil && areaOfOneSliceB != nil {
        return "Slice B is bigger"
    } else if areaOfOneSliceA == nil && areaOfOneSliceB == nil {
        return "Neither slice is bigger"
    } else {
        if Int(areaOfOneSliceA!) == Int(areaOfOneSliceB!) {
            return "Neither slice is bigger"
        } else if Int(areaOfOneSliceA!) > Int(areaOfOneSliceB!) {
            return "Slice A is bigger"
        } else {
            return "Slice B is bigger"
        }
    }
    
}
