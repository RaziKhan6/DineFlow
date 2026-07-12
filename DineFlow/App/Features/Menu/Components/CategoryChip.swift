//
//  CategoryChip.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct CategoryChip: View {

    let category: Category
    let isSelected: Bool

    var body: some View {

        HStack(spacing: 8) {

            Text(category.icon)

            Text(category.name)
                .font(AppTypography.body)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            isSelected
            ? AppColor.primaryText
            : AppColor.card
        )
        .foregroundStyle(
            isSelected
            ? .white
            : .primary
        )
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(
                    AppColor.border,
                    lineWidth: isSelected ? 0 : 1
                )
        }
        .animation(.snappy, value: isSelected)
    }
}

#Preview {

    CategoryChip(
        category: SampleMenu.pizzas,
        isSelected: true
    )
    .padding()
}
