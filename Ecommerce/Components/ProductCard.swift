//
//  ProductCard.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import SwiftUI
import CachedAsyncImage

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    
    let product: ProductsModel
    var body: some View {
        ZStack(alignment: .bottom) {
            CachedAsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(product.title)
                    .bold()
                    .frame(height: 20)
                Text("$" + product.price.decimaltwoPlaces())
                    .font(.caption)
                
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Text("Add to cart")
                        .padding(.vertical, 6)
                        .frame(width: 150)
                        .background(Color("buttonColor"))
                        .cornerRadius(25)
                }
            }
            .padding()
            .frame(width: 180,height: 90, alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
        .frame(width: 180, height: 250)
        .shadow(radius: 3)
    }
}

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}
