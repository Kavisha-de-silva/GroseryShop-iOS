//
//  CustomOrderView.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-25.
//
/*
import SwiftUI
import PhotosUI

struct CustomOrderView: View {
    @Binding var showOrderConfirmation: Bool
    @Binding var selectedImage: UIImage?
    @Binding var showImagePicker: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text("Add your own order list")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("You can attach your own list of items. This is only allowed for:")
                        .font(.body)
                    
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Cash on Delivery (COD) orders")
                    }
                    
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Store pickup orders")
                    }
                }
                
                // Note
                Text("Note: Please ensure your list is clear and includes all necessary details.")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(.vertical)
                
                // Image Preview
                if let selectedImage = selectedImage {
                    VStack {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 300)
                            .cornerRadius(10)
                        
                        Button(action: {
                            self.selectedImage = nil
                        }) {
                            Text("Remove Image")
                                .foregroundColor(.red)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.bottom)
                }
                
                // Attachment Buttons
                VStack(spacing: 15) {
                    Button(action: {
                        sourceType = .photoLibrary
                        showImagePicker = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                            Text("Choose from Gallery")
                            Spacer()
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    }
                    
                    Button(action: {
                        sourceType = .camera
                        showImagePicker = true
                    }) {
                        HStack {
                            Image(systemName: "camera")
                            Text("Take Photo")
                            Spacer()
                        }
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 1)
                        )
                    }
                }
                
                Spacer()
                
                // Submit Button
                Button(action: {
                    // In a real app, you would upload the image here
                    showOrderConfirmation = true
                    dismiss()
                }) {
                    Text("Submit Order")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedImage == nil ? Color.gray : Color.green)
                        .cornerRadius(10)
                }
                .disabled(selectedImage == nil)
                .padding(.vertical)
            }
            .padding()
        }
        .navigationTitle("Custom Order")
        .navigationBarTitleDisplayMode(.inline)
    }
}*/
