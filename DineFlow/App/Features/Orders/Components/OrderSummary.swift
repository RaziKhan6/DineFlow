//
//  OrderSummary.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderSummary: View {

    @Bindable var viewModel: OrderViewModel

    var body: some View {

        VStack(alignment: .leading, spacing: AppSpacing.medium) {

            Text("Current Order")
                .font(AppTypography.title)

            if viewModel.order.items.isEmpty {

                ContentUnavailableView(
                    "No Items",
                    systemImage: "cart"
                )

            } else {

                ForEach(viewModel.order.items) { item in

                    OrderItemCard(
                        item: item,
                        onIncrease: {
                            viewModel.increaseQuantity(for: item)
                        },
                        onDecrease: {
                            viewModel.decreaseQuantity(for: item)
                        }
                    )
                }

                Divider()

                HStack {

                    Text("Total")
                        .font(AppTypography.title)

                    Spacer()

                    Text(
                        viewModel.order.totalAmount,
                        format: .currency(code: "INR")
                    )
                    .font(AppTypography.title)
                }
                
                PrimaryButton(
                    title: "Place Order",
                    action: {

                    },
                    isEnabled: !viewModel.order.items.isEmpty
                )
            }
        }
        .padding(.horizontal)
    }
}

