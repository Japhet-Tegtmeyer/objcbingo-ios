//
//  GameViewModel.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/24/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

/// A view model that manages the game-related operations.
@MainActor
class GameViewModel: ObservableObject {
    /// The current game object.
    @Published var currentGame: Game?
    
    /// The sorted list of members in the current game, ordered by the number of checked boxes.
    var sortedMembers: [User] {
        if let members = currentGame?.members {
            return members.sorted { countCheckedBoxes(for: $0) > countCheckedBoxes(for: $1) }
        }
        return []
    }
    
    /// Initializes the view model and fetches the current game.
    init() {
        Task {
            await fetchCurrentGame()
        }
    }
    
    /// Counts the number of checked boxes for a given user.
    /// - Parameter user: The user object.
    /// - Returns: The number of checked boxes.
    func countCheckedBoxes(for user: User) -> Int {
        let properties = Mirror(reflecting: user).children.compactMap { $0.value as? Bool }
        return properties.reduce(0) { $0 + ($1 ? 1 : 0) }
    }
    
    /// Joins a game with the given code and user.
    /// - Parameters:
    ///   - code: The game code.
    ///   - user: The user object.
    func joinGame(withCode code: Int, user: User) async {
        do {
            // Check if the game with the given code exists
            let gameQuery = Firestore.firestore().collection("games").whereField("code", isEqualTo: code)
            let gameSnapshot = try await gameQuery.getDocuments()
            
            if let gameDoc = gameSnapshot.documents.first, var gameData = try? gameDoc.data(as: Game.self) {
                // If the game exists, add the user to the game
                gameData.members.append(user)
                
                // Update the game in Firestore
                try await gameDoc.reference.setData(from: gameData, merge: true)
                
                // Update the local currentGame property
                self.currentGame = gameData
                
                // Update the user's gameId field in Firestore
                let userDocRef = Firestore.firestore().collection("users").document(user.id)
                try await userDocRef.updateData(["gameId": gameDoc.documentID])
            } else {
                print("Game not found")
            }
        } catch {
            print("Error joining game: \(error.localizedDescription)")
        }
    }
    
    /// Fetches the current game based on the user's data.
    func fetchCurrentGame() async {
        do {
            // Fetch the current game based on the user's data
            guard let userId = Auth.auth().currentUser?.uid else { return }
            let userDocument = Firestore.firestore().collection("users").document(userId)
            let userSnapshot = try await userDocument.getDocument()
            
            if let userData = try? userSnapshot.data(as: User.self), let gameId = userData.gameId {
                let gameDocument = Firestore.firestore().collection("games").document(gameId)
                let gameSnapshot = try await gameDocument.getDocument()
                
                if let gameData = try? gameSnapshot.data(as: Game.self) {
                    // Update the local currentGame property
                    self.currentGame = gameData
                } else {
                    print("Current game not found")
                }
            }
        } catch {
            print("Error fetching current game: \(error.localizedDescription)")
        }
    }
    
    /// Leaves the current game for the given user.
    /// - Parameter user: The user object.
    func leaveGame(user: User) async {
        do {
            // Check if the user is currently in a game
            guard let gameId = user.gameId else {
                print("User is not currently in a game")
                return
            }
            
            // Get the game document reference
            let gameDocRef = Firestore.firestore().collection("games").document(gameId)
            
            // Get the current game data
            let gameDoc = try await gameDocRef.getDocument()
            var gameData = try? gameDoc.data(as: Game.self)
            
            // Remove the user from the game's members array
            if var gameData = gameData {
                gameData.members.removeAll(where: { $0.id == user.id })
                
                // Update the game document
                try await gameDocRef.setData(from: gameData, merge: true)
                
                // Update the user's gameId field to nil
                let userDocRef = Firestore.firestore().collection("users").document(user.id)
                try await userDocRef.updateData(["gameId": nil])
                
                // Clear the local currentGame property
                self.currentGame = nil
            } else {
                print("Game data not found")
            }
        } catch {
            print("Error leaving game: \(error.localizedDescription)")
        }
    }
    
