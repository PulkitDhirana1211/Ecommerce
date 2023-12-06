//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import SwiftUI

@main
struct EcommerceApp: App {
    
    @StateObject private var vm = CartManager()
//    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
            .environmentObject(vm)
        }
    }
}
