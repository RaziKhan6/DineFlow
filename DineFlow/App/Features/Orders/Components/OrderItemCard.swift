//
//  OrderItemRow.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderItemCard: View {

    let item: OrderItem

    var onIncrease: () -> Void
    var onDecrease: () -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack {

                Text(item.menuItem.name)
                    .font(AppTypography.body)

                Spacer()

                Text(
                    item.menuItem.price * Double(item.quantity),
                    format: .currency(code: "INR")
                )
                .font(AppTypography.body.weight(.semibold))
            }

            HStack(spacing: 16) {

                Button(action: onDecrease) {
                    Image(systemName: "minus.circle.fill")
                        .font(.title3)
                }

                Text("\(item.quantity)")
                    .font(AppTypography.body)

                Button(action: onIncrease) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title3)
                }

                Spacer()
            }
        }
        .padding()
        .cardStyle()
    }
}

