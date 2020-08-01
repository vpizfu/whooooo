//
//  SignInPresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol SignInPresenterDelegate {
    
}


class SignInPresenter: CredentialInputPresenter {
    
    var confirmationCompletion: (() -> ())!
    var delegate: SignInPresenterDelegate?
    let service: AuthenticationService
    
    init(service: AuthenticationService) {
        self.service = service
    }
    
    func confirmTapWithContent(_ email: String, password: String) {
        self.service.signInCredentials(email: email, password: password) { [weak self] (error) in
            guard error == nil else { return }
            self?.confirmationCompletion()
        }
    }
    
}
