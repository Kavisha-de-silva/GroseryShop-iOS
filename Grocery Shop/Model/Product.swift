//
//  Product.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-23.
//


//import Foundation
//
// //product model
// struct Product: Identifiable, Hashable {
//     let id: String
//     let name: String
//     let price: String
//     let image: String
//     let description: String
//     //let category: String
// }


import Foundation

struct Product: Identifiable, Codable, Hashable { 
    let id: String
    let name: String
    let price: String
    let image: String
    let description: String
}
