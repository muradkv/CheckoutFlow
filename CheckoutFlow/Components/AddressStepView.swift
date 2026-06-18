//
//  AddressStepView.swift
//  CheckoutFlow
//
//  Created by murad on 18.06.2026.
//

import SwiftUI

struct AddressStepView: View {
    let step: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Text("📍 Checkout Step \(step)")
                .font(.title2)
                .bold()
            
            Text("Shipping Address Input Form Placeholder")
                .foregroundColor(.secondary)
        }
        .navigationTitle("Shipping")
    }
}

#Preview {
    AddressStepView(step: 1)
}
