//
//  AddressStepView.swift
//  CheckoutFlow
//
//  Created by murad on 18.06.2026.
//

import SwiftUI

struct AddressStepView: View {
    let step: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 24) {
            Text("📍 Checkout Step \(step) of 3")
                .font(.title2)
                .bold()
            
            switch step {
            case 1:
                Text("Enter Shipping Address...")
                    .foregroundColor(.secondary)
            case 2:
                Text("Select Payment Method (Card / Apple Pay)...")
                    .foregroundColor(.secondary)
            default:
                Text("Review Order and Confirm Details.")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if step < 3 {
                Button("Next Step ➡️") {
                    path.append(step + 1)
                }
                .buttonStyle(.bordered)
            } else {
                Button("📦 Confirm & Pay") {
                    path = NavigationPath()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
        }
        .padding()
        .navigationTitle("Step \(step)")
    }
}

#Preview {
    AddressStepView(step: 1, path: .constant(NavigationPath()))
}
