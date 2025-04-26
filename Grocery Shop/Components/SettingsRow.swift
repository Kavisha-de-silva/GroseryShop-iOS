//
//  SettingsRow.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-21.
//

import SwiftUI

struct SettingsRow: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(title)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(10)
    }
}
