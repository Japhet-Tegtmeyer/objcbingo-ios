//
//  Game.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/24/24.
//

import Foundation
import SwiftUI

struct Game: Identifiable, Codable {
    var id: String
    let code: Int
    let boards: [String]
    var members: [User]
    
    mutating func addUser(_ user: inout User) {
        members.append(user)
        user.gameId = id
    }
}

extension Game {
    static var MOCK_GAME = Game(id: NSUUID().uuidString, code: 12026, boards: ["DisneyBingo001",
                                                                               "DisneyBingo002",
                                                                               "DisneyBingo003",
                                                                               "DisneyBingo004",
                                                                               "DisneyBingo005",
                                                                               "DisneyBingo006",
                                                                               "DisneyBingo007",
                                                                               "DisneyBingo008",
                                                                               "DisneyBingo009",
                                                                               "DisneyBingo010",], members: [User.MOCK_USER])
}
