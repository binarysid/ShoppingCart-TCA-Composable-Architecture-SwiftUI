//
//  EndPoints.swift
//  GithubUserSearch
//
//  Created by Linkon Sid on 23/3/23.
//

import Foundation
import URLRequestBuilder // this package has been developed by this author for reusability purpose

enum EndPoints {
    static let baseURL =  "https://binarysid.github.io/profile/api/"
    static let requestBuilder = URLRequestBuilder()

    case fetchProduct

    var request: URLRequest? {
        switch self {
        case .fetchProduct:
            let url = EndPoints.baseURL + "products.json"
            return EndPoints.requestBuilder.createRequestWith(baseURL: url)
        }
    }
}
