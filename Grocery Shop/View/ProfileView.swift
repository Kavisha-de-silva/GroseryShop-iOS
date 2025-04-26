//
//  ProfileView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-03.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("darkMode") private var darkMode = false
    @AppStorage("notifications") private var notifications = true
    @State private var isLoggedOut = false

    var body: some View {
        VStack(spacing: 0){
            //Top bar
            HStack{
                VStack(alignment: .leading){
                    
                }
                Spacer()
                Image("")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding()
            .background(Color.green)
            
            // Main Content
            Spacer()
            
                NavigationStack {
                    VStack {
                      
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading) {
                                Text("Kavi De Silva")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("kavisha@gmail.com")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding()
                        
                        Divider()
                        
                      
                        List {
                            NavigationLink(destination: Text("Change Password Page")) {
                                SettingsRow(icon: "lock.fill", title: "Change Password")
                            }
                            
                            NavigationLink(destination: Text("Notifications Settings")) {
                                SettingsRow(icon: "bell.fill", title: "Notification Preferences")
                            }
                            
                            NavigationLink(destination: Text("Help")) {
                                SettingsRow(icon: "questionmark.circle.fill", title: "Help")
                            }
                        }
                        
                     
                            Form {
                                Toggle("Enable Notifications", isOn: $notifications)
                                Toggle("Dark Mode", isOn: $darkMode)
                            }
                            .preferredColorScheme(darkMode ? .dark : .light)
                            .navigationTitle("Settings")
                        
                        .listStyle(InsetGroupedListStyle())
                        
                        Spacer()
                        
                       
                        
                    }
                    .navigationTitle("Profile Settings")
                }
            }
        }
        //.edgesIgnoringSafeArea(.top)
        

    
}

#Preview {
    ProfileView()
}
