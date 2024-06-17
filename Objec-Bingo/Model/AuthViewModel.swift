//
//  AuthViewModel.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

/// A protocol that defines the requirements for an authentication form.
protocol AuthenticationFormProtocol {
    /// A Boolean value indicating whether the form is valid or not.
    var formIsValid: Bool { get }
}

/// A view model that handles authentication-related operations.
@MainActor
class AuthViewModel: ObservableObject {
    /// The current user session.
    @Published var userSession: FirebaseAuth.User?
    
    /// The current user object.
    @Published var currentUser: User?
    
    /// Initializes the view model and fetches the current user.
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    /// Signs in the user with the provided email and password.
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    /// - Throws: An error if the sign-in process fails.
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    /// Creates a new user account with the provided email, password, and full name.
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - fullname: The user's full name.
    /// - Throws: An error if the account creation process fails.
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    /// Signs out the current user.
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    /// Deletes the current user's account.
    func deleteAccount() {
        do {
            self.userSession = nil
            Auth.auth().currentUser?.delete()
        }
    }
    
    /// Fetches the current user's data from Firestore.
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    func addChild() async throws {
        guard var currentUser = currentUser else { return }
        
        if currentUser.children < 2 {
            currentUser.children += 1
            let encodedUser = try Firestore.Encoder().encode(currentUser)
            try await Firestore.firestore().collection("users").document(currentUser.id).setData(encodedUser)
            await fetchUser()
        }
    }
    
    func deleteChild() async throws {
        guard var currentUser = currentUser else { return }
        currentUser.children -= 1
        currentUser.childCardId = nil
        currentUser.childName = nil
        
        let encodedUser = try Firestore.Encoder().encode(currentUser)
        try await Firestore.firestore().collection("users").document(currentUser.id).setData(encodedUser)
        await fetchUser()
    }
    
    func deleteSecondChild() async throws {
        guard var currentUser = currentUser else { return }
        currentUser.children -= 1
        currentUser.secondChildCardId = nil
        currentUser.secondChildName = nil
        
        let encodedUser = try Firestore.Encoder().encode(currentUser)
        try await Firestore.firestore().collection("users").document(currentUser.id).setData(encodedUser)
        await fetchUser()
    }
}
