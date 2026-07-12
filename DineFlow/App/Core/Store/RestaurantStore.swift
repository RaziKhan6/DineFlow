//
//  RestaurantStore.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

@Observable
final class RestaurantStore {

    var tables: [Table] = SampleTables.tables

    var orders: [UUID: Order] = [:]
}
