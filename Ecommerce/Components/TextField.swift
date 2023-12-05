//
//  CustomTextField.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 06/12/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var textField: String
    
    var body: some View {
        TextField("", text: $textField)
    }

}

#Preview {
    CustomTextField(textField: .constant(""))
}
