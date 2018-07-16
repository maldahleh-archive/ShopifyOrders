//
//  ViewController.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-09.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Interface Builder Outlets
    @IBOutlet weak var updatingLabel: UILabel!
    @IBOutlet weak var provinceTable: UITableView!
    @IBOutlet weak var yearTable: UITableView!
    
    // MARK: - Class attributes
    let shopifyClient = ShopifyClient()
    
    let provinceDataSource = ProvinceTableDataSource()
    let yearDataSource = YearTableDataSource()
    lazy var downloadedOrders: DownloadedOrders = {
        return DownloadedOrders(provinceTable: provinceTable, provinceDataSource: provinceDataSource, yearTable: yearTable, yearDataSource: yearDataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.provinceTable.dataSource = provinceDataSource
        self.yearTable.dataSource = yearDataSource
        
        updateData()
    }
}

// MARK: - Downloading
extension ViewController {
    typealias DataCompletionHandler = () -> Void
    
    private func updateData() {
        updatingLabel.isHidden = false
        downloadDataFor(page: 1) {
            self.updatingLabel.isHidden = true
        }
    }
    
    private func downloadDataFor(page: Int, completion: @escaping DataCompletionHandler) {
        shopifyClient.ordersWith(page: page) { [weak self] result in
            switch result {
            case .failure(let error):
                AlertUtils.presentAlertWith(viewController: self!, message: "An error occurred, please try again later.\nError: \(error.description)")
                completion()
            case .success(let downloaded):
                if !downloaded.orders.isEmpty {
                    self?.downloadedOrders.addOrders(downloaded.orders)
                    self?.downloadDataFor(page: page + 1, completion: completion)
                } else {
                    completion()
                }
            }
        }
    }
}
