//
//  ShoppingCartApp.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 19/4/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct ShoppingCartApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ProductListView(store: Store(initialState: ProductListReducer.State(), reducer: ProductListReducer()))
        }
    }
}
