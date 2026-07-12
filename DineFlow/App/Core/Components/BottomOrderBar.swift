//
//  BottomOrderBar.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct BottomOrderBar: View {

    let itemCount: Int
    let total: Double

    var action: (() -> Void)?

    var body: some View {

        Button {

            action?()

        } label: {

            HStack {

                VStack(alignment: .leading, spacing: 4) {

                    Text("\(itemCount) Items")
                        .font(AppTypography.body)
                        .fontWeight(.semibold)

                    Text(
                        total,
                        format: .currency(code: "INR")
                    )
                    .font(AppTypography.body)
                    .fontWeight(.bold)
                }

                Spacer()

                HStack(spacing: 6) {

                    Text("View Order")

                    Image(systemName: "chevron.right")
                }
                .font(AppTypography.body.weight(.semibold))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .cardStyle()
        }
        .buttonStyle(.plain)
    }
}

#Preview {

    BottomOrderBar(
        itemCount: 5,
        total: 1498
    )
    .padding()
}
