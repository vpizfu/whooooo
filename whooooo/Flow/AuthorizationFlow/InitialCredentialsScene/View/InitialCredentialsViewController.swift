//
//  InitialCredentialsViewController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit
import FirebaseAuth

class InitialCredentialsViewController: BaseViewController, InitialCredentialsPresenterDelegate {

    let presenter: InitialCredentialsPresenter!
    
    init(presenter: InitialCredentialsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var signInButton: WButton = {
        let view = WButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var signUpButton: WButton = {
        let view = WButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        
        view.backgroundColor = .white
        
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        signUpButton.titleText = "Sign up"
        signInButton.titleText = "Sign in"
        
        signUpButton.addTarget(presenter, action: #selector(presenter.signUpTap), for: .touchUpInside)
        signInButton.addTarget(presenter, action: #selector(presenter.signInTap), for: .touchUpInside)
    }
}
