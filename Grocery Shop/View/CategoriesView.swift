import SwiftUI

struct CategoriesView: View {
    @State private var navigationPath = NavigationPath()
    
    // Sample categories data
    let categories: [Category] = [
        Category(name: "Vegetables", image: "cat1", destination: "VegetablesView"),
        Category(name: "Fruits", image: "fruit", destination: "FruitsView"),
        Category(name: "Beverages", image: "beverages", destination: "BeveragesView"),
        Category(name: "Frozen Food", image: "Frozen food", destination: "FrozeFoodView"),
        Category(name: "Grocery", image: "grocery", destination: "GroceryView")
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 0) {
                // Fixed Top Bar
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hello")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                            Text("Kavi")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Image("logo fresh cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom, 20)
                }
                .frame(minHeight: 100)
                .background(Color.green)
                .edgesIgnoringSafeArea(.top)
                
                // Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search categories...", text: .constant(""))
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        
                        // Categories Grid
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 16),
                                    GridItem(.flexible(), spacing: 16)],
                                  spacing: 16) {
                            ForEach(categories) { category in
                                NavigationLink(value: category.destination) {
                                    CategoryCard(
                                        categoryName: category.name,
                                        imageName: category.image
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "FruitsView":
                    FruitsView()
                case "VegetablesView":
                    VegetableView()
                case "MeatFishView":
                    MeatFishView()
                case "DairyEggsView":
                    MeatFishView()
                case "BakeryView":
                    MeatFishView()
                case "BeveragesView":
                    MeatFishView()
                case "SnacksView":
                    MeatFishView()
                case "HouseholdView":
                    MeatFishView()
                default:
                    EmptyView()
                }
            }
        }
    }
}


#Preview {
    CategoriesView()
}
