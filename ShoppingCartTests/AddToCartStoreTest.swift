//
//  AddToCartStoreTest.swift
//  ShoppingCartTests
//
//  Created by Linkon Sid on 26/4/23.
//

import XCTest
import ComposableArchitecture
@testable import ShoppingCart

@MainActor
final class AddToCartStoreTest: XCTestCase {
    private typealias StoreType = TestStore<AddToCartReducer.State,  AddToCartReducer.Action, AddToCartReducer.State, AddToCartReducer.Action, ()>
    
    func test_counter_increment() async {
        let store = createTestStore()
        await store.send(.didTapPlus) {
            $0.counter = 1
        }
    }

    func test_counter_decrement() async {
        let store = createTestStore()
        store.exhaustivity = .off // provokes non-exhaustive tests
        await store.send(.didTapPlus)
        await store.send(.didTapMinus) {
            $0.counter = 0
        }
    }
    
    private func createTestStore() ->  StoreType{
        TestStore(initialState: AddToCartReducer.State(), reducer: AddToCartReducer())
    }
}
