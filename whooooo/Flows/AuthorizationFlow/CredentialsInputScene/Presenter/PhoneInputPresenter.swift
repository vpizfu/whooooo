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

protocol PhoneInputPresenterDelegate {
    
}

class PhoneInputPresenter: CredentialInputPresenter {
        
    var confirmationCompletion: (() -> ())!
    var delegate: PhoneInputPresenterDelegate?
    var service: AuthenticationService
    
    init(service: AuthenticationService) {
        self.service = service
    }
    
    func setupDelegate(delegate: PhoneInputPresenterDelegate) {
        self.delegate = delegate
    }    
    
    // TODO: input validation
    func confirmTapWithContent(_ email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self,
                let uid = authResult?.user.uid,
                error == nil else { return }
            
            strongSelf.service.setupIdentifier(uid)
            strongSelf.confirmationCompletion()
        }
    }
    
}
