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
    lazy var dataSource: ProvincesDataSource = {
        return ProvincesDataSource(provinceOrders: provinceOrders)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        provinceTable.dataSource = dataSource
    }
}

// MARK: - Navigation
extension ProvincesViewController {
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
