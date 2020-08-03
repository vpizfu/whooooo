//
//  InitialCredentialsPresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation

protocol InitialCredentialsPresenterDelegate {
    
}


class InitialCredentialsPresenter: CredentialInputPresenter {
    
    
    
    var confirmationCompletion: (() -> ())!
    let service: AuthenticationService
    
    init(service: AuthenticationService) {
        self.service = service
    }
    
  
    
    func authorizeCredentials(email: String, password: String, login: String?, completion: @escaping (Error?) -> Void) {
        if let login = login {
            service.signUpCredentials(email: email, password: password, login: login) { [weak self] (error) in
                guard error == nil else { completion(error); return }
                completion(nil);
                self?.confirmationCompletion()
                return
            }
            return
        }
        
        service.signInCredentials(email: email, password: password) { [weak self] (error) in
            guard error == nil else { completion(error); return }
            completion(nil);
            self?.confirmationCompletion()
        }
    }
}
