//
//  DownloadedOrders.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class DownloadedOrders {
    let provinceTableView: UITableView
    let provinceDataSource: ProvinceTableDataSource
    let yearTableView: UITableView
    let yearDataSource: YearTableDataSource
    
    init(provinceTable: UITableView, provinceDataSource: ProvinceTableDataSource, yearTable: UITableView, yearDataSource: YearTableDataSource) {
        self.provinceTableView = provinceTable
        self.provinceDataSource = provinceDataSource
        self.yearTableView = yearTable
        self.yearDataSource = yearDataSource
    }
    
    func addOrders(_ orders: [Order]) {
        for order in orders {
            // Discard orders missing key data
            guard let address = order.billingAddress, let province = address.province else { continue }
            guard let orderCreated = order.createdAt, let year = Int(orderCreated.prefix(4)) else { continue }
            
            provinceDataSource.addOrder(order, withProvince: province)
            yearDataSource.addOrder(order, withYear: year)
            
            provinceTableView.reloadData()
            yearTableView.reloadData()
        }
    }
}
