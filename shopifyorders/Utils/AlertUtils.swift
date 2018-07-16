//
//  AlertUtils.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-16.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class AlertUtils {
    private static let AlertHeader = "Shopify Orders"
    
    static func presentAlertWith(viewController controller: UIViewController, message: String) {
        let alertController = UIAlertController(title: AlertUtils.AlertHeader, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
}
