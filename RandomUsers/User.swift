//
//  User.swift
//  RandomUsers
//
//  Created by Joao Mauricio on 03/05/2022.
//

import Foundation

struct Response: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}
struct User: Decodable, Identifiable, Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id ? true : false
    }
    
    let id: String
    let name: Name
    let pictureURL: String
    
    var fullName: String {
        name.title + ". " + name.first + " " + name.last
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(Name.self, forKey: .name)
        let loginInfo = try values.nestedContainer(keyedBy: LoginInfoCodingKeys.self, forKey: .login)
        id = try loginInfo.decode(String.self, forKey: .uuid)
        let pictureInfo = try values.nestedContainer(keyedBy: PictureCodingKeys.self, forKey: .picture)
        pictureURL = try pictureInfo.decode(String.self, forKey: .medium)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case login
        case picture
    }
    
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
    
    enum PictureCodingKeys: String, CodingKey {
        case medium
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}
 
