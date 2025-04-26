//
//  WelcomeView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-03.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        Text("Shop Name")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: LoginView()
                           // isActive: //$viewModel.isNavigatingToLogin
                        ) {
                            Button(action: {
                               // viewModel.navigateToLogin()
                            }) {
                                Text("Welcome")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                    }
                    
                }
    }
}

#Preview {
    WelcomeView()
}
