//
//  OrderViewModel.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation
import Observation

@Observable
final class OrderViewModel {

    let table: Table
    private(set) var order: Order

    init(
        table: Table,
        order: Order
    ) {
        self.table = table
        self.order = order
    }

    // MARK: - Menu actions

    func add(_ menuItem: MenuItem) -> Bool {

        // Only increase an item that has not yet been sent.
        if let index = order.items.firstIndex(where: {
            $0.menuItem.id == menuItem.id &&
            !$0.isSentToKitchen
        }) {

            order.items[index].quantity += 1

        } else {

            // A previously sent item must not be modified.
            // Create a new pending item instead.
            order.items.append(
                OrderItem(
                    menuItem: menuItem,
                    isSentToKitchen: false
                )
            )
        }

        return true
    }

    func decrease(menuItem: MenuItem) -> Bool {

        // Only pending items can be reduced.
        guard let index = order.items.firstIndex(where: {
            $0.menuItem.id == menuItem.id &&
            !$0.isSentToKitchen
        }) else {
            return false
        }

        if order.items[index].quantity > 1 {

            order.items[index].quantity -= 1

        } else {

            order.items.remove(at: index)
        }

        return true
    }

    // MARK: - Order sheet actions

    func increaseQuantity(for item: OrderItem) -> Bool {

        guard let index = order.items.firstIndex(where: {
            $0.id == item.id
        }) else {
            return false
        }

        if order.items[index].isSentToKitchen {

            // Do not modify a quantity already printed on a KOT.
            // Add the extra quantity as a new pending item.
            return add(order.items[index].menuItem)
        }

        order.items[index].quantity += 1

        return true
    }

    func decreaseQuantity(for item: OrderItem) -> Bool {

        guard let index = order.items.firstIndex(where: {
            $0.id == item.id &&
            !$0.isSentToKitchen
        }) else {
            return false
        }

        if order.items[index].quantity > 1 {

            order.items[index].quantity -= 1

        } else {

            order.items.remove(at: index)
        }

        return true
    }

    // MARK: - Quantities

    func quantity(for menuItem: MenuItem) -> Int {

        order.items
            .filter {
                $0.menuItem.id == menuItem.id
            }
            .reduce(0) {
                $0 + $1.quantity
            }
    }

    func pendingQuantity(for menuItem: MenuItem) -> Int {

        order.items
            .filter {
                $0.menuItem.id == menuItem.id &&
                !$0.isSentToKitchen
            }
            .reduce(0) {
                $0 + $1.quantity
            }
    }

    // MARK: - Kitchen

    func markPendingItemsAsSent() {

        for index in order.items.indices {

            if !order.items[index].isSentToKitchen {
                order.items[index].isSentToKitchen = true
            }
        }

        order.status = .sentToKitchen
    }
}
