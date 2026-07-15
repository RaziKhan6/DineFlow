//
//  PaymentButton.swift
//  DineFlow
//
//  Created by Razi Khan on 15/07/26.
//

import SwiftUI

struct PaymentButton: View {

    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Label(title, systemImage: systemImage)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {

    VStack(spacing: 16) {

        PaymentButton(
            title: "Cash",
            systemImage: "banknote"
        ) {

        }

        PaymentButton(
            title: "Card",
            systemImage: "creditcard"
        ) {

        }

        PaymentButton(
            title: "UPI",
            systemImage: "qrcode"
        ) {

        }
    }
    .padding()
}
