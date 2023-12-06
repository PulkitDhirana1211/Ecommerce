//
//  PaymentButton2.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 06/12/23.
//

import SwiftUI

struct PaymentButton2: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(Color("buttonColor"))
                .cornerRadius(6)
        }

    }
}

#Preview {
    PaymentButton2(text: "Proceed to Buy", action: {})
}
