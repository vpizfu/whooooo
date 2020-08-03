//
//  PhoneInputViewController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

protocol CredentialInputPresenterDelegate {
    func emptyCredentials()
}

protocol CredentialInputPresenter {
    
    var delegate: CredentialInputPresenterDelegate? {get set}
    var confirmationCompletion: (() -> ())! {get set}
    
    func confirmTapWithContent(email: String, password: String, login: String?)
    func setupDelegate(delegate: CredentialInputPresenterDelegate)
}

class CredentialInputViewController: BaseViewController, CredentialInputPresenterDelegate {

    enum ContentMode {
        case signUp, signIn
    }
    
    private var presenter: CredentialInputPresenter!
    
    var contentMode: ContentMode = .signUp
    
    lazy var emailField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .emailAddress
        view.borderStyle = .roundedRect
        view.placeholder = "Email"
        return view
    }()
    
    lazy var passwordField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        view.borderStyle = .roundedRect
        view.placeholder = "Password"
        return view
    }()
    
    lazy var loginField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.placeholder = "Nickname"
        return view
    }()
    
    lazy var confirmButton: WButton = {
        let view = WButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(presenter: CredentialInputPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.delegate = self
    
        view.backgroundColor = .white
        
        view.addSubview(emailField)
        view.addSubview(passwordField)
        if contentMode == .signUp {
            view.addSubview(loginField)
        }
        view.addSubview(confirmButton)
        
        
        confirmButton.addTarget(self, action: #selector(confirmButtonTap(_:)), for: .touchUpInside)
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        
        setupConstraints()
    }
    
    @objc func confirmButtonTap(_ sender: UIButton) {
        guard let email = self.emailField.text,
            let password = self.passwordField.text else { return }
        if contentMode == .signUp {
            guard let login = self.loginField.text else { return }
            self.presenter.confirmTapWithContent(email: email, password: password, login: login)
        } else {
            self.presenter.confirmTapWithContent(email: email, password: password, login: nil)
        }
    }
    
    func setupConstraints() {
        let safeGuide = view.safeAreaLayoutGuide
        
        emailField.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 50).isActive = true
        emailField.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20).isActive = true

        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20).isActive = true
        
        if contentMode == .signUp {
            loginField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30).isActive = true
            loginField.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20).isActive = true
            loginField.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20).isActive = true
            confirmButton.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 50).isActive = true
        } else {
            confirmButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 50).isActive = true
        }

        confirmButton.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 50).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -50).isActive = true
    }
    
    // MARK: CredentialInputPresenterDelegate
    
    func emptyCredentials() {
        print("Empty fields!")
    }
}

