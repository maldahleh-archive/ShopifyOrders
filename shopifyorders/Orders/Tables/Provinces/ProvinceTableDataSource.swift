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
    
    private var provinceOrders: OrderedDictionary<String, Order> = OrderedDictionary()
    
    func addOrder(_ order: Order, withProvince province: String) {
        provinceOrders.insert(order, forKey: province)
    }
}

// MARK: - UITableViewDataSource
extension ProvinceTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinceOrders.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orders = provinceOrders.valueAt(index: indexPath.row) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProvinceTableDataSource.ProvinceCellIdentifier, for: indexPath)
        cell.textLabel?.text = provinceOrders.keyAt(index: indexPath.row)
        cell.detailTextLabel?.text = String(orders.count)
        
        return cell
    }
}
