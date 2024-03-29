//
//  TestReducer.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 19/4/23.
//

import ComposableArchitecture

struct AddToCartReducer: ReducerProtocol {
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .didTapPlus:
            state.counter += 1
            return .none
        case .didTapMinus:
            state.counter -= 1
            return .none
        }
    }

    struct State: Equatable {
        var counter = 0
    }

    enum Action: Equatable {
        case didTapPlus
        case didTapMinus
    }
}
