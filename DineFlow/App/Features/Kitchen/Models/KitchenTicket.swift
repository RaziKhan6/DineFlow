//
//  KitchenTicket.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

struct KitchenTicket: Identifiable {

    let id = UUID()

    let ticketNumber: Int

    let tableNumber: Int

    let items: [OrderItem]

    let createdAt: Date
    
    var completedAt: Date?

    var status: KitchenTicketStatus
    
}
