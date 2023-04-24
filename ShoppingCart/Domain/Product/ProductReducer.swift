//
//  ProductReducer.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 20/4/23.
//

import ComposableArchitecture
import Foundation

struct ProductReducer: ReducerProtocol {
    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.addToCartState, action: /Action.addToCart) {
            AddToCartReducer()
        }
        Reduce(self.core)
    }

    func core(state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .addToCart(.didTapPlus):
            state.totalPrice += state.product.price
            return .none
        case .addToCart(.didTapMinus):
            state.addToCartState.counter = max(0, state.addToCartState.counter)
            state.totalPrice -= state.product.price
            state.totalPrice = max(0, state.totalPrice)
            return .none
        }
    }

    struct State: Equatable, Identifiable {
        let id: UUID
        let product: Product
        var addToCartState = AddToCartReducer.State()
        var totalPrice: Double = 0
    }

    enum Action: Equatable {
        case addToCart(AddToCartReducer.Action)
    }
}

