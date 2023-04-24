//
//  PlusMinusButton.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 19/4/23.
//

import SwiftUI
import ComposableArchitecture

struct PlusMinusButton: View {
    let store: StoreOf<AddToCartReducer>
    var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStoreOf<AddToCartReducer>) in // explicitly specify the type of the view store improves the compiler’s ability to type-check the view resulting in a improved compile time for large project with complex views
            VStack {
                Text("\(viewStore.counter)")
                HStack {
                    Button {
                        viewStore.send(.didTapPlus)
                    } label: {
                        Text("+")
                    }
                    Spacer()
                    Button {
                        viewStore.send(.didTapMinus)
                    } label: {
                        Text("-")
                    }
                }
            }
        }
    }
}

struct PlusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusMinusButton(store: Store(initialState: AddToCartReducer.State(), reducer: AddToCartReducer()))
    }
}
