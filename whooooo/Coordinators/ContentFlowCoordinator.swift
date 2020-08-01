//
//  ContentFlowCoordinator.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import UIKit

class ContentFlowCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let presenter = VotesCollectionPresenter()
        let controller = VotesCollectionController(presenter: presenter)
        
        
        presenter.selectionCompletion = { [weak self] vote in
            self?.showDetailSceneForVote(vote)
        }
        
        self.navigationController.setViewControllers([controller], animated: true)
        controller.showNavigationBar()
        controller.navigationController?.navigationItem.backBarButtonItem = nil
    }
    
    func showDetailSceneForVote(_ vote: VoteObject) {
        let presenter = DetailVotePresenter(vote: vote)
        let controller = DetailVoteViewController(presenter: presenter)
        self.navigationController.pushViewController(controller, animated: true)
        controller.showNavigationBar()
    }
}
