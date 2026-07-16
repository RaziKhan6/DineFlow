//
//  TableCard.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct TableCard: View {
    
    // MARK: - Properties
    
    @State private var now = Date()
    let table: Table
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            if table.status == .ready {
                HStack(spacing: 6) {
                    Image(systemName: "bell.badge.fill")
                    Text("READY FOR SERVICE")
                }
                .font(.caption2.weight(.bold))
                .foregroundStyle(.green)
                .textCase(.uppercase)
            }
            titleView
            amountView
            infoView
            statusView
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity)
        .frame(height: table.status == .ready ? 240 : 200)
        .onReceive(
            Timer.publish(
                every: 1,
                on: .main,
                in: .common
            ).autoconnect()
        ) { value in

            now = value
        }
        .cardStyle()
        .overlay {

            if table.status == .ready {

                RoundedRectangle(cornerRadius: AppRadius.large)
                    .stroke(.green.opacity(0.35), lineWidth: 1.5)
            }
        }
        .background {

            if table.status == .ready {

                RoundedRectangle(cornerRadius: AppRadius.large)
                    .fill(.green.opacity(0.06))
            }
        }
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

            Label(tableDuration, systemImage: "clock")
        }
        .font(AppTypography.body)
    }
    
    private var statusView: some View {

        Group {

            if table.status == .ready {

                Label("SERVE FOOD", systemImage: "fork.knife.circle.fill")
                    .font(AppTypography.badge.weight(.bold))
                    .foregroundStyle(.green)
                    .padding(.horizontal, AppSpacing.medium)
                    .padding(.vertical, AppSpacing.small)
                    .background(Color.green.opacity(0.15))
                    .clipShape(Capsule())
            } else {

                StatusBadge(
                    title: table.status.title,
                    color: table.status.color
                )
            }
        }
    }
    
    private var tableDuration: String {

        guard let startedAt = table.startedAt else {
            return "0 m"
        }

        let minutes = Int(now.timeIntervalSince(startedAt) / 60)

        return "\(minutes) m"
    }
}

// MARK: - Preview

#Preview {
    TableCard(
        table: Table(
            number: 7,
            guestCount: 4,
            totalAmount: 1280,
            startedAt: nil,
            status: .preparing
        )
    )
    .padding()
}
