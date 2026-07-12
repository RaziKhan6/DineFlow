//
//  OrderStatus.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

enum OrderStatus: String, Codable {

    case draft = "Draft"

    case sentToKitchen = "Sent to Kitchen"

    case preparing = "Preparing"

    case served = "Served"

    case billed = "Billed"

    case paid = "Paid"
}
