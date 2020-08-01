//
//  PhoneInputPresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

protocol SignUpPresenterDelegate {
    
}

class SignUpPresenter: CredentialInputPresenter {
        
    var confirmationCompletion: (() -> ())!
    var delegate: SignUpPresenterDelegate?
    let service: AuthenticationService
    
    init(service: AuthenticationService) {
        self.service = service
    }
    
    func setupDelegate(delegate: SignUpPresenterDelegate) {
        self.delegate = delegate
    }    
    
    // TODO: input validation
    func confirmTapWithContent(_ email: String, password: String) {
        self.service.signUpCredentials(email: email, password: password) { [weak self] (error) in
            guard error == nil else { return }
            self?.confirmationCompletion()
        }
    }
    
}
