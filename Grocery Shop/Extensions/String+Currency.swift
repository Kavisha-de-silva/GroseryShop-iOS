//
//  String+Currency.swift
//  Grocery Shop
//
//  Created by Ashan on 2025-04-26.
//

import Foundation

extension String {
    var numericValue: Double {
        let cleaned = self
            .replacingOccurrences(of: "Rs.", with: "")
            .replacingOccurrences(of: ",", with: "")
            .trimmingCharacters(in: .whitespaces)
        return Double(cleaned) ?? 0.0
    }
}
