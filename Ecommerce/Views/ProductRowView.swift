//
//  ProductRowView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 04/12/23.
//

import SwiftUI
import CachedAsyncImage

struct ProductRowView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: ProductsModel
    
    var body: some View {
        HStack(spacing: 20) {
            CachedAsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                    .bold()
                Text("$" + product.price.decimaltwoPlaces())
            }
            Spacer()
            Image(systemName: "trash")
                .foregroundStyle(Color(hue: 1.0, saturation: 0.89, brightness: 0.84))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProductRowView(product: productList[0])
        .environmentObject(CartManager())
}
