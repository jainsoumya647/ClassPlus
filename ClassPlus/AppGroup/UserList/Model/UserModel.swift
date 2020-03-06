//
//  UserModel.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

struct UserResults: Codable {
    var page: Int
    var totalPages: Int
    var users: [User]?
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case users = "data"
    }
}

struct User: Codable {
    var id: Int?
    var email: String
    var firstName: String
    var lastName: String?
    var avatar: String?
    var mobile: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
        case mobile = "mobile"
    }
    
    func getImageURLString() -> String {
        return self.avatar ?? ""
    }
    
    func getFullName() -> String {
        var fullName = self.firstName
        if let lastName = self.lastName {
            fullName += " \(lastName)"
        }
        return fullName
    }
}
