//
//  FieldsValidation.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 16.09.22.
//

import Foundation
import UIKit

final class FieldsValidation {
    static var shared = FieldsValidation()
    private init() {}
    
    func validateFields(from textFieldsArr: [UITextField] , password: UITextField, rePassword : UITextField) -> String? {
        for i in 0..<textFieldsArr.count {
            if textFieldsArr[i].text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                return "Please Fill In All Fields"
            }
        }
        let cleanPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanPassword) == false  {
            return  "Please make sure your password is minimum 8 characters, at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:"
        } else if password.text != rePassword.text {
            return "Passwords do not match"
        }
        
        return nil
    }
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    
}
