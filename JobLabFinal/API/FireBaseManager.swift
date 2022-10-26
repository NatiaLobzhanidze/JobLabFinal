//
//  FireBaseManager.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 16.09.22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

enum FireAuthError: Error {
    
    case invalidMail
    case invalidPassword
    case userDoesNotExist
}

final class FireBaseManager {
    
    static var shared = FireBaseManager()
    private init() {}
    typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void
    let userReference = Firestore.firestore().collection("users")
    
    func signIn<T: UITextField >(userMail: T, userPassword: T)  {
        
        guard let mail =  userMail.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password =  userPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
 
        Auth.auth().createUser(withEmail: mail, password: password) { (result, err) in
            _ = AuthErrorCode(_nsError: err! as NSError)
            if err != nil {
                print(err?.localizedDescription ?? "firebaseManager error")
            }  else {
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["mail" : mail, "password" : password ]){ err in
                if err != nil {
                    print("err != Nil")
                }
            }
        }
    }
}
    func handleFirebaseError(error: NSError, onComplete: Completion? ) {
        print(error.debugDescription)
       
    }
}
