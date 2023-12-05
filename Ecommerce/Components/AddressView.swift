//
//  AddressView.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 06/12/23.
//

import SwiftUI

struct AddressView: View {
    
    private let fieldHeaders = ["Full name", "Mobile Number", "Flat, House No., Apartment, Building", "Area, Street, Sector, Village", "Landmark", "Pincode", "Town/City"]
    var allStates = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal"]
    @State private var selectedState = "Uttar Pradesh"
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                ForEach(fieldHeaders, id: \.self) { x in
                    @State var fieldVal: String = ""
                    Section(header: Text(x)) {
                        TextField("", text: $fieldVal)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color("AccentColor").opacity(0.5)))
                        
                        
                    }
                    .padding(.vertical, 2)
                    
                }
                
                Section(header: Text("State")) {
                    
                    Picker("Please choose a color", selection: $selectedState) {
                                    ForEach(allStates, id: \.self) {
                                        Text($0)
                                    }
                                }
                }
                .padding(.vertical, 2)
                PaymentButton2 {
                    
                }
                .padding(.vertical, 12)
            }
            .padding()
            
            
            
        }
        .navigationTitle("Add Address")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    //            VStack {
    //                TextField("Name", text: $nameField)
    //                    .padding(.vertical, 6)
    //                    .padding(.horizontal, 12)
    //                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color.black.opacity(0.5)))
    //                    .padding(.vertical, 6)
    //
    //                TextField("Mobile Number", text: $nameField)
    //                    .padding(.vertical, 6)
    //                    .padding(.horizontal, 12)
    //                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color.black.opacity(0.5)))
    //                    .padding(.vertical, 6)
    //
    //                TextField("Flat, House no., Building, Apartment", text: $nameField)
    //                    .padding(.vertical, 6)
    //                    .padding(.horizontal, 12)
    //                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color.black.opacity(0.5)))
    //                    .padding(.vertical, 6)
    //
    //                TextField("Mobile Number", text: $nameField)
    //                    .padding(.vertical, 6)
    //                    .padding(.horizontal, 12)
    //                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color.black.opacity(0.5)))
    //                    .padding(.vertical, 6)
    //
    //            }
    //            .padding()
    
    //      }
    //}
}

#Preview {
    AddressView()
}

