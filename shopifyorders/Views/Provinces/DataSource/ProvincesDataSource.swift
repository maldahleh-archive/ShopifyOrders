//
//  ProvincesDataSource.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-16.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ProvincesDataSource: NSObject {
    let provinceOrders: OrderedDictionary<String, Order>
    
    init(provinceOrders: OrderedDictionary<String, Order>) {
        self.provinceOrders = provinceOrders
    }
}

// MARK: - UITableViewDataSource
extension ProvincesDataSource: UITableViewDataSource {
    // MARK: - Count methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return provinceOrders.totalKeys()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let ordersForIndex = provinceOrders.valueAt(index: section) else { return 0 }
        
        return ordersForIndex.count
    }
    
    // MARK: - Display methods
    private static let CellIdentifier = "OrderCell"
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let ordersForIndex = provinceOrders.valueAt(index: section) else { return nil }
        
        return "\(provinceOrders.keyAt(index: section)) (Total: \(ordersForIndex.count))"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProvincesDataSource.CellIdentifier, for: indexPath)
        guard let order = provinceOrders.elementAt(index: indexPath.section, subindex: indexPath.row),
            let textLabel = cell.detailTextLabel else { return UITableViewCell() }
        
        textLabel.text = String(order.orderNumber)
        return cell
    }
}
