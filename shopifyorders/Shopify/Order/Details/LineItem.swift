//
//  LineItem.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

class LineItem: Decodable {
    var id: Int!
    var title: String!
    var name: String!
    var quantity: Int!
    var price: String!
    var sku: String!
}
