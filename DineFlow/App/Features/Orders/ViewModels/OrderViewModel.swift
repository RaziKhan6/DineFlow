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

    private(set) var order: Order

    init(table: Table) {
        order = Order(tableID: table.id)
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
}
