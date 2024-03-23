func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
      if powerUpActive && touchingEagle {
        return true
    } else {
        return false
    }
}

func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
    if touchingPowerUp || touchingSeed {
        return true                     
    } else {
        return false
    }
}

func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
    if touchingEagle && !powerUpActive {
        return true
    } else {
        return false
    }
}

func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
      if hasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle:touchingEagle) {
        return true
    } else {
        return false
    }
}


