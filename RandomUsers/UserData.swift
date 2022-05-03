//
//  UserData.swift
//  RandomUsers
//
//  Created by Joao Mauricio on 01/05/2022.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task{
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            self.users = try await UserFetchingClient.getUsers()
        } catch {
            print(error)
        }
    }
}
