//
//  SentOrderItemRow.swift
//  DineFlow
//
//  Created by Razi Khan on 26/07/26.
//

import SwiftUI

struct SentOrderItemRow: View {

    let item: OrderItem

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            VegIndicator(
                isVegetarian: item.menuItem.isVegetarian
            )

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(item.menuItem.name)
                    .font(AppTypography.body)
                    .fontWeight(.medium)

                Text(
                    item.menuItem.price.formatted(
                        .currency(code: "INR")
                    )
                )
                Text(item.menuItem.price,
                     format: .currency(code: "INR"))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                .font(.caption)
                .foregroundStyle(.secondary)
            }

            Spacer()

            Text("× \(item.quantity)")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.green)
        }
        .padding()
        .background(
            Color.secondary.opacity(0.06),
            in: RoundedRectangle(
                cornerRadius: AppRadius.medium
            )
        )
    }
}
