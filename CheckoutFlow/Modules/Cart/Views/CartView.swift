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
        NavigationStack(path: $viewModel.checkoutPath) {
            VStack(spacing: 24) {
                Text(viewModel.cartTitle)
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                
                Text(viewModel.cartTotalDescription)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Button("Proceed to Checkout") {
                    viewModel.startCheckout()
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .padding()
            .navigationTitle("Store")
            
            .navigationDestination(for: Int.self) { stepNumber in
                let _ = print("Programmatically loaded step screen: \(stepNumber)")
                AddressStepView(step: stepNumber, path: $viewModel.checkoutPath)
            }
        }
    }
}

#Preview {
    CartView()
}
