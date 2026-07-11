//
//  TableCard.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct TableCard: View {

    // MARK: - Properties

    let table: Table

    // MARK: - Body

    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            titleView
            amountView
            infoView
            statusView
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .cardStyle()
    }

    // MARK: - Subviews

    private var titleView: some View {
        Text("Table \(table.number)")
            .font(AppTypography.title)
    }

    private var amountView: some View {
        Text(table.totalAmount, format: .currency(code: "INR"))
            .font(AppTypography.amount)
    }

    private var infoView: some View {
        HStack {
            Label("\(table.guestCount)", systemImage: "person.2.fill")

            Spacer()

            Label("\(table.elapsedMinutes)m", systemImage: "clock")
        }
        .font(AppTypography.body)
    }

    private var statusView: some View {
        StatusBadge(
            title: table.status.rawValue,
            color: statusColor
        )
    }

    // MARK: - Helpers

    private var statusColor: Color {
        switch table.status {
        case .available:
            return .green

        case .active:
            return .blue

        case .preparing:
            return .purple

        case .billing:
            return .orange

        case .reserved:
            return .gray
        }
    }
}

// MARK: - Preview

#Preview {
    TableCard(
        table: Table(
            number: 7,
            guestCount: 4,
            totalAmount: 1280,
            elapsedMinutes: 18,
            status: .preparing
        )
    )
    .padding()
}
