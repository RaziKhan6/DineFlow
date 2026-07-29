//
//  OrderItem.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

struct OrderItem: Identifiable {

    let id: UUID
    let menuItem: MenuItem

    var quantity: Int

    /// True once this item has been sent to the kitchen
    var isSentToKitchen: Bool

    init(
        id: UUID = UUID(),
        menuItem: MenuItem,
        quantity: Int = 1,
        isSentToKitchen: Bool = false
    ) {
        self.id = id
        self.menuItem = menuItem
        self.quantity = quantity
        self.isSentToKitchen = isSentToKitchen
    }
}
