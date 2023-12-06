//
//  AddressView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 06/12/23.
//

import SwiftUI

struct AddressView: View {
        
    @State private var isBuyButtonClicked: Bool = false
    static var i: Int = 0
    @State private var isPaymentDone: Bool = false
    @State private var textFields: [String] = ["", "", "", "", "", "", ""]
    
    private let fieldHeaders = ["Full name", "Mobile Number", "Flat, House No., Apartment, Building", "Area, Street, Sector, Village", "Landmark", "Pincode", "Town/City"]
    
    var allStates = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal"]
    
    @State private var selectedState: String = "Uttar Pradesh"
    
    @State private var cardInfo: String = ""
    @State private var cvvInfo: String = ""

    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                ForEach(0..<fieldHeaders.count, id: \.self) { x in
                    CustomTextField(textField: $textFields[x], textFieldHeader: fieldHeaders[x])
                    
                }
                
                Section(header: Text("State")) {
                    
                    Picker("Please choose a color", selection: $selectedState) {
                        ForEach(allStates, id: \.self) {
                            Text($0)
                        }
                    }
                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color("AccentColor").opacity(0.5)))
                }
                .padding(.vertical, 2)
                
                CustomTextField(textField: $cardInfo, textFieldHeader: "Enter Card Details", isSecureField: true)
                    .onChange(of: cardInfo) { _ in
                        cardInfo = String(cardInfo.prefix(16))
                    }
                
                CustomTextField(textField: $cvvInfo, textFieldHeader: "Enter CVV", isSecureField: true)
                    .onChange(of: cvvInfo) { _ in
                        cvvInfo = String(cvvInfo.prefix(3))
                    }
                
                if !isBuyButtonClicked {
                    PaymentButton2(text: "Buy Now") {
                        isBuyButtonClicked.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isPaymentDone.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.7) {
                            isBuyButtonClicked.toggle()
                        }
                    }
                    .padding(.vertical, 6)
                } else {
                    HStack {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 12)
                    }
                    .navigationDestination(isPresented: $isPaymentDone) {
                        PaymentSuccessView()
                    }
                }
                
            }
            .padding()
            .navigationTitle("Add Address")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
}

#Preview {
    AddressView()
}

