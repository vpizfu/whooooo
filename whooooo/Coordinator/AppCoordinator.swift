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

class AppCoordinator: Coordinator, AuthFlowCoordinatorDelegate, ContentFlowCoordinatorDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = StartViewController()
        self.navigationController.pushViewController(controller, animated: true)
        controller.hideNavigationBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
            if(AuthenticationManager().isUserAuthenticated()) {
                self?.showContentFlow()
            } else {
                self?.showAuthorizationFlow()
            }
        }
    }
    
    func showAuthorizationFlow() {
        let coordinator = AuthFlowCoordinator(navigationController: self.navigationController, delegate: self)
        self.childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func showContentFlow() {
        let coordinator = ContentFlowCoordinator(navigationController: self.navigationController, delegate: self)
        self.childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    // MARK: AuthFlowCoordinatorDelegate
    
    func userDidAuthenticate() {
        self.childCoordinators.removeLast()
        showContentFlow()
    }
    
    // MARK: ContentFlowCoordinatorDelegate
    
    func userDidLogout() {
        self.childCoordinators.removeLast()
        showAuthorizationFlow()
    }

}
