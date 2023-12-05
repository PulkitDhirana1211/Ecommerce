//
//  CartButton.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 04/12/23.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundStyle(Color.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.84))
                    .cornerRadius(40)
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 1)
}
