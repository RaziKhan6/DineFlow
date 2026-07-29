//
//  BillingView.swift
//  DineFlow
//
//  Created by Razi Khan on 15/07/26.
//
//

import SwiftUI

struct BillingView: View {

    // MARK: - Environment

    @Environment(RestaurantStore.self)
    private var store

    @Environment(\.dismiss)
    private var dismiss

    // MARK: - Properties

    let table: Table

    @Bindable var orderViewModel: OrderViewModel

    // MARK: - State

    @State private var selectedPaymentMethod: PaymentMethod?
    @State private var showPaymentConfirmation = false

    // MARK: - Computed Properties

    private var currentTable: Table {
        store.tables.first {
            $0.id == table.id
        } ?? table
    }

    private var order: Order {
        orderViewModel.order
    }

    private var canReceivePayment: Bool {
        selectedPaymentMethod != nil &&
        !order.items.isEmpty &&
        order.pendingItems.isEmpty
    }

    // MARK: - Body

    var body: some View {

        ScrollView {

            VStack(spacing: AppSpacing.large) {

                tableSummaryCard

                orderedItemsSection

                billSummaryCard

                paymentMethodSection

                receivePaymentButton
            }
            .padding(AppSpacing.large)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Billing")
        .navigationBarTitleDisplayMode(.inline)
        .interactiveDismissDisabled()
        .alert(
            "Confirm Payment",
            isPresented: $showPaymentConfirmation
        ) {

            Button("Cancel", role: .cancel) {}

            Button("Receive Payment") {
                completePayment()
            }

        } message: {

            if let selectedPaymentMethod {

                Text(
                    "Receive \(formattedGrandTotal) via \(selectedPaymentMethod.rawValue)?"
                )
            }
        }
    }

    // MARK: - Table Summary

    private var tableSummaryCard: some View {

        VStack(spacing: AppSpacing.medium) {

            HStack {

                VStack(alignment: .leading, spacing: 4) {

                    Text("Table \(currentTable.number)")
                        .font(AppTypography.title)

                    Text(guestCountText)
                        .font(AppTypography.body)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                StatusBadge(
                    title: currentTable.status.title,
                    color: currentTable.status.color
                )
            }

            Divider()

            HStack {

                Label(
                    "\(order.totalItems) Items",
                    systemImage: "fork.knife"
                )

                Spacer()

                Label(
                    tableDuration,
                    systemImage: "clock"
                )
            }
            .font(AppTypography.body)
            .foregroundStyle(.secondary)
        }
        .padding(AppSpacing.large)
        .background(Color(.systemBackground))
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.large
            )
        )
        .cardShadow()
    }

    // MARK: - Ordered Items

