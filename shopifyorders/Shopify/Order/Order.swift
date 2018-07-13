//
//  Order.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class Order: Decodable {
    var id: Int!
    var email: String!
    var number: Int!
    var orderNumber: Int!
    var test: Bool!
    
    var processedAt: String?
    var createdAt: String?
    var updatedAt: String?
    var closedAt: String?
    
    var token: String?
    var gateway: String?
    
    var financialStatus: String!
    var confirmed: Bool!
    var totalLineItemsPrice: String!
    var subtotalPrice: String!
    var totalDiscounts: String!
    var totalPrice: String!
    var totalPriceUSD: String!
    var currency: String!
    
    var taxesIncluded: Bool!
    var totalTax: String!
    
    var totalWeight: Int!
    
    var name: String!
    var userID: Int!
    var billingAddress: BillingAddress!
    var shippingAddress: ShippingAddress!
    
    var lineItems: [LineItem]?
    
    var orderStatusURL: String!
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case number
        case orderNumber = "order_number"
        case test
        case processedAt = "processed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case token
        case gateway
        case financialStatus = "financial_status"
        case confirmed
        case totalLineItemsPrice = "total_line_items_price"
        case subtotalPrice = "subtotal_price"
        case totalDiscounts
        case totalPrice = "total_price"
        case totalPriceUSD = "total_price_usd"
        case currency
        case taxesIncluded = "taxes_included"
        case totalTax = "total_tax"
        case totalWeight = "total_weight"
        case name
        case userID = "user_id"
        case billingAddress = "billing_address"
        case shippingAddress = "shipping_address"
        case lineItems = "line_items"
        case orderStatusURL = "order_status_url"
    }
}
