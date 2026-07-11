//
//  TablesView.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

struct TablesView: View {

    @State private var viewModel = TablesViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: AppSpacing.medium)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: AppSpacing.large) {
                    ForEach(viewModel.tables) { table in
                        NavigationLink {
                            OrderView(table: table)
                        } label: {
                            TableCard(table: table)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(AppSpacing.large)
            }
            .navigationTitle("Tables")
        }
    }
}

#Preview {
    TablesView()
}
