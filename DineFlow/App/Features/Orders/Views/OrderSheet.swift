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

    @Environment(\.dismiss)
    private var dismiss

    @Environment(RestaurantStore.self)
    private var store

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(
                    alignment: .leading,
                    spacing: AppSpacing.large
                ) {

                    headerView

                    if !viewModel.order.sentItems.isEmpty {
                        sentItemsSection
                    }

                    if !viewModel.order.pendingItems.isEmpty {
                        pendingItemsSection
                    }

                    if viewModel.order.items.isEmpty {
                        ContentUnavailableView(
                            "No Items Added",
                            systemImage: "cart",
                            description: Text(
                                "Add items from the menu to begin the order."
                            )
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, AppSpacing.large)
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

                if !viewModel.order.pendingItems.isEmpty {

                    OrderActionBar(
                        total: viewModel.order.grandTotal,
                        itemCount: viewModel.order.pendingItems.reduce(0) {
                            $0 + $1.quantity
                        }
                    ) {
                        sendPendingItemsToKitchen()
                    }
                }
            }
        }
    }

    // MARK: - Header

    private var headerView: some View {

        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            Text("Current Order")
                .font(AppTypography.title)

            Text("Table \(table.number)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Sent Items

    private var sentItemsSection: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {

            sectionHeader(
                title: "Already Sent",
                systemImage: "checkmark.circle.fill",
                count: sentItemCount
            )

            VStack(spacing: AppSpacing.small) {

                ForEach(viewModel.order.sentItems) { item in

                    SentOrderItemRow(item: item)
                }
            }
        }
    }

    // MARK: - Pending Items

    private var pendingItemsSection: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {

            sectionHeader(
                title: "New Items",
                systemImage: "plus.circle.fill",
                count: pendingItemCount
            )

            VStack(spacing: AppSpacing.small) {

                ForEach(viewModel.order.pendingItems) { item in

                    OrderItemRow(
                        item: item,
                        onIncrease: {
                            increase(item)
                        },
                        onDecrease: {
                            decrease(item)
                        }
                    )
                }
            }
        }
    }

    // MARK: - Section Header

    private func sectionHeader(
        title: String,
        systemImage: String,
        count: Int
    ) -> some View {

        HStack {

            Label(title, systemImage: systemImage)
                .font(AppTypography.body.weight(.semibold))

            Spacer()

            Text("\(count)")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    Color.secondary.opacity(0.12),
                    in: Capsule()
                )
        }
    }

    // MARK: - Actions

    private func increase(_ item: OrderItem) {

        guard viewModel.increaseQuantity(for: item) else {
            return
        }

        updateTableTotal()
    }

    private func decrease(_ item: OrderItem) {

        guard viewModel.decreaseQuantity(for: item) else {
            return
        }

        updateTableTotal()
    }

    private func updateTableTotal() {

        store.updateTable(
            table,
            totalAmount: viewModel.order.grandTotal
        )
    }

    private func sendPendingItemsToKitchen() {

        guard !viewModel.order.pendingItems.isEmpty else {
            return
        }

        store.sendToKitchen(
            orderViewModel: viewModel,
            table: table
        )

        dismiss()
        onOrderSent()
    }

    // MARK: - Counts

    private var sentItemCount: Int {

        viewModel.order.sentItems.reduce(0) {
            $0 + $1.quantity
        }
    }

    private var pendingItemCount: Int {

        viewModel.order.pendingItems.reduce(0) {
            $0 + $1.quantity
        }
    }
}
