//
//  Order.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

struct Order: Identifiable {

    let id: UUID
    let tableID: UUID
    var status: OrderStatus = .draft

    var items: [OrderItem]

    init(
        id: UUID = UUID(),
        tableID: UUID,
        items: [OrderItem] = []
    ) {
        self.id = id
        self.tableID = tableID
        self.items = items
    }
    
    var totalAmount: Double {
        items.reduce(0) {
            $0 + ($1.menuItem.price * Double($1.quantity))
        }
    }

    var totalItems: Int {
        items.reduce(0) {
            $0 + $1.quantity
        }
    }
    
    var sentItems: [OrderItem] {
        items.filter { $0.isSentToKitchen }
    }

    var pendingItems: [OrderItem] {
        items.filter { !$0.isSentToKitchen }
    }
    
    var subtotal: Double {
        totalAmount
    }

    var gst: Double {
        subtotal * 0.05
    }

    var grandTotal: Double {
        subtotal + gst
    }
}

