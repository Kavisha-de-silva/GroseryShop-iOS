//
//  SplashViewModel.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-03.
//

import Foundation
class SplashViewModel: ObservableObject {
    @Published var isActive = false  
    
    init() {
        startLoading()
    }
    
    func startLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isActive = true
        }
    }
}
