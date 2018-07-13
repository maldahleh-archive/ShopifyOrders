//
//  Customer.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

class Customer: Decodable {
    var createdAt: String!
    var updatedAt: String!
    
    var id: Int!
    var firstName: String!
    var lastName: String!
    var email: String!
    var defaultAddress: Address!
    var state: String!
    
    var ordersCount: Int!
    var totalSpent: String!
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case defaultAddress = "default_address"
        case state
        case ordersCount = "orders_count"
        case totalSpent = "total_spent"
    }
}
