//
//  View+CardStyle.swift
//  DineFlow
//

import SwiftUI

extension View {

    func cardStyle() -> some View {
        self
            .background(AppColor.card)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppRadius.large,
                    style: .continuous
                )
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: AppRadius.large,
                    style: .continuous
                )
                .stroke(
                    AppColor.border,
                    lineWidth: 1
                )
            }
            .shadow(
                color: .black.opacity(0.08),
                radius: 8,
                x: 0,
                y: 2
            )
    }
}
