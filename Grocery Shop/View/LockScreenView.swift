//import SwiftUI
//
//struct LockScreenView: View {
//    @StateObject private var authManager = BiometricAuthManager()
//    @State private var isLoading = false
//    
//    var body: some View {
//        ZStack {
//            Color(.systemBackground)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 30) {
//                Image(systemName: "faceid")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 80, height: 80)
//                    .foregroundColor(.green)
//                
//                Text("Secure Login")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                
//                Button {
//                    authenticate()
//                } label: {
//                    HStack {
//                        if isLoading {
//                            ProgressView()
//                                .tint(.white)
//                        } else {
//                            Image(systemName: "faceid")
//                            Text("Login with Face ID")
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(10)
//                }
//                .disabled(isLoading)
//            }
//            .padding()
//        }
//        .alert("Authentication Error", isPresented: $authManager.showAlert) {
//            Button("OK", role: .cancel) { }
//        } message: {
//            Text(authManager.errorMessage ?? "Unknown error")
//        }
//        .fullScreenCover(isPresented: $authManager.isAuthenticated) {
//            // Replace with your main content view
//            ContentView()
//        }
//    }
//    
//    private func authenticate() {
//        isLoading = true
//        authManager.authenticate()
//        isLoading = false
//    }
//}
