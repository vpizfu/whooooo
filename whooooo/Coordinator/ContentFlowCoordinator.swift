//
//  ContentFlowCoordinator.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class ContentFlowCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
//        let container = ManageSplitController()
        
        let presenter = VotesCollectionPresenter()
        
        let contentController = VotesCollectionController(presenter: presenter)
        let contentNav = UINavigationController(rootViewController:contentController)
        
        let menuController = MenuViewController()
        let menuNav = SideMenuNavigationController(rootViewController: menuController)
        
        presenter.selectionCompletion = { [weak self] vote in
            self?.showDetailSceneForVote(vote)
        }
        
        SideMenuManager.default.leftMenuNavigationController = menuNav
        SideMenuManager.default.addPanGestureToPresent(toView: menuNav.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: contentController.view)
//        container.viewControllers = [menuNav, contentNav]
//
//        container.modalPresentationStyle = .fullScreen
        
        self.navigationController.setViewControllers([contentController], animated: true)
        contentController.showNavigationBar()
    }
    
    func showDetailSceneForVote(_ vote: VoteObject) {
        let presenter = DetailVotePresenter(vote: vote)
        let controller = DetailVoteViewController(presenter: presenter)
        self.navigationController.pushViewController(controller, animated: true)
        controller.showNavigationBar()
    }
}
