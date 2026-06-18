//
//  PromoView.swift
//  CheckoutFlow
//
//  Created by murad on 18.06.2026.
//

import SwiftUI

struct PromoView: View {
    let code: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text("🎉 Active Promotion")
                .font(.title2)
                .bold()
            
            Text("Promo Code: \(code)")
                .font(.headline)
                .foregroundColor(.green)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)
        }
        .navigationTitle("Promo Details")
    }
}

#Preview {
    PromoView(code: "Stellar")
}
