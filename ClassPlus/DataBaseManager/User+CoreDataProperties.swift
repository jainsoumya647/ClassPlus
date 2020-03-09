//
//  User+CoreDataProperties.swift
//  ClassPlus
//
//  Created by Soumya Jain on 09/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var avatar: String?
    @NSManaged public var mobile: String?
    @NSManaged public var createdDate: Int64

    
    func getImageURLString() -> String {
        return self.avatar ?? ""
    }
    
    func getFullName() -> String {
        var fullName = self.firstName ?? ""
        if let lastName = self.lastName {
            fullName += " \(lastName)"
        }
        return fullName
    }

    func getFirstName() -> String {
        return self.firstName ?? ""
    }

    func getLastName() -> String {
        return self.lastName ?? ""
    }

    func getMobile() -> String {
        return self.mobile ?? ""
    }

    func getEmail() -> String {
        return self.email ?? ""
    }


    func validateUserToAdd() -> Bool {

        guard !self.getFirstName().isEmpty else {
            return false
        }

        guard self.getEmail().isValidEmail() else {
            return false
        }

        guard self.getMobile().isPhoneNumber else {
            return false
        }
        return true
    }
}
