//
//  DetailVotePresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

protocol DetailVotePresenterDelegate {
    
}

class DetailVotePresenter {
    
    enum Position {
        case left, right, none
    }
    
    enum Childs: String {
        case firstItem, secondItem, both
    }
    
    let ref: DatabaseReference = Database.database().reference()
    
    let vote: VoteObject
    var delegate: DetailVotePresenterDelegate?
    
    init(vote: VoteObject) {
        self.vote = vote
    }
    
    func imageForPosition(_ position: Position, completion: @escaping (Data) -> ()) {
        let url = position == .left ? self.vote.secondItem : self.vote.firstItem
        ThumbStorage.shared.fetchAsyncOnURL(URL(string: url)!, completion: completion)
    }
    
    func nameText(_ completion: @escaping (String) -> ()) {
        ref.child("votes").observe(.value) { [weak self] (snapshot) in
            if let strongSelf = self {
                completion(((snapshot.value as! [String: [String: AnyObject]])[strongSelf.vote.identifier])?["name"] as! String)
            }
        }
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
    
    func dateForLiveLabel( completion: @escaping (Int) -> ()) {
        completion(self.vote.dateTo)
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
    
    @objc func leftItemSelected() {
        voteForChild(.firstItem)
    }
    
    @objc func rightItemSelected() {
        voteForChild(.secondItem)
    }
    
    func voteForChild(_ child: Childs) {
        let validityChild: Childs = child == .firstItem ? .secondItem : .firstItem
        checkEntryFor(validityChild) { [weak self] isEntry in
            guard let voteId = self?.vote.identifier, let userId = Auth.auth().currentUser?.uid else { return }
            if !isEntry {
                self?.ref.child("votesCounter").child(voteId).child(child.rawValue).child(userId).setValue(1)
            }
        }
    }
    
    func checkEntryFor(_ item: Childs, _ completion: @escaping (Bool) -> ()) {
        guard let identifier = AuthenticationManager().currentUserIdentifier() else { return }
        ref.child("votesCounter").child(vote.identifier).observe(.value) { (snapshot) in
            completion(snapshot.childSnapshot(forPath: item.rawValue).hasChild(identifier))
        }
    }
    
    func firstItemSelected(_ completion: @escaping (Bool) -> ()) {
        checkEntryFor(.firstItem) { (isSelected) in
            completion(isSelected)
        }
    }
    
    func secondItemSelected(_ completion: @escaping (Bool) -> ()) {
        checkEntryFor(.secondItem) { (isSelected) in
            completion(isSelected)
        }
    }
    
    func checkEntry(child: Childs, completion: @escaping () -> ()) {
        guard let identifier = AuthenticationManager().currentUserIdentifier() else { return }
        ref.child("votesCounter").child(vote.identifier).observeSingleEvent(of: .value) { (snapshot) in
            switch child {
            case .firstItem,
                 .secondItem:
                if snapshot.childSnapshot(forPath: child.rawValue).hasChild(identifier) {
                    completion()
                }
                break
            case .both:
                if snapshot.childSnapshot(forPath: Childs.firstItem.rawValue).hasChild(identifier) &&
                    snapshot.childSnapshot(forPath: Childs.secondItem.rawValue).hasChild(identifier){
                    completion()
                }
                break
            }
        }
        ref.child("votesCounter").child(vote.identifier).child(child.rawValue).observeSingleEvent(of: .value) { (snapshot) in
            guard let identifier = AuthenticationManager().currentUserIdentifier(),
                !snapshot.hasChild(identifier) else { return }
            completion()
        }
    }
    
    func totalVotesCount(_ completion: @escaping (String) -> ()) {
        ref.child("votesCounter").child(vote.identifier).observe(.value) { snapshot in
            let leftBranch = snapshot.childSnapshot(forPath: "firstItem").childrenCount
            let rightBranch = snapshot.childSnapshot(forPath: "secondItem").childrenCount
            completion("\(leftBranch + rightBranch)")
        }
        
        
    }
    
}
