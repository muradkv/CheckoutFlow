//
//  CartViewModel.swift
//  CheckoutFlow
//
//  Created by murad on 18.06.2026.
//

import SwiftUI

@Observable
final class CartViewModel {
    let cartTitle: String = "🛒 Your Cart"
    let cartTotalDescription: String = "3 items ready for checkout • $45.00"
    
    var checkoutPath = [Int]()
    
    let checkoutStepToken: Int = 1
    let promoCodeToken: String = "SUMMER2026"
    
    func startCheckout() {
        checkoutPath.append(1)
    }
}
