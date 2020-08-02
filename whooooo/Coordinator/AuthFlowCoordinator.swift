//
//  AuthFlowCoordinator.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import UIKit

protocol AuthFlowCoordinatorDelegate {
    func userDidAuthenticate()
}

class AuthFlowCoordinator: Coordinator {
    
    var delegate: AuthFlowCoordinatorDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    
    init(navigationController: UINavigationController, delegate: AuthFlowCoordinatorDelegate) {
        self.navigationController = navigationController
        self.childCoordinators = []
        self.delegate = delegate
    }
    
    func start() {
        let presenter = InitialCredentialsPresenter()
        let controller = InitialCredentialsViewController(presenter: presenter)

        presenter.signInCompletion = {
            self.startSignInScene()
        }
        
        presenter.signUpCompletion = {
            self.startSignUpScene()
        }
        
        self.navigationController.setViewControllers([controller], animated: true)
    }
    
    func startSignInScene() {
        let presenter = SignInPresenter(service: AuthenticationManager())
        let controller = CredentialInputViewController(presenter: presenter)
        presenter.confirmationCompletion = { [weak self] in
            self?.delegate?.userDidAuthenticate()
        }
        self.navigationController.pushViewController(controller, animated: true)
        controller.showNavigationBar()
        controller.contentMode = .signIn
        
    }
    
    func startSignUpScene() {
        let presenter = SignUpPresenter(service: AuthenticationManager())
        let controller = CredentialInputViewController(presenter: presenter)
        presenter.confirmationCompletion = { [weak self] in
            self?.delegate?.userDidAuthenticate()
        }
        self.navigationController.pushViewController(controller, animated: true)
        controller.showNavigationBar()
    }
    
    
}
