//
//  User+CoreDataClass.swift
//  ClassPlus
//
//  Created by Soumya Jain on 08/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar"
        case mobile = "mobile"
    }
    
    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encode(self.avatar, forKey: .avatar)
        try values.encode(self.email, forKey: .email)
        try values.encode(self.firstName, forKey: .firstName)
        try values.encode(self.lastName, forKey: .lastName)
        try values.encode(self.mobile, forKey: .mobile)
    }
    
    convenience init() {
        let context = CoreDataStack.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            fatalError("Entity not found")
        }
        self.init(entity: entity, insertInto: nil)
    }
    
    required convenience public init(from decoder: Decoder) throws {
        let context = CoreDataStack.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            fatalError("Entity not found")
        }
        self.init(entity: entity, insertInto: context)
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.email = try? values.decode(String?.self, forKey: .email)
            self.firstName = try? values.decode(String?.self, forKey: .firstName)
            self.lastName = try? values.decode(String?.self, forKey: .lastName)
            self.avatar = try? values.decode(String?.self, forKey: .avatar)
            self.mobile = try? values.decode(String?.self, forKey: .mobile)
        } catch {
            print("Failed to load")
        }
    }
    
    func saveUserToDatabase() {
        let context = CoreDataStack.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(self.email, forKey: "email")
        newUser.setValue(self.firstName, forKey: "firstName")
        newUser.setValue(self.lastName, forKey: "lastName")
        newUser.setValue(self.avatar, forKey: "avatar")
        newUser.setValue(self.mobile, forKey: "mobile")
    }
    
    func deleteUserFromDatabase() {
        let context = CoreDataStack.persistentContainer.viewContext
        context.delete(self)
    }
    
    func getClonedProperty() -> User {
        let clonedUser = User()
        clonedUser.avatar = self.avatar
        clonedUser.email = self.email
        clonedUser.lastName = self.lastName
        clonedUser.firstName = self.firstName
        clonedUser.mobile = self.mobile
        return clonedUser
    }
    
    func updateCurrentUser(with user: User) {
        self.avatar = user.avatar
        self.email = user.email
        self.lastName = user.lastName
        self.firstName = user.firstName
        self.mobile = user.mobile
    }
}
