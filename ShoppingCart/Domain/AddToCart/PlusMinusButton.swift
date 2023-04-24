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
        WithViewStore(self.store) { viewStore in
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