    /// Sets a random board for the given user.
    /// - Parameter user: The user object.
    func setBoard(user: User) async {
        do {
            var randomBoard = currentGame?.boards.randomElement()
            
            let userDocRef = Firestore.firestore().collection("users").document(user.id)
            try await userDocRef.updateData(["cardId": randomBoard])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    func setChildBoard(user: User) async {
        do {
            var randomBoard = currentGame?.boards.randomElement()
            
            let userDocRef = Firestore.firestore().collection("users").document(user.id)
            try await userDocRef.updateData(["childCardId": randomBoard])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    func setSecondChildBoard(user: User) async {
        do {
            var randomBoard = currentGame?.boards.randomElement()
            
            let userDocRef = Firestore.firestore().collection("users").document(user.id)
            try await userDocRef.updateData(["secondChildCardId": randomBoard])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    /// Clears the board for the given user.
    /// - Parameter user: The user object.
    func clearBoard(for user: User) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            // Update the s1 field to false
            try await userRef.updateData(["s1": false])
            try await userRef.updateData(["s2": false])
            try await userRef.updateData(["s3": false])
            try await userRef.updateData(["s4": false])
            try await userRef.updateData(["s5": false])
            try await userRef.updateData(["s6": false])
            try await userRef.updateData(["s7": false])
            try await userRef.updateData(["s8": false])
            try await userRef.updateData(["s9": false])
            try await userRef.updateData(["s10": false])
            try await userRef.updateData(["s11": false])
            try await userRef.updateData(["s12": false])
            try await userRef.updateData(["s13": false])
            try await userRef.updateData(["s14": false])
            try await userRef.updateData(["s15": false])
            try await userRef.updateData(["s16": false])
            try await userRef.updateData(["s17": false])
            try await userRef.updateData(["s18": false])
            try await userRef.updateData(["s19": false])
            try await userRef.updateData(["s20": false])
            try await userRef.updateData(["s21": false])
            try await userRef.updateData(["s22": false])
            try await userRef.updateData(["s23": false])
            try await userRef.updateData(["s24": false])
            try await userRef.updateData(["s25": false])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    func clearChildBoard(for user: User) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            
            // Update all child board fields to false
            try await userRef.updateData([
                "cs1": false, "cs2": false, "cs3": false, "cs4": false, "cs5": false,
                "cs6": false, "cs7": false, "cs8": false, "cs9": false, "cs10": false,
                "cs11": false, "cs12": false, "cs13": false, "cs14": false, "cs15": false,
                "cs16": false, "cs17": false, "cs18": false, "cs19": false, "cs20": false,
                "cs21": false, "cs22": false, "cs23": false, "cs24": false, "cs25": false
            ])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }

    func clearSecondChildBoard(for user: User) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            
            // Update all second child board fields to false
            try await userRef.updateData([
                "c2s1": false, "c2s2": false, "c2s3": false, "c2s4": false, "c2s5": false,
                "c2s6": false, "c2s7": false, "c2s8": false, "c2s9": false, "c2s10": false,
                "c2s11": false, "c2s12": false, "c2s13": false, "c2s14": false, "c2s15": false,
                "c2s16": false, "c2s17": false, "c2s18": false, "c2s19": false, "c2s20": false,
                "c2s21": false, "c2s22": false, "c2s23": false, "c2s24": false, "c2s25": false
            ])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    /// Toggles the s1 field for the given user.
    /// - Parameter user: The user object.
    func toggleS1(for user: User) async {
        await toggleField(for: user, field: "s1")
    }
    
    /// Toggles the s2 field for the given user.
    /// - Parameter user: The user object.
    func toggleS2(for user: User) async {
        await toggleField(for: user, field: "s2")
    }
    
    /// Toggles the s3 field for the given user.
    /// - Parameter user: The user object.
    func toggleS3(for user: User) async {
        await toggleField(for: user, field: "s3")
    }
    
    /// Toggles the s4 field for the given user.
    /// - Parameter user: The user object.
    func toggleS4(for user: User) async {
        await toggleField(for: user, field: "s4")
    }
    
    /// Toggles the s5 field for the given user.
    /// - Parameter user: The user object.
    func toggleS5(for user: User) async {
        await toggleField(for: user, field: "s5")
    }
    
    /// Toggles the s6 field for the given user.
    /// - Parameter user: The user object.
    func toggleS6(for user: User) async {
        await toggleField(for: user, field: "s6")
    }
    
    /// Toggles the s7 field for the given user.
    /// - Parameter user: The user object.
    func toggleS7(for user: User) async {
        await toggleField(for: user, field: "s7")
    }
    
    /// Toggles the s8 field for the given user.
    /// - Parameter user: The user object.
    func toggleS8(for user: User) async {
        await toggleField(for: user, field: "s8")
    }
    
    /// Toggles the s9 field for the given user.
    /// - Parameter user: The user object.
    func toggleS9(for user: User) async {
        await toggleField(for: user, field: "s9")
    }
    
    /// Toggles the s10 field for the given user.
    /// - Parameter user: The user object.
    func toggleS10(for user: User) async {
        await toggleField(for: user, field: "s10")
    }
    
    /// Toggles the s11 field for the given user.
    /// - Parameter user: The user object.
    func toggleS11(for user: User) async {
        await toggleField(for: user, field: "s11")
    }
    
    /// Toggles the s12 field for the given user.
    /// - Parameter user: The user object.
    func toggleS12(for user: User) async {
        await toggleField(for: user, field: "s12")
    }
    
    /// Toggles the s13 field for the given user.
    /// - Parameter user: The user object.
    func toggleS13(for user: User) async {
        await toggleField(for: user, field: "s13")
    }
    
    /// Toggles the s14 field for the given user.
    /// - Parameter user: The user object.
    func toggleS14(for user: User) async {
        await toggleField(for: user, field: "s14")
    }
    
    /// Toggles the s15 field for the given user.
    /// - Parameter user: The user object.
    func toggleS15(for user: User) async {
        await toggleField(for: user, field: "s15")
    }
    
    /// Toggles the s16 field for the given user.
    /// - Parameter user: The user object.
    func toggleS16(for user: User) async {
        await toggleField(for: user, field: "s16")
    }
    
    /// Toggles the s17 field for the given user.
    /// - Parameter user: The user object.
    func toggleS17(for user: User) async {
        await toggleField(for: user, field: "s17")
    }
    
    /// Toggles the s18 field for the given user.
    /// - Parameter user: The user object.
    func toggleS18(for user: User) async {
        await toggleField(for: user, field: "s18")
    }
    
    /// Toggles the s19 field for the given user.
    /// - Parameter user: The user object.
    func toggleS19(for user: User) async {
        await toggleField(for: user, field: "s19")
    }
    
    /// Toggles the s20 field for the given user.
    /// - Parameter user: The user object.
    func toggleS20(for user: User) async {
        await toggleField(for: user, field: "s20")
    }
    
    /// Toggles the s21 field for the given user.
    /// - Parameter user: The user object.
    func toggleS21(for user: User) async {
        await toggleField(for: user, field: "s21")
    }
    
    /// Toggles the s22 field for the given user.
    /// - Parameter user: The user object.
    func toggleS22(for user: User) async {
        await toggleField(for: user, field: "s22")
    }
    
    /// Toggles the s23 field for the given user.
    /// - Parameter user: The user object.
    func toggleS23(for user: User) async {
        await toggleField(for: user, field: "s23")
    }
    
    /// Toggles the s24 field for the given user.
    /// - Parameter user: The user object.
    func toggleS24(for user: User) async {
        await toggleField(for: user, field: "s24")
    }
    
    /// Toggles the s25 field for the given user.
    /// - Parameter user: The user object.
    func toggleS25(for user: User) async {
        await toggleField(for: user, field: "s25")
    }
    
    // First Child Toggle Functions
    func toggleCS1(for user: User) async {
        await toggleField(for: user, field: "cs1")
    }

    func toggleCS2(for user: User) async {
        await toggleField(for: user, field: "cs2")
    }

    func toggleCS3(for user: User) async {
        await toggleField(for: user, field: "cs3")
    }

    func toggleCS4(for user: User) async {
        await toggleField(for: user, field: "cs4")
    }

    func toggleCS5(for user: User) async {
        await toggleField(for: user, field: "cs5")
    }

    func toggleCS6(for user: User) async {
        await toggleField(for: user, field: "cs6")
    }

    func toggleCS7(for user: User) async {
        await toggleField(for: user, field: "cs7")
    }

    func toggleCS8(for user: User) async {
        await toggleField(for: user, field: "cs8")
    }

    func toggleCS9(for user: User) async {
        await toggleField(for: user, field: "cs9")
    }

    func toggleCS10(for user: User) async {
        await toggleField(for: user, field: "cs10")
    }

    func toggleCS11(for user: User) async {
        await toggleField(for: user, field: "cs11")
    }

    func toggleCS12(for user: User) async {
        await toggleField(for: user, field: "cs12")
    }

    func toggleCS13(for user: User) async {
        await toggleField(for: user, field: "cs13")
    }

    func toggleCS14(for user: User) async {
        await toggleField(for: user, field: "cs14")
    }

    func toggleCS15(for user: User) async {
        await toggleField(for: user, field: "cs15")
    }

    func toggleCS16(for user: User) async {
        await toggleField(for: user, field: "cs16")
    }

    func toggleCS17(for user: User) async {
        await toggleField(for: user, field: "cs17")
    }

    func toggleCS18(for user: User) async {
        await toggleField(for: user, field: "cs18")
    }

    func toggleCS19(for user: User) async {
        await toggleField(for: user, field: "cs19")
    }

    func toggleCS20(for user: User) async {
        await toggleField(for: user, field: "cs20")
    }

    func toggleCS21(for user: User) async {
        await toggleField(for: user, field: "cs21")
    }

    func toggleCS22(for user: User) async {
        await toggleField(for: user, field: "cs22")
    }

    func toggleCS23(for user: User) async {
        await toggleField(for: user, field: "cs23")
    }

    func toggleCS24(for user: User) async {
        await toggleField(for: user, field: "cs24")
    }

    func toggleCS25(for user: User) async {
        await toggleField(for: user, field: "cs25")
    }

    // Second Child Toggle Functions
    func toggleC2S1(for user: User) async {
        await toggleField(for: user, field: "c2s1")
    }

    func toggleC2S2(for user: User) async {
        await toggleField(for: user, field: "c2s2")
    }

    func toggleC2S3(for user: User) async {
        await toggleField(for: user, field: "c2s3")
    }

    func toggleC2S4(for user: User) async {
        await toggleField(for: user, field: "c2s4")
    }

    func toggleC2S5(for user: User) async {
        await toggleField(for: user, field: "c2s5")
    }

    func toggleC2S6(for user: User) async {
        await toggleField(for: user, field: "c2s6")
    }

    func toggleC2S7(for user: User) async {
        await toggleField(for: user, field: "c2s7")
    }

    func toggleC2S8(for user: User) async {
        await toggleField(for: user, field: "c2s8")
    }

    func toggleC2S9(for user: User) async {
        await toggleField(for: user, field: "c2s9")
    }

    func toggleC2S10(for user: User) async {
        await toggleField(for: user, field: "c2s10")
    }

    func toggleC2S11(for user: User) async {
        await toggleField(for: user, field: "c2s11")
    }

    func toggleC2S12(for user: User) async {
        await toggleField(for: user, field: "c2s12")
    }

    func toggleC2S13(for user: User) async {
        await toggleField(for: user, field: "c2s13")
    }

    func toggleC2S14(for user: User) async {
        await toggleField(for: user, field: "c2s14")
    }

    func toggleC2S15(for user: User) async {
        await toggleField(for: user, field: "c2s15")
    }

    func toggleC2S16(for user: User) async {
        await toggleField(for: user, field: "c2s16")
    }

    func toggleC2S17(for user: User) async {
        await toggleField(for: user, field: "c2s17")
    }

    func toggleC2S18(for user: User) async {
        await toggleField(for: user, field: "c2s18")
    }

    func toggleC2S19(for user: User) async {
        await toggleField(for: user, field: "c2s19")
    }

    func toggleC2S20(for user: User) async {
        await toggleField(for: user, field: "c2s20")
    }

    func toggleC2S21(for user: User) async {
        await toggleField(for: user, field: "c2s21")
    }

    func toggleC2S22(for user: User) async {
        await toggleField(for: user, field: "c2s22")
    }

    func toggleC2S23(for user: User) async {
        await toggleField(for: user, field: "c2s23")
    }

    func toggleC2S24(for user: User) async {
        await toggleField(for: user, field: "c2s24")
    }

    func toggleC2S25(for user: User) async {
        await toggleField(for: user, field: "c2s25")
    }
    
    /// Toggles the specified field for the given user.
    /// - Parameters:
    ///   - user: The user object.
    ///   - field: The field to toggle.
    private func toggleField(for user: User, field: String) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            
            // Get the current value of the field
            let document = try await userRef.getDocument()
            if let fieldValue = document.data()?[field] as? Bool {
                // Toggle the field value
                try await userRef.updateData([field: !fieldValue])
            } else {
                // If the field doesn't exist or is not a Bool, you might want to handle that case
                print("DEBUG: \(field) field is missing or not a boolean")
            }
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    /// Creates a new game with a random code and default boards.
    func createGame() async {
        do {
            // Generate a random game code
            let gameCode = Int.random(in: 10000...99999)
            
            // Create a new game with the random code and some default boards
            let newGame = Game(id: UUID().uuidString, code: gameCode, boards: ["Board1", "Board2", "Board3"], members: [])
            
            // Add the new game to Firestore
            try await Firestore.firestore().collection("games").document(newGame.id).setData(from: newGame)
            
            // Update the local currentGame property
            self.currentGame = newGame
            
            print("Game created with code: \(gameCode)")
        } catch {
            print("Error creating game: \(error.localizedDescription)")
        }
    }
}
