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
    
    func categoryName( completion: @escaping (String) -> ()) {
           completion(self.vote.category)
    }
    
    func leftItemName( completion: @escaping (String) -> ()) {
           completion(self.vote.secondVoteName)
    }
    
    func rightItemName( completion: @escaping (String) -> ()) {
        completion(self.vote.firstVoteName)
    }
    
    func hoursToEnd( completion: @escaping (String) -> ()) {
           let date = Date(timeIntervalSince1970: TimeInterval(self.vote.dateTo))
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "hh:mm"
           print(dateFormatter.string(from: date))
           completion(dateFormatter.string(from: date))
       }
    
    func dateToEnd( completion: @escaping (String) -> ()) {
        let date = Date(timeIntervalSince1970: TimeInterval(self.vote.dateTo))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        print(dateFormatter.string(from: date))
        completion(dateFormatter.string(from: date))
    }
    
}
