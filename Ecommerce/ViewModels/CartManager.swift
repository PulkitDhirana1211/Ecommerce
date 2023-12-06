//
//  CartManager.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 04/12/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [ProductsModel] = []
    @Published private(set) var total: Double = 0.0
    
    func addToCart(product: ProductsModel) {
            products.append(product)
            total += product.price
    }
    
    func removeFromCart(product: ProductsModel) {
        products = products.filter( {$0.id != product.id})
        total -= product.price
    }
}
