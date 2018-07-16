//
//  ProvinceTableDataSource.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ProvinceTableDataSource: NSObject {
    private static let ProvinceCellIdentifier = "ProvinceCell"
    
    var provinceOrders: OrderedDictionary<String, Order> = OrderedDictionary(inIncreasingOrder: true)
    
    func addOrder(_ order: Order, withProvince province: String) {
        provinceOrders.insert(order, forKey: province)
    }
}

// MARK: - UITableViewDataSource
extension ProvinceTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinceOrders.totalKeys()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orders = provinceOrders.valueAt(index: indexPath.row) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProvinceTableDataSource.ProvinceCellIdentifier, for: indexPath)
        guard let mainLabel = cell.textLabel, let detailLabel = cell.detailTextLabel else { return UITableViewCell() }
        mainLabel.text = provinceOrders.keyAt(index: indexPath.row)
        detailLabel.text = String(orders.count)
        
        return cell
    }
}
