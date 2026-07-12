//
//  OrderActionBar.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct OrderActionBar: View {

    let total: Double
    let itemCount: Int
    let onSend: () -> Void

    var body: some View {

        HStack {

            VStack(alignment: .leading, spacing: 4) {

                Text("\(itemCount) Items")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(total, format: .currency(code: "INR"))
                    .font(AppTypography.title)
            }

            Spacer()

            PrimaryButton(
                title: "Send to Kitchen",
                action: onSend
            )
            .frame(width: 190)
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}
