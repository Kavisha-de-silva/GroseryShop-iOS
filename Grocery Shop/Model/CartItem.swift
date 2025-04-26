//
//  CartItem.swift
//  Grocery Shop
//
//  Created by Ashan on 2025-04-26.
//

import Foundation


struct CartItem: Identifiable, Codable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
