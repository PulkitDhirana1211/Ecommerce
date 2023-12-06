//
//  CartView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 04/12/23.
//

import SwiftUI

struct CartView: View {
    @State private var isButtonClicked: Bool = false
    @State private var proceed: Bool = false

    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRowView(product: product)
                }
                HStack {
                    Text("Your cart total is ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("$" + cartManager.total.decimaltwoPlaces())
                }
                .padding()
                
                if !isButtonClicked {
                    
                        NavigationLink {
                            PaymentSuccessView()
                        } label: {
                            PaymentButton2(text: "Proceed to Buy") {
                                isButtonClicked.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    proceed.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
                                    isButtonClicked.toggle()
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                    }
                    
                } else {
                    VStack {
                        ProgressView()
                            .frame(height: 100)
                            .padding(.vertical, 12)
                    }
                    .navigationDestination(isPresented: $proceed) {
                        AddressView()
                    }

                }
                               
            } else {
                Text("Your cart is empty")
            }
        }
        .navigationTitle("My Cart")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
