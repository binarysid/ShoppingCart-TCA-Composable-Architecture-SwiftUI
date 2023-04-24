//
//  ProductListClient.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 23/4/23.
//

import ComposableArchitecture
import WebService

struct ProductListClient {
    var fetch: @Sendable () async throws -> [Product]
}

private enum ProductListClientKey: DependencyKey {
    static let liveValue = ProductListClient(
        fetch: {
            let service = ProductService()
            let products = try await service.fetchProductList()
            return products
        }
    )
//    static var testValue: ProductListClient
}

extension DependencyValues {
  var productListClient: ProductListClient {
    get { self[ProductListClientKey.self] }
    set { self[ProductListClientKey.self] = newValue }
  }
}
