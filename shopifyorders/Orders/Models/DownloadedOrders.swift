//
//  DownloadedOrders.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

class DownloadedOrders {
    let provinceDataSource: ProvinceTableDataSource
    var yearOrders: [Int: [Order]] = [:]
    
    init(provinceDataSource: ProvinceTableDataSource) {
        self.provinceDataSource = provinceDataSource
    }
    
    func addOrders(_ orders: [Order]) {
        for order in orders {
            // Discard orders missing key data
            guard let address = order.billingAddress, let province = address.province else { continue }
            guard let orderCreated = order.createdAt, let orderYear = Int(orderCreated.prefix(4)) else { continue }
            
            provinceDataSource.addOrder(order, withProvince: province)
            // MARK: Year
        }
    }
}
