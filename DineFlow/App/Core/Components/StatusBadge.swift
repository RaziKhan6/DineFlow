//
//  StatusBadge.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct StatusBadge: View {

    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .font(AppTypography.badge)
            .foregroundStyle(color)
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.small)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}

#Preview {
    VStack(spacing: 20) {
        StatusBadge(title: "Preparing", color: .purple)
        StatusBadge(title: "Available", color: .green)
        StatusBadge(title: "Billing", color: .orange)
    }
    .padding()
}
