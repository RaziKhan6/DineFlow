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

                // Temporary Debug Panel
                VStack(alignment: .leading, spacing: 8) {
                    Text("Items: \(orderViewModel.order.totalItems)")
                    Text(CurrencyFormatter.format(orderViewModel.order.totalAmount))
                }
                .padding()
                .cardStyle()
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle("Table \(table.number)")
        .navigationBarTitleDisplayMode(.inline)
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
