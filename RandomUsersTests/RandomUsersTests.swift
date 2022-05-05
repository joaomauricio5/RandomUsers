//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Joao Mauricio on 01/05/2022.
//

import XCTest
@testable import RandomUsers

class RandomUsersTests: XCTestCase {
    private func getTestJSONData() -> Data {
        guard let url = Bundle.main.url(forResource: "randomUsers", withExtension: "json") else {
            fatalError("randomUsers.json file not found")
        }
        return try! Data(contentsOf: url)
    }
    
    func testUserModel() throws {
        let jsonData = getTestJSONData()
        do {
            _ = try JSONDecoder().decode(Response.self, from: jsonData)
        } catch  {
            XCTFail("Failed to decode JSON into the user model : \(error)")
        }
    }
}
