//
//  OrderTotalsView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderTotalsView: View {

    let subtotal: Double
    let gst: Double
    let grandTotal: Double

    var body: some View {

        VStack(spacing: AppSpacing.medium) {

            totalRow(
                title: "Subtotal",
                amount: subtotal
            )

            totalRow(
                title: "GST (5%)",
                amount: gst
            )

            Divider()

            totalRow(
                title: "Grand Total",
                amount: grandTotal,
                bold: true
            )
        }
        .padding()
        .cardStyle()
    }

    @ViewBuilder
    private func totalRow(
        title: String,
        amount: Double,
        bold: Bool = false
    ) -> some View {

        HStack {

            Text(title)

            Spacer()

            Text(amount,
                 format: .currency(code: "INR"))
                .fontWeight(bold ? .bold : .regular)
        }
    }
}
