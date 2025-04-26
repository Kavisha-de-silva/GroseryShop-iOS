//
//  Item.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-03.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
