//
//  Double.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 24.04.2024.
//

import Foundation

extension Double {
    func toPriceRoundedString() -> String {
        return String(format: "%.2f", self)
    }
}
