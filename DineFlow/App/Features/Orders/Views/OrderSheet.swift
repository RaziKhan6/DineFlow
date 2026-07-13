//
//  OrderSheet.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderSheet: View {

    let table: Table
    let onOrderSent: () -> Void
    @Bindable var viewModel: OrderViewModel
    @Environment(\.dismiss) private var dismiss
    @Environment(RestaurantStore.self)
    private var store

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading,
                       spacing: AppSpacing.large) {

                    VStack(alignment: .leading, spacing: 6) {

                        Text("Current Order")
                            .font(AppTypography.title)

                        Text("Table \(table.number)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    ForEach(viewModel.order.items) { item in

                        OrderItemRow(
                            item: item,
                            onIncrease: {

                                if viewModel.increaseQuantity(for: item) {

                                    store.updateTable(
                                        table,
                                        totalAmount: viewModel.order.grandTotal
                                    )
                                }
                            },
                            onDecrease: {

                                if viewModel.decreaseQuantity(for: item) {

                                    store.updateTable(
                                        table,
                                        totalAmount: viewModel.order.grandTotal
                                    )
                                }
                            }
                        )
                    }

                    OrderTotalsView(
                        subtotal: viewModel.order.subtotal,
                        gst: viewModel.order.gst,
                        grandTotal: viewModel.order.grandTotal
                    )
                }
                .padding()
            }
            .safeAreaInset(edge: .bottom) {

                OrderActionBar(
                    total: viewModel.order.grandTotal,
                    itemCount: viewModel.order.totalItems
                ) {
                    store.sendToKitchen(
                        orderViewModel: viewModel,
                        table: table
                    )
                    dismiss()
                    onOrderSent()
                }
            }
        }
    }
}
