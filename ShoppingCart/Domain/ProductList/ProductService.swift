//
//  ProductService.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 23/4/23.
//

import Foundation
import WebService

struct ProductService: WebService {
    func fetchProductList() async throws -> [Product] {
        guard let request = EndPoints.fetchProduct.request else {
            throw NetworkError.badURL
        }
        do {
            let (data, response) = try await fetch(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard httpResponse.statusCode == 200 else {
                throw NetworkError.serviceNotFound
            }
            let result = try decode(type: ProductData.self, from: data)
            guard result.products.count > 0 else { throw NetworkError.noDataFound }
            return result.products
        } catch {
            throw NetworkError.invalidJson
        }
    }
}
