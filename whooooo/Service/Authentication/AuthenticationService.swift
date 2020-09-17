//
//  AuthenticationService.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol AuthenticationService {
    func isUserAuthenticated() -> Bool
    func signInCredentials(email: String, password: String, completion: @escaping (Error?) -> ())
    func signUpCredentials(email: String, password: String, login: String, completion: @escaping (Error?) -> ())
    func currentUserIdentifier() -> String?
    func signOut()
}


class AuthenticationManager: AuthenticationService {
    
    private let key: String = "authVerificationID"
    
    func signInCredentials(email: String, password: String, completion: @escaping (Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    
    func signUpCredentials(email: String, password: String, login: String, completion: @escaping (Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard error == nil else {
                completion(error)
                return
            }
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = login
            changeRequest?.commitChanges { (error) in
                guard error == nil else {
                    completion(error)
                    return
                }
            }
            completion(nil)
        }
    }
    
    func isUserAuthenticated() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func currentUserIdentifier() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    func signOut() {
        try! Auth.auth().signOut()
    }
    
}
