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
    let dateFrom: Int
    let dateTo: Int
    let category: String
    let firstVoteName: String
    let secondVoteName: String
    let active: Bool
}

struct VoteCount: Codable {
    let identifier: String
    let firstItem: Array<Dictionary<String, String>>
    let secondItem: Array<Dictionary<String, String>>
}
