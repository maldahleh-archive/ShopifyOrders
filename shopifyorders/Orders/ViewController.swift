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
    
    // MARK: - Class attributes
    let shopifyClient = ShopifyClient()
    let downloadedOrders = DownloadedOrders()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                print("Error \(error.localizedDescription)")
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
