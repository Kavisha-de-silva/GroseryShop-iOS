//
//  Category.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-24.
//


import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let destination: String
}
