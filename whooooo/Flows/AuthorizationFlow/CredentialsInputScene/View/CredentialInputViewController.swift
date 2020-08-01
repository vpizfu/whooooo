//
//  PhoneInputViewController.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

protocol CredentialInputPresenter {
    func confirmTapWithContent(_ email: String, password: String)
    var confirmationCompletion: (() -> ())! {get set}
}

class CredentialInputViewController: BaseViewController {

    private var presenter: CredentialInputPresenter!
    
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
    
    lazy var confirmButton: UIButton = {
        let view = UIButton()
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
    
        view.backgroundColor = .white
        
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmButton)
        
        confirmButton.addTarget(self, action: #selector(confirmButtonTap(_:)), for: .touchUpInside)
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        
        setupConstraints()
    }
    
    @objc func confirmButtonTap(_ sender: UIButton) {
        guard let email = self.emailField.text,
            let password = self.passwordField.text,
            email.count > 0,
            password.count > 0 else { return }
        self.presenter.confirmTapWithContent(email,password:  password)
    }
    
    func setupConstraints() {
        let safeGuide = view.safeAreaLayoutGuide
        emailField.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 50).isActive = true
        emailField.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20).isActive = true

        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20).isActive = true
        
        confirmButton.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 50).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -50).isActive = true
        confirmButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 50).isActive = true
    }
}

extension CredentialInputViewController: SignUpPresenterDelegate {
    
}
