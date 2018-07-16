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

// MARK: - Navigation
extension ProvincesViewController {
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
    private static let CellIdentifier = "OrderCell"
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let ordersForIndex = provinceOrders.valueAt(index: section) else { return nil }
        
        return "\(provinceOrders.keyAt(index: section)) (Total: \(ordersForIndex.count))"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProvincesViewController.CellIdentifier, for: indexPath)
        guard let order = provinceOrders.elementAt(index: indexPath.section, subindex: indexPath.row),
            let textLabel = cell.detailTextLabel else { return UITableViewCell() }
        
        textLabel.text = String(order.orderNumber)
        return cell
    }
}
