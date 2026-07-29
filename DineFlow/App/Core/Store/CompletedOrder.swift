//
//  CompletedOrder.swift
//  DineFlow
//
//  Created by Assistant on 29/07/26.
//

import Foundation

/// Immutable snapshot of a completed (paid) order.
/// Minimal shape matching current RestaurantStore usage.

struct CompletedOrder: Identifiable {
    struct Item: Identifiable {
        let id: UUID
        let name: String
        let quantity: Int
        let unitPrice: Double
        let lineTotal: Double
    }

    let id: UUID
    let orderID: UUID?
    let tableID: UUID
    let tableNumber: Int
    let guestCount: Int
    let items: [Item]
    let subtotal: Double
    let gstAmount: Double
    let grandTotal: Double
    let paymentMethod: PaymentMethod
    let startedAt: Date?
    let completedAt: Date
}
