//
//  PaymentHandler.swift
//  Ecommerce
//
//  Created by Pulkit Dhirana on 05/12/23.
//

import Foundation
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    
    static let supportedCardNetworks: [PKPaymentNetwork] = [
        .amex,
        .visa,
        .masterCard,
        .barcode
    ]
    
    func shippingCalculator() -> [PKShippingMethod] {
        let today = Date()
        let calendar = Calendar.current
        let shippingStartDate = calendar.date(byAdding: .day, value: 5, to: today)
        let shippingEndDate = calendar.date(byAdding: .day, value: 10, to: today)
        
        if let shippingStartDate = shippingStartDate, let shippingEndDate = shippingEndDate {
            let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStartDate)
            let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEndDate)
            
            let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
            shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
            shippingDelivery.detail = "Product will be delivered to your address"
            shippingDelivery.identifier = "DELIVERY"
            
            return [shippingDelivery]
        }
        
        return []
    }
    
    func startPayment(products: [ProductsModel], total: Int, completion: @escaping PaymentCompletionHandler) {
        completionHandler = completion
        paymentSummaryItems = []
        
        products.forEach { product in
            let item = PKPaymentSummaryItem(label: product.title, amount: NSDecimalNumber(string: product.price.decimaltwoPlaces()), type: .final)
            paymentSummaryItems.append(item)
        }
        
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "\(total).00"), type: .final)
        paymentSummaryItems.append(total)
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest
    }
}
