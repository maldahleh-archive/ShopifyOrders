//
//  ShopifyClient.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class ShopifyClient: APIClient {
    static let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
    
    let session = URLSession(configuration: .default)
    let jsonDecoder = JSONDecoder()
    
    // MARK: - Orders
    typealias OrderCompletionHandler = (Result<Orders, APIError>) -> Void
    
    func ordersWith(page: Int, completion: @escaping OrderCompletionHandler) {
        let request = Shopify.orders(page: page).request
        
        fetchWith(request, decode: Orders.self, completion: completion)
    }
}
