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
    
    enum Position {
        case left, right
    }
    
    var selectionCompletion: ((VoteObject) -> ())?
    var delegate: VotesCollectionPresenterDelegate?
    var data: [VoteObject] = []
    let firebase: FirebaseAccess = FirebaseAccess()
    
    func setupDelegate(_ delegate: VotesCollectionPresenterDelegate) {
        self.delegate = delegate
    }
    
    func askData() {
        firebase.getDataOnBranch(.votes) { [weak self] (data) in
            let result = data.map {
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
    
    func imageForIndex(_ index: Int, position: Position, completion: @escaping (Data) -> ()) {
        let url = position == .left ? self.data[index].firstItem : self.data[index].secondItem
        ThumbStorage.shared.fetchAsyncOnURL(URL(string: url)!, completion: completion)
    }
    
}
