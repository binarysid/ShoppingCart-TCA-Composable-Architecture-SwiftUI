//
//  ProductListView.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 24/4/23.
//

import SwiftUI
import ComposableArchitecture
import MockDataBuilder

struct ProductListView: View {
    let store: StoreOf<ProductListReducer>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            List {
                ForEachStore(
                    self.store.scope(state: \.products, action: ProductListReducer.Action.product(id:action:)
                    )
                ) { store in
                    ProductCell(store: store)
                }
            }
            .buttonStyle(.borderless)
            .task {
                viewStore.send(.fetch)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static let productData = MockDataBuilder.buildFrom(bundle: .main, resource: "products", extensions: "json", type: ProductData.self)!

    static var previews: some View {
        ProductListView(store:
            Store(initialState: ProductListReducer.State(),
                  reducer: ProductListReducer()) {
                $0.productListClient.fetch = {
                    await productData.products
                }
            }
        )
    }
}
