//
//  ProductReducer.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 20/4/23.
//

import ComposableArchitecture

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
            return .none
        case .addToCart(.didTapMinus):
            state.addToCartState.counter = max(0, state.addToCartState.counter)
            return .none
        }
    }
    struct State: Equatable {
        let product: Product
        var addToCartState = AddToCartReducer.State()
    }

    enum Action: Equatable {
        case addToCart(AddToCartReducer.Action)
    }
}

