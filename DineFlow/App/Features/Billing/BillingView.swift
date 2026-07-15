//
//  BillingView.swift
//  DineFlow
//
//  Created by Razi Khan on 15/07/26.
//

import SwiftUI

struct BillingView: View {
    
    @State private var showPaymentSuccess = false
    
    @Environment(RestaurantStore.self)
    private var store

    @Environment(\.dismiss)
    private var dismiss

    let table: Table
    @Bindable var orderViewModel: OrderViewModel
    
    @State private var selectedPaymentMethod: PaymentMethod?
    @State private var completedPaymentMethod: PaymentMethod?

    var body: some View {

        ScrollView {

            VStack(alignment: .leading,
                   spacing: AppSpacing.large) {

                VStack(alignment: .leading,
                       spacing: 6) {

                    Text("Bill")
                        .font(AppTypography.title)

                    Text("Table \(table.number)")
                        .foregroundStyle(.secondary)
                }

                Divider()

                ForEach(orderViewModel.order.items) { item in

                    BillItemRow(item: item)
                }

                Divider()

                OrderTotalsView(
                    subtotal: orderViewModel.order.subtotal,
                    gst: orderViewModel.order.gst,
                    grandTotal: orderViewModel.order.grandTotal
                )

                VStack(spacing: AppSpacing.medium) {

                    PaymentButton(
                        title: "Cash",
                        systemImage: "banknote"
                    ) {
                        selectedPaymentMethod = .cash
                    }

                    PaymentButton(
                        title: "Card",
                        systemImage: "creditcard"
                    ) {
                        selectedPaymentMethod = .card
                    }

                    PaymentButton(
                        title: "UPI",
                        systemImage: "qrcode"
                    ) {
                        selectedPaymentMethod = .upi
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Billing")
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog(
            "Complete Payment?",
            isPresented: Binding(
                get: { selectedPaymentMethod != nil },
                set: { if !$0 { selectedPaymentMethod = nil } }
            ),
            titleVisibility: .visible
        ) {

            if let method = selectedPaymentMethod {

                Button("Confirm \(method.rawValue)") {

                    completedPaymentMethod = method
                    showPaymentSuccess = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        store.completePayment(for: table)
                        selectedPaymentMethod = nil
                        completedPaymentMethod = nil
                        dismiss()
                    }
                }
            }

            Button("Cancel", role: .cancel) {
                selectedPaymentMethod = nil
            }
        }
        .overlay {

            if showPaymentSuccess {

                ZStack {

                    Color.black.opacity(0.35)
                        .ignoresSafeArea()

                    VStack(spacing: 20) {

                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 70))
                            .foregroundStyle(.green)

                        Text("Payment Complete")
                            .font(.title2.bold())

                        Text(
                            orderViewModel.order.grandTotal,
                            format: .currency(code: "INR")
                        )
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.green)
                        
                        if let method = completedPaymentMethod {
                            Text(method.rawValue)
                                .font(.headline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(40)
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(radius: 20)
                }
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showPaymentSuccess)
    }
}
