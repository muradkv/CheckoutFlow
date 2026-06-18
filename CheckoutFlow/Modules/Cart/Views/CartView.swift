//
//  ContentView.swift
//  CheckoutFlow
//
//  Created by murad on 18.06.2026.
//

import SwiftUI

struct CartView: View {
    @State private var viewModel = CartViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text(viewModel.cartTitle)
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                
                Text(viewModel.cartTotalDescription)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                NavigationLink("Proceed to Checkout", value: viewModel.checkoutStepToken)
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                
                NavigationLink("View Active Promo", value: viewModel.promoCodeToken)
                    .buttonStyle(.bordered)
            }
            .padding()
            .navigationTitle("Store")
            
            .navigationDestination(for: Int.self) { stepNumber in
                AddressStepView(step: stepNumber)
            }
            .navigationDestination(for: String.self) { promoCode in
                PromoView(code: promoCode)
            }
        }
    }
}

#Preview {
    CartView()
}
