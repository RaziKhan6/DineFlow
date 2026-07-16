//
//  RestaurantTable.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import Foundation

struct Table: Identifiable, Hashable {
    let id: UUID
    let number: Int
    var guestCount: Int
    var totalAmount: Double
    var startedAt: Date?
    var status: TableStatus

    init(
        id: UUID = UUID(),
        number: Int,
        guestCount: Int,
        totalAmount: Double,
        startedAt: Date?,
        status: TableStatus
    ) {
        self.id = id
        self.number = number
        self.guestCount = guestCount
        self.totalAmount = totalAmount
        self.startedAt = startedAt
        self.status = status
    }
}
