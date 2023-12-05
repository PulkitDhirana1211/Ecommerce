//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import SwiftUI

@main
struct EcommerceApp: App {
    
    @StateObject var vm = CartManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}
