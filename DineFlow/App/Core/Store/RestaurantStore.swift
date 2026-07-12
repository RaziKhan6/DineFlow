//
//  RestaurantStore.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation
import Observation

@Observable
final class RestaurantStore {

    var tables = SampleTables.tables

    var kitchenTickets: [KitchenTicket] = []

    var orderViewModels: [UUID: OrderViewModel] = [:]

    private var nextTicketNumber = 1001
    
    func updateTable(
        _ table: Table,
        totalAmount: Double
    ) {

        guard let index = tables.firstIndex(where: {
            $0.id == table.id
        }) else {
            return
        }

        tables[index].totalAmount = totalAmount

        if totalAmount == 0 {

            tables[index].status = .available

        } else if tables[index].status == .available {

            tables[index].status = .active
        }
    }
    
    func sendToKitchen(
        orderViewModel: OrderViewModel,
        table: Table
    ) {

        guard orderViewModel.order.status != .sentToKitchen else {
            return
        }

        guard !orderViewModel.order.items.isEmpty else {
            return
        }

        guard let index = tables.firstIndex(where: {
            $0.id == table.id
        }) else {
            return
        }

        // Mark order as sent
        orderViewModel.markAsSentToKitchen()

        // Update table status
        tables[index].status = .preparing

        // Create kitchen ticket
        let ticket = KitchenTicket(
            ticketNumber: nextTicketNumber,
            tableNumber: table.number,
            items: orderViewModel.order.items,
            createdAt: .now,
            status: .preparing
        )

        kitchenTickets.append(ticket)

        nextTicketNumber += 1
    }

    func orderViewModel(for table: Table) -> OrderViewModel {

        if let vm = orderViewModels[table.id] {
            return vm
        }

        let order = Order(tableID: table.id)

        let vm = OrderViewModel(
            table: table,
            order: order
        )

        orderViewModels[table.id] = vm

        return vm
    }
}
