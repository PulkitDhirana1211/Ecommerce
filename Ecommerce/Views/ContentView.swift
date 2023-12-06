//
//  ContentView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive : Bool = false
    @StateObject private var viewModel = ProductViewModel()
    @StateObject private var cartManager = CartManager()
    
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
                NavigationLink (
                    destination: CartView()
                        .environmentObject(cartManager)
                ) {
                    CartButton(numberOfProducts: cartManager.products.count)
                        .foregroundStyle(Color(UIColor.label))
                }
                .isDetailLink(false)
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
