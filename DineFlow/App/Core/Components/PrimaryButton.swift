//
//  PrimaryButton.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void

    var isEnabled: Bool = true

    var body: some View {

        Button(action: action) {

            Text(title)
                .font(AppTypography.body)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
        }
        .buttonStyle(.plain)
        .foregroundStyle(.white)
        .background(
            isEnabled
            ? AppColor.primaryText
            : AppColor.border
        )
        .clipShape(RoundedRectangle(cornerRadius: AppRadius.large))
        .disabled(!isEnabled)
    }
}

#Preview {

    VStack(spacing: 20) {

        PrimaryButton(
            title: "Place Order",
            action: {}
        )

        PrimaryButton(
            title: "Disabled",
            action: {},
            isEnabled: false
        )
    }
    .padding()
}
