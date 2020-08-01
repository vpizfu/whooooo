//
//  DetailVotePresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation

class DetailVotePresenterDelegate {
    
}

class DetailVotePresenter {
    
    let vote: VoteObject
    var delegate: DetailVotePresenterDelegate?
    
    init(vote: VoteObject) {
        self.vote = vote
    }
    
}
