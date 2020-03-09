//
//  UserDefaults+Extension.swift
//  ClassPlus
//
//  Created by Soumya Jain on 09/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

//How to use: UserDefaults.bool(forKey: .showRevenueSplitSetting)

protocol BoolUserDefaultable {
    associatedtype BoolDefaultKey : RawRepresentable
}

extension UserDefaults: BoolUserDefaultable {
    enum BoolDefaultKey : String {
        case doesNeedsToFetchNextPage
    }
}

extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
    
    static func set(_ value: Bool, forKey key: BoolDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func bool(forKey key: BoolDefaultKey) -> Bool? {
        let key = key.rawValue
        return UserDefaults.standard.value(forKey: key) as? Bool
    }
    
}
