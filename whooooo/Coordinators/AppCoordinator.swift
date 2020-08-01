//
//  AppCoordinator.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 7/31/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class AppCoordinator: Coordinator, AuthFlowCoordinatorDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = StartViewController()
        self.navigationController.pushViewController(controller, animated: true)
        controller.hideNavigationBar()
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.4) { [weak self] in
            if(AuthenticationManager().isUserAuthenticated()) {
                self?.showContentFlow()
            } else {
                self?.showAuthorizationFlow()
            }
        }
    }
    
    func showAuthorizationFlow() {
        DispatchQueue.main.async {
            self.navigationController.popViewController(animated: true)
            let coordinator = AuthFlowCoordinator(navigationController: self.navigationController, delegate: self)
            self.childCoordinators.append(coordinator)
            coordinator.start()
        }
    }
    
    func showContentFlow() {
        DispatchQueue.main.async {
            let controller = VotesCollectionController()
            let presenter = VotesCollectionPresenter()
            controller.presenter = presenter
            self.navigationController.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: AuthFlowCoordinatorDelegate
    
    func userDidAuthenticate() {
        self.childCoordinators.removeLast()
        self.navigationController.popViewController(animated: true)
        showContentFlow()
    }

}
