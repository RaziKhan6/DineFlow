//
//  Category.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import Foundation

struct Category: Identifiable, Hashable {

    let id: UUID
    let name: String
    let icon: String

    init(
        id: UUID = UUID(),
        name: String,
        icon: String
    ) {
        self.id = id
        self.name = name
        self.icon = icon
    }
}
