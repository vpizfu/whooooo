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

protocol ContentFlowCoordinatorDelegate {
    func userDidLogout()
}

class ContentFlowCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var delegate: ContentFlowCoordinatorDelegate?

    init(navigationController: UINavigationController, delegate: ContentFlowCoordinatorDelegate) {
        self.navigationController = navigationController
        self.childCoordinators = []
        self.delegate = delegate
    }
    
    func start() {
//        let container = ManageSplitController()
        
        let presenter = VotesCollectionPresenter()
        
        let contentController = VotesCollectionController(presenter: presenter)
        
        let menuController = MenuViewController()
        
        
        presenter.selectionCompletion = { [weak self] vote in
            self?.showDetailSceneForVote(vote)
        }
        
        presenter.logoutCompletion = { [weak self] in
            self?.delegate?.userDidLogout()
        }
        
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
