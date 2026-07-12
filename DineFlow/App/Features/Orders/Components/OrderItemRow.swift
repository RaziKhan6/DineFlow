//
//  OrderItemRow.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderItemRow: View {

    let item: OrderItem

    let onIncrease: () -> Void
    let onDecrease: () -> Void

    var body: some View {

        HStack(alignment: .top, spacing: AppSpacing.medium) {

            VStack(alignment: .leading, spacing: 4) {

                Text(item.menuItem.name)
                    .font(AppTypography.body)
                    .fontWeight(.semibold)

                Text(item.menuItem.price,
                     format: .currency(code: "INR"))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            QuantityStepper(
                quantity: item.quantity,
                onIncrease: onIncrease,
                onDecrease: onDecrease
            )
        }
        .padding()
        .cardStyle()
    }
}
