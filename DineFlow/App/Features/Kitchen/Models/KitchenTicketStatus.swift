//
//  KitchenTicketStatus.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

enum KitchenTicketStatus: String, Codable {

    case pending = "Pending"

    case preparing = "Preparing"

    case ready = "Ready"

    case served = "Served"
}
