//
//  Collection.swift
//  GetiriOSShoppingApp
//
//  Created by Muhammet Guler on 10.04.2024.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// This line extends the Collection protocol, but only for collections where the type of the elements in the indices collection matches the Index type of the collection itself.
//  Example: For an Array, which conforms to Collection, its Index type is Int, and the Indices is a  range of Int (e.g., 0..<array.count). The elements of that range (Indices.Iterator.Element) are also Int. So, for Array, the condition  Indices.Iterator.Element == Index is true, because both are Int.

// The subscript defined in this extension can be used to safely access elements of any collection (like an array) without risking an out-of-bounds error, which would typically crash the app.

