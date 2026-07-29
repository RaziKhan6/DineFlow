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

    // MARK: - Properties

    var tables = SampleTables.tables

    var kitchenTickets: [KitchenTicket] = []

    var orderViewModels: [UUID: OrderViewModel] = [:]

    private var nextTicketNumber = 1001

    // MARK: - Table

    func updateTable(
        _ table: Table,
        totalAmount: Double
    ) {

        guard let index = tableIndex(for: table) else {
            return
        }

        tables[index].totalAmount = totalAmount

        if totalAmount == 0 {

            tables[index].status = .available

        } else if tables[index].status == .available {

            tables[index].status = .active
        }
    }

    func startOrder(
        for table: Table,
        guestCount: Int
    ) {

        guard let index = tableIndex(for: table) else {
            return
        }

        tables[index].guestCount = guestCount
        tables[index].status = .active
        tables[index].startedAt = .now
    }

    func markTableServed(
        _ table: Table
    ) {

        guard let tableIndex = tableIndex(for: table),
              let orderViewModel = orderViewModels[table.id] else {
            return
        }

        /*
         The waiter cannot move the table to billing
         while new unsent items exist.
         */
        guard orderViewModel.order.pendingItems.isEmpty else {
            return
        }

        /*
         The waiter cannot move the table to billing
         while the kitchen is still preparing a ticket.
         */
        let hasPreparingTicket = kitchenTickets.contains {
            $0.tableNumber == table.number &&
            $0.status == .preparing
        }

        guard !hasPreparingTicket else {
            return
        }

        guard tables[tableIndex].status == .ready else {
            return
        }

        tables[tableIndex].status = .billing
    }

    // MARK: - Orders

    func orderViewModel(
        for table: Table
    ) -> OrderViewModel {

        if let existingViewModel = orderViewModels[table.id] {
            return existingViewModel
        }

        let order = Order(
            tableID: table.id
        )

        let viewModel = OrderViewModel(
            table: table,
            order: order
        )

        orderViewModels[table.id] = viewModel

        return viewModel
    }

    // MARK: - Kitchen

    func sendToKitchen(
        orderViewModel: OrderViewModel,
        table: Table
    ) {

        let pendingItems = orderViewModel.order.pendingItems

        guard !pendingItems.isEmpty,
              let tableIndex = tableIndex(for: table) else {
            return
        }

        let ticket = KitchenTicket(
            ticketNumber: nextTicketNumber,
            tableNumber: table.number,
            items: pendingItems,
            createdAt: .now,
            completedAt: nil,
            status: .preparing
        )

        kitchenTickets.append(ticket)

        orderViewModel.markPendingItemsAsSent()

        tables[tableIndex].status = .preparing
        tables[tableIndex].totalAmount =
            orderViewModel.order.grandTotal

        nextTicketNumber += 1
    }

    func markTicketReady(
        _ ticket: KitchenTicket
    ) {

        guard let ticketIndex = kitchenTickets.firstIndex(where: {
            $0.id == ticket.id
        }) else {
            return
        }

        kitchenTickets[ticketIndex].completedAt = .now
        kitchenTickets[ticketIndex].status = .ready

        guard let tableIndex = tables.firstIndex(where: {
            $0.number == ticket.tableNumber
        }) else {
            return
        }

        let tableTickets = kitchenTickets.filter {
            $0.tableNumber == ticket.tableNumber
        }

        let hasPreparingTicket = tableTickets.contains {
            $0.status == .preparing
        }

        tables[tableIndex].status = hasPreparingTicket
            ? .preparing
            : .ready
    }

    // MARK: - Payment

    func completePayment(
        for table: Table
    ) {

        guard let tableIndex = tableIndex(for: table) else {
            return
        }

        /*
         Payment should only be completed from
         the billing stage.
         */
        guard tables[tableIndex].status == .billing else {
            return
        }

        tables[tableIndex].status = .available
        tables[tableIndex].guestCount = 0
        tables[tableIndex].totalAmount = 0
        tables[tableIndex].startedAt = nil

        kitchenTickets.removeAll {
            $0.tableNumber == table.number
        }

        orderViewModels.removeValue(
            forKey: table.id
        )
    }

    // MARK: - Helpers

    private func tableIndex(
        for table: Table
    ) -> Int? {

        tables.firstIndex {
            $0.id == table.id
        }
    }
}
