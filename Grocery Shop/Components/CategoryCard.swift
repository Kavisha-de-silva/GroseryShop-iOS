//
//  CategoryCard.swift
//  Grocery Shop
//
//  Created by Kavisha De Silva on 2025-04-24.
//

// Components/CategoryCard.swift
import SwiftUI

struct CategoryCard: View {
    let categoryName: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Category Image
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 150)
                .clipped()
                .cornerRadius(12)
            
            // Category Name
            Text(categoryName)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 4)
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(
            categoryName: "Fruits",
            imageName: "cat1" // Replace with your image name
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}


