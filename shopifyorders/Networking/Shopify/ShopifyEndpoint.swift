//
//  ShopifyEndpoint.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

enum Shopify {
    case orders(page: Int)
}

extension Shopify: Endpoint {
    var base: String {
        return "https://shopicruit.myshopify.com"
    }
    
    var path: String {
        switch self {
        case .orders: return "/admin/orders.json"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .orders(let page):
            return [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "access_token", value: ShopifyClient.apiKey)
            ]
        }
    }
}
