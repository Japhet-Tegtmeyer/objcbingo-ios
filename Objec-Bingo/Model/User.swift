//
//  User.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import Foundation

struct User: Identifiable, Codable {
    /// The unique identifier for the user.
    let id: String
    
    /// The full name of the user.
    var fullName: String
    
    /// The email address of the user.
    var email: String
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s1: Bool = false
    
    /// A boolean value indicating whether the second square on the user's board is checked.
    var s2: Bool = false
    
    /// A boolean value indicating whether the third square on the user's board is checked.
    var s3: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s4: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s5: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s6: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s7: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s8: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s9: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s10: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s11: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s12: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s13: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s14: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s15: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s16: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s17: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s18: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s19: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s20: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s21: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s22: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s23: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s24: Bool = false
    
    /// A boolean value indicating whether the first square on the user's board is checked.
    var s25: Bool = false
    
    /// The ID of the game the user is currently participating in, if any.
    var gameId: String?
    
    /// The ID of the board assigned to the user, if any.
    var cardId: String?
    
    /// A boolean value indicating whether the user has a child.
    var children: Int = 0
    
    /// The ID of the board assigned to the users child, if any.
    var childCardId: String?
    
    /// The ID of the board assigned to the users second child, if any.
    var secondChildCardId: String?
    
    var childName: String? = ""
    
    var secondChildName: String? = ""
    
    var cs1: Bool = false
    var cs2: Bool = false
    var cs3: Bool = false
    var cs4: Bool = false
    var cs5: Bool = false
    var cs6: Bool = false
    var cs7: Bool = false
    var cs8: Bool = false
    var cs9: Bool = false
    var cs10: Bool = false
    var cs11: Bool = false
    var cs12: Bool = false
    var cs13: Bool = false
    var cs14: Bool = false
    var cs15: Bool = false
    var cs16: Bool = false
    var cs17: Bool = false
    var cs18: Bool = false
    var cs19: Bool = false
    var cs20: Bool = false
    var cs21: Bool = false
    var cs22: Bool = false
    var cs23: Bool = false
    var cs24: Bool = false
    var cs25: Bool = false
    
    var c2s1: Bool = false
    var c2s2: Bool = false
    var c2s3: Bool = false
    var c2s4: Bool = false
    var c2s5: Bool = false
    var c2s6: Bool = false
    var c2s7: Bool = false
    var c2s8: Bool = false
    var c2s9: Bool = false
    var c2s10: Bool = false
    var c2s11: Bool = false
    var c2s12: Bool = false
    var c2s13: Bool = false
    var c2s14: Bool = false
    var c2s15: Bool = false
    var c2s16: Bool = false
    var c2s17: Bool = false
    var c2s18: Bool = false
    var c2s19: Bool = false
    var c2s20: Bool = false
    var c2s21: Bool = false
    var c2s22: Bool = false
    var c2s23: Bool = false
    var c2s24: Bool = false
    var c2s25: Bool = false
    
    
    /**
     The initials of the user's full name.
     
     This property returns a string containing the user's initials, derived from their `fullName` property.
     */
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    /**
     The count of checked boxes on the user's board.
     
     This property returns an integer value representing the number of checked boxes on the user's board, calculated by counting the `true` values in the `s1` through `s25` properties.
     */
    var checkedBoxesCount: Int {
        var count = 0
        if s1 { count += 1 }
        if s2 { count += 1 }
        if s3 { count += 1 }
        if s4 { count += 1 }
        if s5 { count += 1 }
        if s6 { count += 1 }
        if s7 { count += 1 }
        if s8 { count += 1 }
        if s9 { count += 1 }
        if s10 { count += 1 }
        if s11 { count += 1 }
        if s12 { count += 1 }
        if s13 { count += 1 }
        if s14 { count += 1 }
        if s15 { count += 1 }
        if s16 { count += 1 }
        if s17 { count += 1 }
        if s18 { count += 1 }
        if s19 { count += 1 }
        if s20 { count += 1 }
        if s21 { count += 1 }
        if s22 { count += 1 }
        if s23 { count += 1 }
        if s24 { count += 1 }
        if s25 { count += 1 }
        return count
    }
}

extension User {
    /// A mock User instance for testing and development purposes.
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Taylor Swift", email: "test@gmail.com", gameId: "12026")
}
