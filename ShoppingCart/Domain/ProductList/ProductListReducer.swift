//
//  ProductListReducer.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 22/4/23.
//

import Foundation
import ComposableArchitecture

struct ProductListReducer: ReducerProtocol {
    @Dependency(\.productListClient) var productListClient

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetch:
                return .task {
                    await .fetchResponse(TaskResult { try await self.productListClient.fetch() } )
                }
            case .fetchResponse(.success(let products)):
                state.products = IdentifiedArray(uniqueElements: products
                    .map{
                        ProductReducer.State(id: UUID(), product: $0)
                    }
                )
                return .none
            case .fetchResponse(.failure(let error)):
                print("error... \(error.localizedDescription)")
                return .none
            case .product:
                return .none
            }
        }
        .forEach(\.products, action: /Action.product(id:action:)) {
            ProductReducer()
        }
    }

    struct State: Equatable {
        var products: IdentifiedArrayOf<ProductReducer.State> = []
    }

    enum Action: Equatable {
        case fetch
        case fetchResponse(TaskResult<[Product]>)
        case product(id: ProductReducer.State.ID, action: ProductReducer.Action) // represents an action for product domain with any id
    }
}