    private var orderedItemsSection: some View {

        VStack(alignment: .leading, spacing: AppSpacing.medium) {

            Text("Order Summary")
                .font(AppTypography.title)

            VStack(spacing: 0) {

                ForEach(Array(order.items.enumerated()), id: \.element.id) {
                    index,
                    item in

                    billItemRow(item)

                    if index < order.items.count - 1 {
                        Divider()
                    }
                }
            }
            .background(Color(.systemBackground))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppRadius.large
                )
            )
            .cardShadow()
        }
    }

    private func billItemRow(
        _ item: OrderItem
    ) -> some View {

        HStack(spacing: AppSpacing.medium) {

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(item.menuItem.name)
                    .font(AppTypography.body.weight(.semibold))

                Text(
                    "\(item.quantity) × \(formattedPrice(item.menuItem.price))"
                )
                .font(AppTypography.caption)
                .foregroundStyle(.secondary)
            }

            Spacer()

            Text(
                itemTotal(item),
                format: .currency(code: "INR")
            )
            .font(AppTypography.body.weight(.semibold))
        }
        .padding(AppSpacing.medium)
    }

    // MARK: - Bill Summary

    private var billSummaryCard: some View {

        VStack(spacing: AppSpacing.medium) {

            billRow(
                title: "Subtotal",
                amount: order.subtotal
            )

            billRow(
                title: "GST (5%)",
                amount: order.gst
            )

            Divider()

            HStack {

                Text("Grand Total")
                    .font(AppTypography.title)

                Spacer()

                Text(
                    order.grandTotal,
                    format: .currency(code: "INR")
                )
                .font(AppTypography.amount)
            }
        }
        .padding(AppSpacing.large)
        .background(Color(.systemBackground))
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.large
            )
        )
        .cardShadow()
    }

    private func billRow(
        title: String,
        amount: Double
    ) -> some View {

        HStack {

            Text(title)
                .font(AppTypography.body)
                .foregroundStyle(.secondary)

            Spacer()

            Text(
                amount,
                format: .currency(code: "INR")
            )
            .font(AppTypography.body.weight(.semibold))
        }
    }

    // MARK: - Payment Method

    private var paymentMethodSection: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {

            Text("Payment Method")
                .font(AppTypography.title)

            VStack(spacing: AppSpacing.small) {

                ForEach(PaymentMethod.allCases) { method in

                    paymentMethodButton(method)
                }
            }
        }
    }

    private func paymentMethodButton(
        _ method: PaymentMethod
    ) -> some View {

        Button {

            withAnimation(.snappy) {
                selectedPaymentMethod = method
            }

        } label: {

            HStack(spacing: AppSpacing.medium) {

                Image(systemName: method.systemImage)
                    .font(.title3)
                    .frame(width: 32)

                Text(method.title)
                    .font(AppTypography.body.weight(.semibold))

                Spacer()

                Image(
                    systemName: selectedPaymentMethod == method
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .font(.title3)
                .foregroundStyle(
                    selectedPaymentMethod == method
                        ? currentTable.status.color
                        : Color.secondary
                )
            }
            .padding(AppSpacing.medium)
            .frame(maxWidth: .infinity)
            .background(
                paymentMethodBackground(method)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    private func paymentMethodBackground(
        _ method: PaymentMethod
    ) -> some View {

        RoundedRectangle(
            cornerRadius: AppRadius.large
        )
        .fill(
            selectedPaymentMethod == method
                ? currentTable.status.color.opacity(0.12)
                : Color(.systemBackground)
        )
        .overlay {

            RoundedRectangle(
                cornerRadius: AppRadius.large
            )
            .stroke(
                selectedPaymentMethod == method
                    ? currentTable.status.color
                    : Color.secondary.opacity(0.15),
                lineWidth: selectedPaymentMethod == method
                    ? 1.5
                    : 1
            )
        }
    }

    // MARK: - Receive Payment

    private var receivePaymentButton: some View {

        Button {

            showPaymentConfirmation = true

        } label: {

            HStack {

                Image(systemName: "checkmark.circle.fill")

                Text("Receive Payment")

                Spacer()

                Text(formattedGrandTotal)
            }
            .font(AppTypography.body.weight(.semibold))
            .frame(maxWidth: .infinity)
            .padding(AppSpacing.medium)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!canReceivePayment)
        .opacity(canReceivePayment ? 1 : 0.6)
    }

    // MARK: - Helpers

    private var guestCountText: String {

        currentTable.guestCount == 1
            ? "1 Guest"
            : "\(currentTable.guestCount) Guests"
    }

    private var formattedGrandTotal: String {

        order.grandTotal.formatted(
            .currency(code: "INR")
            .locale(Locale(identifier: "en_IN"))
        )
    }

    private var tableDuration: String {

        guard let startedAt = currentTable.startedAt else {
            return "0 min"
        }

        let minutes = max(
            0,
            Int(Date().timeIntervalSince(startedAt) / 60)
        )

        return "\(minutes) min"
    }

    private func itemTotal(
        _ item: OrderItem
    ) -> Double {

        item.menuItem.price * Double(item.quantity)
    }

    private func formattedPrice(
        _ price: Double
    ) -> String {

        price.formatted(
            .currency(code: "INR")
            .locale(Locale(identifier: "en_IN"))
        )
    }

    private func completePayment() {

        guard selectedPaymentMethod != nil else {
            return
        }

        store.completePayment(for: table)

        dismiss()
    }
}

// MARK: - Preview

#Preview {

    let table = Table(
        number: 7,
        guestCount: 4,
        totalAmount: 1375.50,
        startedAt: .now.addingTimeInterval(-1800),
        status: .billing
    )

    let order = Order(
        tableID: table.id,
        items: SampleMenu.menuItems.prefix(2).map {
            OrderItem(
                menuItem: $0,
                quantity: 2,
                isSentToKitchen: true
            )
        }
    )

    return NavigationStack {

        BillingView(
            table: table,
            orderViewModel: OrderViewModel(
                table: table,
                order: order
            )
        )
        .environment(RestaurantStore())
    }
}
