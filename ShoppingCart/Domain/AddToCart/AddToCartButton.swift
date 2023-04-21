//
//  AddToCartButton.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 19/4/23.
//

import SwiftUI
import ComposableArchitecture

struct AddToCartButton: View {
    let store: StoreOf<AddToCartReducer>
    var body: some View {
        WithViewStore(self.store) { viewStore in
            if viewStore.counter > 0 {
                PlusMinusButton(store: store)
            }
            else {
                Button {
                    viewStore.send(.didTapPlus)
                } label: {
                    Text("ADD to Cart")
                }
            }
        }
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(store: Store(initialState: AddToCartReducer.State(), reducer: AddToCartReducer()))
    }
}
