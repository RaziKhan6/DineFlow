//
//  BillItemRow.swift
//  DineFlow
//
//  Created by Razi Khan on 15/07/26.
//

import SwiftUI

struct BillItemRow: View {

    let item: OrderItem

    var body: some View {

        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 4) {

                Text(item.menuItem.name)
                    .font(.headline)

                Text("\(item.quantity) × \(item.menuItem.price, format: .currency(code: "INR"))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(
                item.menuItem.price * Double(item.quantity),
                format: .currency(code: "INR")
            )
            .fontWeight(.semibold)
        }
    }
}

#Preview {

    BillItemRow(
        item: OrderItem(
            menuItem: SampleMenu.menuItems.first!
        )
    )
}
