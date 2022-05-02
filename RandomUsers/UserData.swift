//
//  UserData.swift
//  RandomUsers
//
//  Created by Joao Mauricio on 01/05/2022.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    @Published var users: String = ""
    
    init() {
        Task{
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            self.users = try await UserFetchingClient.getUsers()
        } catch {
            self.users = "Error ocurred"
        }
    }
}
