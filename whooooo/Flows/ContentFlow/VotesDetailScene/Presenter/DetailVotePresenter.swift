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
    
    enum Position {
        case left, right
    }
    
    let vote: VoteObject
    var delegate: DetailVotePresenterDelegate?
    
    init(vote: VoteObject) {
        self.vote = vote
    }
    
    func imageForPosition(_ position: Position, completion: @escaping (Data) -> ()) {
        let url = position == .left ? self.vote.firstItem : self.vote.secondItem
        ThumbStorage.shared.fetchAsyncOnURL(URL(string: url)!, completion: completion)
    }
    
}
