//
//  UsersDatabaseManager.swift
//  ClassPlus
//
//  Created by Soumya Jain on 08/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import UIKit

//class DataBaseManger: NSObject {
//    
//    class func saveCarsToDb(_ completionBlock : @escaping ()->()) {
//        ServiceManager.loadCars { (response, error) in
//            if response != nil {
//                //TODO - Out of the scope - Use background context to improve performance
//                let context = CoreDataStack.persistentContainer.viewContext
//                for dictionary in response! {
//                    let car = Car(context:context)
//                    car.parseWith(response: dictionary as! [String : Any])
//                }
//                //TODO - Out of the scope - implement caching logic based on requiremnt
//                CoreDataStack.saveContext()
//                completionBlock()
//            }else{
//                // Do nothing -  no error, response is empty
//            }
//            if error != nil {
//                //Show error
//            }
//        }
//    }
//    
//   class func loadCarsFromDb() -> [CarInfoViewModel] {
//        let context = CoreDataStack.persistentContainer.viewContext
//        var viewModelArray = [CarInfoViewModel]()
//        do {
//            let cars : [Car] = try context.fetch(Car.fetchRequest())
//            if cars.count > 0{
//                for car in cars{
//                    let viewModel = CarInfoViewModel(data: car)
//                    viewModelArray.append(viewModel!)
//                }
//            }
//        }catch {
//            print("Error fetching data from CoreData")
//        }
//        return viewModelArray
//    }
//    
//    //Add other methods when needed
//}
