//
//  VotesCollectionPresenter.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import Firebase

protocol VotesCollectionPresenterDelegate {
    
    func presenterDidUpdateData()
    
}

class VotesCollectionPresenter {
    
    var selectionCompletion: ((VoteObject) -> ())?
    
    var delegate: VotesCollectionPresenterDelegate?
    
    var data: [VoteObject] = []
    
    init() {
        
    }
    
    func setupDelegate(_ delegate: VotesCollectionPresenterDelegate) {
        self.delegate = delegate
    }
    
    func askData() {

        var ref: DatabaseReference = Database.database().reference().child("votes")
        
        ref.observe(.value) { [weak self] (snapshot) in
            let objects = (snapshot.value as! [String: [String: String]])
            let result = objects.map {
                try! JSONDecoder().decode(VoteObject.self, from: JSONSerialization.data(withJSONObject: $0.value, options: .sortedKeys))
            }
            self?.data.append(contentsOf: result)
            self?.delegate?.presenterDidUpdateData()
        }
    }
        
    func numberOfElements() -> Int {
        return self.data.count
    }
    
    func modelAtIndex(_ index: Int) -> VoteObject {        
        return self.data[index]
    }
    
    func didSelectItemAtIndex(_ index: Int) {
        self.selectionCompletion?(self.data[index])
    }
    
}
