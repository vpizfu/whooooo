//
//  SignInPresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import FirebaseAuth

class SignInPresenter: CredentialInputPresenter {
    
    var confirmationCompletion: (() -> ())!
    var delegate: CredentialInputPresenterDelegate?
    let service: AuthenticationService
    
    init(service: AuthenticationService) {
        self.service = service
    }
    
    func setupDelegate(delegate: CredentialInputPresenterDelegate) {
        self.delegate = delegate
    }
    
    func confirmTapWithContent(email: String, password: String, login: String?) {
        guard email.count > 0, password.count > 0 else {
            self.delegate?.emptyCredentials()
            return
        }
        self.service.signInCredentials(email: email, password: password) { [weak self] (error) in
            guard error == nil else { return }
            self?.confirmationCompletion()
        }
    }
}
