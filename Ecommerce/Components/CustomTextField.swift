//
//  CustomTextField.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 06/12/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var textField: String
    let textFieldHeader: String
    var isSecureField: Bool = false
    
    var body: some View {
        if !isSecureField {
            Section(header: Text(textFieldHeader)) {
                TextField("", text: $textField)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color("AccentColor").opacity(0.5)))
            }
            .padding(.vertical, 2)
        } else {
            Section(header: Text(textFieldHeader)) {
                SecureField("", text: $textField)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .overlay( RoundedRectangle(cornerRadius: 2) .stroke(Color("AccentColor").opacity(0.5)))
            }
            .padding(.vertical, 2)
        }
        
    }

}

#Preview {
    CustomTextField(textField: .constant(""), textFieldHeader: "")
}
