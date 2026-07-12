//
//  MenuItemRow.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct MenuItemRow: View {

    let item: MenuItem
    var onAdd: (() -> Void)?

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            VegIndicator(isVegetarian: item.isVegetarian)

            VStack(alignment: .leading, spacing: 4) {

                Text(item.name)
                    .font(AppTypography.body)
                    .fontWeight(.medium)

                Text("₹\(Int(item.price))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {

                onAdd?()

            } label: {

                Image(systemName: "plus")
                    .font(.headline)
                    .frame(width: 34, height: 34)
                    .background(AppColor.primaryText)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding()
        .cardStyle()
        .opacity(item.isAvailable ? 1 : 0.5)
    }
}
