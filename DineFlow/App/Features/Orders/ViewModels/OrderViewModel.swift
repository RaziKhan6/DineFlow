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
    
    init(table: Table, order: Order) {

        self.table = table
        self.order = order
    }

    func add(_ menuItem: MenuItem) {

        if let index = order.items.firstIndex(where: {
            $0.menuItem.id == menuItem.id
        }) {

            order.items[index].quantity += 1

        } else {

            order.items.append(
                OrderItem(menuItem: menuItem)
            )
        }
    }
    
    func quantity(for menuItem: MenuItem) -> Int {

        order.items.first(where: {
            $0.menuItem.id == menuItem.id
        })?.quantity ?? 0
    }
    
    func increaseQuantity(for item: OrderItem) {

        guard let index = order.items.firstIndex(where: {
            $0.id == item.id
        }) else { return }

        order.items[index].quantity += 1
    }

    func decreaseQuantity(for item: OrderItem) {

        guard let index = order.items.firstIndex(where: {
            $0.id == item.id
        }) else { return }

        if order.items[index].quantity == 1 {
            order.items.remove(at: index)
        } else {
            order.items[index].quantity -= 1
        }
    }
    
    func decrease(menuItem: MenuItem) {

        guard let index = order.items.firstIndex(where: {
            $0.menuItem.id == menuItem.id
        }) else {
            return
        }

        if order.items[index].quantity > 1 {
            order.items[index].quantity -= 1
        } else {
            order.items.remove(at: index)
        }
    }
    
    func markAsSentToKitchen() {
        order.status = .sentToKitchen
    }
}
