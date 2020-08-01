//
//  FirebaseAccess.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import Firebase


class FirebaseAccess {
    enum Branch: String {
        case votes, votesCounter
    }
    
    let ref: DatabaseReference = Database.database().reference()
    
    func getDataOnBranch(_ branch: Branch, completion: @escaping ([String: [String : String]]) -> ()) {
        ref.child(branch.rawValue).observe(.value) { snapshot in
            completion(snapshot.value as! [String: [String: String]])
        }
    }
}
