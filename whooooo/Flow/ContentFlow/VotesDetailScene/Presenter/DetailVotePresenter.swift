//
//  DetailVotePresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

protocol DetailVotePresenterDelegate {
    
    func shouldHighlight(_ item: DetailVotePresenter.Position)
    
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
        let url = position == .left ? self.vote.firstItem : self.vote.secondItem
        ThumbStorage.shared.fetchAsyncOnURL(URL(string: url)!, completion: completion)
    }
    
    func nameText(_ completion: @escaping (String) -> ()) {
        ref.child("votes").observe(.value) { [weak self] (snapshot) in
            if let strongSelf = self {
                completion(((snapshot.value as! [String: [String: AnyObject]])[strongSelf.vote.identifier])?["name"] as! String)
            }
        }
    }
    
    @objc func leftItemSelected() {
        ref.child("votesCounter").child(vote.identifier).child("firstItem").child(Auth.auth().currentUser!.uid).setValue(1)
    }
    
    @objc func rightItemSelected() {
        ref.child("votesCounter").child(vote.identifier).observe(.value) { (snapshot) in

        }
        ref.child("votesCounter").child(vote.identifier).child("secondItem").child(Auth.auth().currentUser!.uid).setValue(1)
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
    
    func setupAppearance() {
        checkEntry(child: .both) { [weak self] in
            
        }
    }
    
}
