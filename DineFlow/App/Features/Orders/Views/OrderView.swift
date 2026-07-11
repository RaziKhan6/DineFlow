//
//  OrderView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderView: View {

    let table: RestaurantTable

    var body: some View {
        VStack(spacing: 24) {

            Text("🍽️")
                .font(.system(size: 60))

            Text("Table \(table.number)")
                .font(.largeTitle.bold())

            Text("Order Screen")
                .font(.title2)
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("Order")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        OrderView(
            table: RestaurantTable(
                number: 7,
                guestCount: 4,
                totalAmount: 1280,
                elapsedMinutes: 18,
                status: .active
            )
        )
    }
}
