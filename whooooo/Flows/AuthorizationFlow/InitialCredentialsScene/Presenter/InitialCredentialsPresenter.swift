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

class InitialCredentialsPresenter {
    
    var signInCompletion: (() -> ())?
    var signUpCompletion: (() -> ())?
    
    var delegate: InitialCredentialsPresenterDelegate?
    
    @objc public  func signInTap() {
        signInCompletion?()
    }
    
    @objc public  func signUpTap() {
        signUpCompletion?()
    }
    
    
}
