//
//  OrderView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderView: View {

    let table: Table

    @State private var menuViewModel = MenuViewModel()
    @State private var orderViewModel: OrderViewModel
    @State private var showOrderSheet = false
    
    init(table: Table) {
        self.table = table
        _orderViewModel = State(
            initialValue: OrderViewModel(table: table)
        )
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
                        orderViewModel.add(item)
                    },
                    onDecrease: { item in
                        orderViewModel.decrease(menuItem: item)
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
    NavigationStack {
        OrderView(
            table: Table(
                number: 7,
                guestCount: 4,
                totalAmount: 0,
                elapsedMinutes: 0,
                status: .available
            )
        )
    }
}
