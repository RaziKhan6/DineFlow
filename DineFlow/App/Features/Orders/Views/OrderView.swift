//
//  OrderView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderView: View {

    @Environment(RestaurantStore.self)
    private var store
    let table: Table
    @Bindable var orderViewModel: OrderViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var menuViewModel = MenuViewModel()
    @State private var showOrderSheet = false
        
    init(
        table: Table,
        orderViewModel: OrderViewModel
    ) {
        self.table = table
        self.orderViewModel = orderViewModel
    }

    var body: some View {

        ScrollView {

            VStack(spacing: AppSpacing.large) {

                CategoryBar(viewModel: menuViewModel)

                MenuList(
                    viewModel: menuViewModel,
                    quantity: { item in
                        orderViewModel.quantity(for: item)
                    },
                    onIncrease: { item in
                        
                        if orderViewModel.add(item) {
                            store.updateTable(
                                table,
                                totalAmount: orderViewModel.order.grandTotal
                            )
                        }
                    },
                    onDecrease: { item in
                        
                        if orderViewModel.decrease(menuItem: item) {
                            store.updateTable(
                                table,
                                totalAmount: orderViewModel.order.grandTotal
                            )
                        }
                    }
                )
            }
            .padding(.top)
        }
        .navigationTitle("Table \(table.number)")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {

            if orderViewModel.order.totalItems > 0 {

                BottomOrderBar(
                    itemCount: orderViewModel.order.totalItems,
                    total: orderViewModel.order.totalAmount
                ) {
                    showOrderSheet = true
                }
                .padding(.horizontal)
                .padding(.bottom, AppSpacing.small)
                .sheet(isPresented: $showOrderSheet) {
                    OrderSheet(
                        table: table,
                        onOrderSent: {
                            dismiss()
                        },
                        viewModel: orderViewModel
                    )
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
    let table = Table(
        number: 7,
        guestCount: 4,
        totalAmount: 0,
        elapsedMinutes: 0,
        status: .available
    )

    let order = Order(tableID: table.id)

    return NavigationStack {
        OrderView(
            table: table,
            orderViewModel: OrderViewModel(
                table: table,
                order: order
            )
        )
    }
}
