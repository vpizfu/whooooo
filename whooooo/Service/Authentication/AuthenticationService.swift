//
//  AuthenticationService.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation

protocol AuthenticationService {
    
    func isUserAuthenticated() -> Bool
    func setupIdentifier(_ identifier: String)
    func currentUserIdentifier() -> String?
    
}


class AuthenticationManager: AuthenticationService {
    
    func isUserAuthenticated() -> Bool {
        return UserDefaults.standard.value(forKey: "authVerificationID") != nil
    }
    
    func setupIdentifier(_ identifier: String) {
        UserDefaults.standard.setValue(identifier, forKey: "authVerificationID")
    }
    
    func currentUserIdentifier() -> String? {
        return UserDefaults.standard.string(forKey: "authVerificationID")
    }
    
}
