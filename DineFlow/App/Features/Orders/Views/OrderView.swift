//
//  OrderView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderView: View {

    // MARK: - Environment

    @Environment(RestaurantStore.self)
    private var store

    @Environment(\.dismiss)
    private var dismiss

    // MARK: - Properties

    let table: Table

    @Bindable var orderViewModel: OrderViewModel

    @State private var menuViewModel = MenuViewModel()
    @State private var showOrderSheet = false

    // MARK: - Computed Properties

    private var currentTable: Table {
        store.tables.first {
            $0.id == table.id
        } ?? table
    }

    private var pendingItemCount: Int {
        orderViewModel.order.pendingItems.reduce(0) {
            $0 + $1.quantity
        }
    }

    private var pendingItemsTotal: Double {
        orderViewModel.order.pendingItems.reduce(0) {
            $0 + ($1.menuItem.price * Double($1.quantity))
        }
    }

    private var pendingActionTitle: String {
        pendingItemCount == 1
            ? "Send 1 New Item"
            : "Send \(pendingItemCount) New Items"
    }

    // MARK: - Initializer

    init(
        table: Table,
        orderViewModel: OrderViewModel
    ) {
        self.table = table
        self.orderViewModel = orderViewModel
    }

    // MARK: - Body

    var body: some View {

        ScrollView {

            VStack(spacing: AppSpacing.large) {

                CategoryBar(viewModel: menuViewModel)

                searchBar

                MenuList(
                    viewModel: menuViewModel,
                    quantity: { item in
                        orderViewModel.quantity(for: item)
                    },
                    onIncrease: { item in

                        if orderViewModel.add(item) {
                            updateTableTotal()
                        }
                    },
                    onDecrease: { item in

                        if orderViewModel.decrease(menuItem: item) {
                            updateTableTotal()
                        }
                    }
                )
            }
            .padding(.top)
        }
        .navigationTitle("Table \(table.number)")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            bottomActionArea
        }
    }

    // MARK: - Search Bar

    private var searchBar: some View {

        HStack {

            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField(
                "Search menu...",
                text: $menuViewModel.searchText
            )

            if !menuViewModel.searchText.isEmpty {

                Button {

                    menuViewModel.searchText = ""

                } label: {

                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color(.systemGray6))
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
        .padding(.horizontal)
    }

    // MARK: - Bottom Actions

    private var bottomActionArea: some View {

        VStack(spacing: AppSpacing.small) {

            if pendingItemCount > 0 {

                BottomOrderBar(
                    itemCount: pendingItemCount,
                    total: pendingItemsTotal,
                    actionTitle: pendingActionTitle
                ) {
                    showOrderSheet = true
                }
            }

            if currentTable.status == .ready &&
                pendingItemCount == 0 {

                Button {

                    store.markTableServed(table)
                    dismiss()

                } label: {

                    Label(
                        "Serve Food",
                        systemImage: "fork.knife"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
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
            .presentationDetents([
                .medium,
                .large
            ])
            .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Helpers

    private func updateTableTotal() {

        store.updateTable(
            table,
            totalAmount: orderViewModel.order.grandTotal
        )
    }
}

// MARK: - Preview

#Preview {

    let table = Table(
        number: 7,
        guestCount: 4,
        totalAmount: 0,
        startedAt: nil,
        status: .available
    )

    let order = Order(
        tableID: table.id
    )

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
