//
//  RootTabView.swift
//  DineFlow
//
//  Created by Razi Khan on 12/07/26.
//

import SwiftUI

struct RootTabView: View {

    var body: some View {

        TabView {

            TablesView()
                .tabItem {
                    Label("Tables", systemImage: "tablecells")
                }

            KitchenView()
                .tabItem {
                    Label("Kitchen", systemImage: "fork.knife")
                }
        }
    }
}

#Preview {
    RootTabView()
}
