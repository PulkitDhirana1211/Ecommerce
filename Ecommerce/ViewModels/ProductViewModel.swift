//
//  ProductViewModel.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [ProductsModel] = []
    private let manager = APIManager()
    
    func fetchProducts() async {
        do {
            let responseProducts: [ProductsModel] = try await manager.request(url: "https://fakestoreapi.com/products")
            DispatchQueue.main.async {[weak self] in
                self?.products = responseProducts
            }
        } catch {
            print("Product Fetch Error", error)
        }
    }
}
