//
//  YearCell.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class YearCell: UITableViewCell {
    @IBOutlet weak var orderNumberCell: UILabel!
    @IBOutlet weak var subTotalCell: UILabel!
    @IBOutlet weak var discountsCell: UILabel!
    @IBOutlet weak var totalPriceCell: UILabel!
    
    func formatWith(order: Order) {
        orderNumberCell.text = String(order.orderNumber)
        
        subTotalCell.text = formatOptionalString(order.subtotalPrice)
        discountsCell.text = formatOptionalString(order.totalDiscounts)
        totalPriceCell.text = formatOptionalString(order.totalPrice)
    }
}

extension YearCell {
    fileprivate func formatOptionalString(_ string: String?) -> String {
        if let string = string {
            return "$\(string)"
        } else {
            return "$0.00"
        }
    }
}
