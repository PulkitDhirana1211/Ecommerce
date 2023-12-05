//
//  CartView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 04/12/23.
//

import SwiftUI

struct CartView: View {
    @State private var isButtonClicked: Bool = false
    @State private var paymentSucceed: Bool = false

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
                            PaymentButton2 {
                                isButtonClicked.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    paymentSucceed.toggle()
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
                    .navigationDestination(isPresented: $paymentSucceed) {
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
