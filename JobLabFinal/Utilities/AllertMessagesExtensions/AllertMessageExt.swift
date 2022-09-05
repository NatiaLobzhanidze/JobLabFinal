//
//  AllertMessageExt.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 01.09.22.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(alertText : String, alertMessage : String, addActionTitle: String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: addActionTitle, style: .cancel))
        
        self.present(alert, animated: true, completion: nil)
    }
}
