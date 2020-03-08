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

//struct User: Codable {
//    var id: Int?
//    var email: String?
//    var firstName: String?
//    var lastName: String?
//    var avatar: String?
//    var mobile: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case email = "email"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case avatar = "avatar"
//        case mobile = "mobile"
//    }
//    
//    init() { }
//    
//    init(userDB: UserCoreData) {
//        self.email = userDB.email
//        self.avatar = userDB.avatar
//        self.firstName = userDB.firstName
//        self.lastName = userDB.lastName
//        self.mobile = userDB.mobile
//        self.id = userDB.id
//        print(userDB.objectID)
//    }
//    
//    required convenience init(from decoder: Decoder) throws {
//        let context = CoreDataStack.persistentContainer.viewContext
//        guard let entity = NSEntityDescription.entity(forEntityName: "UserCoreData", in: context) else {
//            fatalError("Entity not found")
//        }
//        self.init(entity: entity, insertInto: context)
//        self.init()
//        do {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            self.email = try? values.decode(String?.self, forKey: .email)
//            self.firstName = try? values.decode(String?.self, forKey: .firstName)
//            self.lastName = try? values.decode(String?.self, forKey: .lastName)
//            self.avatar = try? values.decode(String?.self, forKey: .avatar)
//            self.mobile = try? values.decode(String?.self, forKey: .mobile)
//        } catch {
//            print("Failed to load")
//        }
//    }
//    
//    func saveUser(with context: NSManagedObjectContext) {
//        let entity = NSEntityDescription.entity(forEntityName: "UserCoreData", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//        newUser.setValue(self.id, forKey: "id")
//        newUser.setValue(self.email, forKey: "email")
//        newUser.setValue(self.firstName, forKey: "firstName")
//        newUser.setValue(self.lastName, forKey: "lastName")
//        newUser.setValue(self.avatar, forKey: "avatar")
//        newUser.setValue(self.mobile, forKey: "mobile")
//    }
//    
////    class func fetchUserRequest() -> NSFetchRequest<User> {
////        return NSFetchRequest<User>(entityName: "UserCoreData")
////    }
//    
//    func getImageURLString() -> String {
//        return self.avatar ?? ""
//    }
//    
//    func getFullName() -> String {
//        var fullName = self.firstName ?? ""
//        if let lastName = self.lastName {
//            fullName += " \(lastName)"
//        }
//        return fullName
//    }
//
//    func getFirstName() -> String {
//        return self.firstName ?? ""
//    }
//
//    func getLastName() -> String {
//        return self.lastName ?? ""
//    }
//
//    func getMobile() -> String {
//        return self.mobile ?? ""
//    }
//
//    func getEmail() -> String {
//        return self.email ?? ""
//    }
//
//
//    func validateUserToAdd() -> Bool {
//
//        guard !self.getFirstName().isEmpty else {
//            return false
//        }
//
//        guard self.getEmail().isValidEmail() else {
//            return false
//        }
//
//        guard self.getMobile().isPhoneNumber else {
//            return false
//        }
//        return true
//    }
//}
