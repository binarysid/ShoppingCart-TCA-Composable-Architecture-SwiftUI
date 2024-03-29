//
//  ProductCell.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 20/4/23.
//

import SwiftUI
import ComposableArchitecture
import MockDataBuilder

struct ProductCell: View {
    let store: StoreOf<ProductReducer>
    var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStoreOf<ProductReducer>) in // explicitly specify the type of the view store improves the compiler’s ability to type-check the view resulting in a improved compile time for large project with complex views
            HStack {
                Text("Total price: $\(viewStore.totalPrice)")
                VStack{
                    Text("\(viewStore.product.title)")
                    Text("\(viewStore.product.description)")
                }
                AddToCartButton(store: self.store.scope(state: \.addToCartState, action: ProductReducer.Action.addToCart))
            }
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static let productData = MockDataBuilder.buildFrom(bundle: .main, resource: "products", extensions: "json", type: ProductData.self)!
    static var previews: some View {
        ProductCell(store: Store(initialState: ProductReducer.State(id: UUID(), product: productData.products.first!), reducer: ProductReducer()))
    }
}
