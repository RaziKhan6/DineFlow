//
//  BottomOrderBar.swift
//  DineFlow
//
//  Created by Razi Khan on 26/07/26.
//

import SwiftUI

struct BottomOrderBar: View {

    // MARK: - Properties

    let itemCount: Int
    let total: Double
    let actionTitle: String
    let action: () -> Void

    // MARK: - Body

    var body: some View {

        Button(action: action) {

            HStack(spacing: AppSpacing.medium) {

                VStack(alignment: .leading, spacing: 4) {

                    Text(itemCountText)
                        .font(AppTypography.caption)
                        .foregroundStyle(.secondary)

                    Text(
                        total,
                        format: .currency(code: "INR")
                    )
                    .font(AppTypography.body.weight(.semibold))
                }

                Spacer()

                HStack(spacing: AppSpacing.small) {

                    Text(actionTitle)
                        .font(AppTypography.body.weight(.semibold))

                    Image(systemName: "arrow.right")
                }
            }
            .padding(AppSpacing.medium)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .background(Color(.systemBackground))
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.large
            )
        )
        .cardShadow()
    }

    // MARK: - Computed Properties

    private var itemCountText: String {
        itemCount == 1
            ? "1 new item"
            : "\(itemCount) new items"
    }
}

// MARK: - Preview

#Preview {

    BottomOrderBar(
        itemCount: 2,
        total: 750,
        actionTitle: "Send 2 New Items"
    ) {
        print("Order tapped")
    }
    .padding()
}
