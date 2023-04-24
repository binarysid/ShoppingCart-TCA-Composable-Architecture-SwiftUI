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
        WithViewStore(self.store) { (viewStore: ViewStoreOf<AddToCartReducer>) in // explicitly specify the type of the view store improves the compiler’s ability to type-check the view resulting in a improved compile time for large project with complex views
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
