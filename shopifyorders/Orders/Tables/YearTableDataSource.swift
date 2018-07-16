//
//  YearTableDataSource.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class YearTableDataSource: NSObject {
    private static let YearCellIdentifier = "YearCell"
    
    private var yearOrders: OrderedDictionary<Int, Order> = OrderedDictionary()
    
    func addOrder(_ order: Order, withYear year: Int) {
        yearOrders.insert(order, forKey: year)
    }
}

// MARK: - UITableViewDataSource
extension YearTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yearOrders.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orders = yearOrders.valueAt(index: indexPath.row) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: YearTableDataSource.YearCellIdentifier, for: indexPath)
        cell.textLabel?.text = String(yearOrders.keyAt(index: indexPath.row))
        cell.detailTextLabel?.text = String(orders.count)
        
        return cell
    }
}
