//
//  DineFlowApp.swift
//  DineFlow
//
//  Created by Razi Khan on 11/07/26.
//

import SwiftUI

@main
struct DineFlowApp: App {

    @State private var store = RestaurantStore()

    var body: some Scene {

        WindowGroup {

            RootTabView()
                .environment(store)
        }
    }
}
