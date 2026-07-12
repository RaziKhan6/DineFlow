//
//  KitchenView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct KitchenView: View {

    @State private var viewModel = KitchenViewModel()

    var body: some View {

        NavigationStack {

            ScrollView {

                LazyVStack(spacing: AppSpacing.large) {

                    ForEach(viewModel.tickets) { ticket in

                        KitchenTicketCard(ticket: ticket)
                    }
                }
                .padding()
            }
            .navigationTitle("Kitchen")
        }
    }
}
