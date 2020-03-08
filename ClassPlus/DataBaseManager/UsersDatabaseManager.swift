//
//  UsersDatabaseManager.swift
//  ClassPlus
//
//  Created by Soumya Jain on 08/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import UIKit

class DataBaseManger: NSObject {
    
    class func saveUsersToDb(users: [User], _ completionBlock : @escaping ()->()) {
        let context = CoreDataStack.persistentContainer.viewContext
        for user in users {
            user.saveUser(with: context)
        }
        //TODO - Out of the scope - implement caching logic based on requiremnt
        CoreDataStack.saveContext()
        completionBlock()
    }
    
   class func loadUsersFromDb() -> [User] {
        let context = CoreDataStack.persistentContainer.viewContext
        var viewModelArray = [User]()
        do {
            let userFromDB : [UserCoreData] = try context.fetch(UserCoreData.fetchRequest())
            for user in userFromDB {
                viewModelArray.append(User(userDB: user))
            }
        } catch {
            print("Error fetching data from CoreData")
        }
        return viewModelArray
    }
}
