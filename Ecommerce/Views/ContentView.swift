//
//  ContentView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ProductViewModel()
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(viewModel.products, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle("Products")
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                        .foregroundStyle(Color(UIColor.label))
                }

            }
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ContentView()
}
