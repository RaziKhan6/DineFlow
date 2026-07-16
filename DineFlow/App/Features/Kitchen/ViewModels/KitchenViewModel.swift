//
//  KitchenViewModel.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation
import Observation

@Observable
final class KitchenViewModel {
    
    init() {

        tickets = [
            KitchenTicket(
                ticketNumber: 1001,
                tableNumber: 2,
                items: [
                    OrderItem(menuItem: SampleMenu.menuItems[0]),
                    OrderItem(menuItem: SampleMenu.menuItems[1])
                ],
                createdAt: .now,
                status: .preparing
            )
        ]
    }

    private(set) var tickets: [KitchenTicket] = []

    private var nextTicketNumber = 1002

    func createTicket(from order: Order, table: Table) {

        let ticket = KitchenTicket(
            ticketNumber: nextTicketNumber,
            tableNumber: table.number,
            items: order.items,
            createdAt: Date(),
            status: .preparing
        )

        tickets.append(ticket)

        nextTicketNumber += 1
    }
}
