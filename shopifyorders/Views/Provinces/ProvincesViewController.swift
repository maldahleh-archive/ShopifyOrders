//
//  ProvincesViewController.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-16.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ProvincesViewController: UIViewController {
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var provinceTable: UITableView!
    
    // MARK: - Class Attributes
    var provinceOrders: OrderedDictionary<String, Order>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        provinceTable.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension ProvincesViewController: UITableViewDataSource {
    // MARK: - Count methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return provinceOrders.totalKeys()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let ordersForIndex = provinceOrders.valueAt(index: section) else { return 0 }
        
        return ordersForIndex.count
    }
    
    // MARK: - Display methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let ordersForIndex = provinceOrders.valueAt(index: section) else { return nil }
        
        return "\(provinceOrders.keyAt(index: section)) (Total: \(ordersForIndex.count))"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
