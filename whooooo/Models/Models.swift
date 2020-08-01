//
//  Models.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 8/1/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation

struct VoteObject: Codable {
    let name: String
    let identifier: String
    let firstItem: String
    let secondItem: String
    let active: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case identifier
//        case firstItemURL = "firstItem"
//        case secondItemURL = "secondItem"
//    }
}

struct VoteCount: Codable {
    let identifier: String
    let one: Array<Dictionary<String, String>>
    let two: Array<Dictionary<String, String>>
}
