//
//  UserService.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
struct UserService {
    typealias UserCompletionBlock = (_ model: UserResults) -> Void
    let router = Router<ApiName>()

    func getRepositories(page: Int, completion: @escaping UserCompletionBlock) {
        router.request(.getUsers(page)) { (_data, response, _error) in
            if let data = _data {
                let decoder = JSONDecoder()
                do {
                    let userResult = try decoder.decode(UserResults.self, from: data)
                    completion(userResult)
                } catch {
                    Utility.printErrorAndShowAlert(error: error)
                }
            } else {
                Utility.printErrorAndShowAlert(error: _error)
            }
        }
    }
}


