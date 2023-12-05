//
//  Double.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 03/12/23.
//

import Foundation

extension Double {
    
    func decimaltwoPlaces() -> String {
        String(format: "%.2f", self)
    }
}
