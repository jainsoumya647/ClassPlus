//
//  UserModel.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import CoreData

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
