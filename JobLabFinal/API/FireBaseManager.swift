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

final class FireBaseManager {
    static var shared = FireBaseManager()
    private init() {}
    
    let userReference = Firestore.firestore().collection("users")
    
    func signIn<T: UITextField >(userMail: T, userPassword: T)  {
        
        guard let mail =  userMail.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let password =  userPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
 
        Auth.auth().createUser(withEmail: mail, password: password) { result,
            err in
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
    
//    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//      // ...
//    }
}
//    Future<String> signUp(String email, String password) async {
//      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//          email: email, password: password);
//      FirebaseUser user = result.user;
//      return user.uid;
//    }
//
//    Future<void> signOut() async {
//      _snapshotService.setWasteLessLifeUserObject({});
//      return _firebaseAuth.signOut();
//    }

