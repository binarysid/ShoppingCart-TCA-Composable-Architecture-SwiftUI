//
//  ProductData.swift
//  ShoppingCart
//
//  Created by Linkon Sid on 19/4/23.
//
import Foundation

// MARK: - Product Model
struct ProductData: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Equatable {
    let id: Int
    let title, description: String
    let price: Double
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
