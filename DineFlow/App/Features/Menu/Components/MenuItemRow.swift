//
//  MenuItemRow.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct MenuItemRow: View {

    let item: MenuItem

    let quantity: Int

    let onIncrease: () -> Void
    let onDecrease: () -> Void

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            VegIndicator(isVegetarian: item.isVegetarian)

            VStack(alignment: .leading, spacing: 4) {

                Text(item.name)
                    .font(AppTypography.body)
                    .fontWeight(.medium)

                Text("₹\(Int(item.price))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            QuantityStepper(
                quantity: quantity,
                onIncrease: onIncrease,
                onDecrease: onDecrease
            )
        }
        .padding()
        .cardStyle()
        .opacity(item.isAvailable ? 1 : 0.5)
    }
}
