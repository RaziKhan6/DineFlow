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
    var isLocked: Bool {
        order.status == .sentToKitchen
    }
    
    init(table: Table, order: Order) {

        self.table = table
        self.order = order
    }

    func add(_ menuItem: MenuItem) -> Bool {

        guard !isLocked else {
            return false
        }

        if let index = order.items.firstIndex(where: {
            $0.menuItem.id == menuItem.id
        }) {

            order.items[index].quantity += 1

        } else {

            order.items.append(
                OrderItem(menuItem: menuItem)
            )
        }

        return true
    }
    
    func decrease(menuItem: MenuItem) -> Bool {

        guard !isLocked else {
            return false
        }

        guard let index = order.items.firstIndex(where: {
            $0.menuItem.id == menuItem.id
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
        
    func increaseQuantity(for item: OrderItem) -> Bool {

        guard !isLocked else {
            return false
        }

        guard let index = order.items.firstIndex(where: {
            $0.id == item.id
        }) else {
            return false
        }

        order.items[index].quantity += 1

        return true
    }

    func decreaseQuantity(for item: OrderItem) -> Bool {

        guard !isLocked else {
            return false
        }

        guard let index = order.items.firstIndex(where: {
            $0.id == item.id
        }) else {
            return false
        }

        if order.items[index].quantity == 1 {
            order.items.remove(at: index)
        } else {
            order.items[index].quantity -= 1
        }

        return true
    }
    
    func quantity(for menuItem: MenuItem) -> Int {

        order.items.first(where: {
            $0.menuItem.id == menuItem.id
        })?.quantity ?? 0
    }
    
    func markAsSentToKitchen() {
        order.status = .sentToKitchen
    }
}
