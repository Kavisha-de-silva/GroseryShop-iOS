//
//  SplashView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-03.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    var body: some View {
        VStack {
               Spacer()
               Image("logo fresh cart") 
                   .resizable()
                   .scaledToFit()
                   .frame(width: 150, height: 150)
                   .padding(.bottom, 250)
               Text("Welcome To Fresh Cart")
                   .foregroundColor(.white)
                   .font(.system(size: 24, weight: .medium))
                   .padding(.bottom, 50)
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.green.ignoresSafeArea())
           .fullScreenCover(isPresented: $viewModel.isActive) {
               MainTabView() // Navigates to HomeView after 3 sec
           }
    }
}

#Preview {
    SplashView()
}
