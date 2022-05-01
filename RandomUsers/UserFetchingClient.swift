//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Joao Mauricio on 01/05/2022.
//

import Foundation

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> String {
        async let (data, _) = URLSession.shared.data(from: url)
        return try String(data: await data, encoding: .utf8)!
    }
}
