//
//  UsersDatabaseManager.swift
//  ClassPlus
//
//  Created by Soumya Jain on 08/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataBaseManger: NSObject {
    
//    class func saveUsersToDb(users: [User], _ completionBlock : @escaping ()->()) {
//        let context = CoreDataStack.persistentContainer.viewContext
////        for user in users {
////            user.saveUser(with: context)
////        }
//        //TODO - Out of the scope - implement caching logic based on requiremnt
//        CoreDataStack.saveContext()
//        completionBlock()
//    }
//    
    class func loadUsersFromDb() -> [User] {
        let context = CoreDataStack.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(User.createdDate), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        var viewModelArray = [User]()
        do {
            let userFromDB : [User] = try context.fetch(fetchRequest)
            viewModelArray = userFromDB
        } catch {
            print("Error fetching data from CoreData")
        }
        return viewModelArray
    }
    
//    class func insertUserInDb(user: User) -> [User] {
//        let context = CoreDataStack.persistentContainer.viewContext
//        var viewModelArray = [User]()
//        let fetchRequest: NSFetchRequest<User> = UserCoreData.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "", argumentArray: [user.firstName, user.lastName, user.email, user.avatar, user.mobile])
//        do {
//            let userFromDB : [UserCoreData] = try context.fetch(fetchRequest)
//            for user in userFromDB {
//                viewModelArray.append(User(userDB: user))
//            }
//        } catch {
//            print("Error fetching data from CoreData")
//        }
//        CoreDataStack.saveContext()
//        return viewModelArray
//    }
//
//    class func updateUserInDb(user: User) -> [User] {
//        let context = CoreDataStack.persistentContainer.viewContext
//        var viewModelArray = [User]()
//        let fetchRequest: NSFetchRequest<UserCoreData> = UserCoreData.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "", argumentArray: [user.firstName, user.lastName, user.email, user.avatar, user.mobile])
//        do {
//            let userFromDB : [UserCoreData] = try context.fetch(fetchRequest)
//            for user in userFromDB {
//                viewModelArray.append(User(userDB: user))
//            }
//        } catch {
//            print("Error fetching data from CoreData")
//        }
//        CoreDataStack.saveContext()
//        return viewModelArray
//    }
}
