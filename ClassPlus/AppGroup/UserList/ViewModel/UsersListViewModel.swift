//
//  UsersListViewModel.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

class UsersListViewModel  {
    var reloadData: (() -> Void)?
    private var usersResult: UserResults?
    private var usersArray: [User]? {
        didSet {
            self.reloadData?()
        }
    }
    private var currentPage = 0
    private var isRequestInProgress = false
    
    init() {
        self.fetchNextPageUsers()
    }
    
    func fetchNextPageUsers() {
        
        guard self.isRequestInProgress == false else {
            return
        }
        
        guard self.usersResult == nil || self.usersResult!.totalPages > self.currentPage else {
            return
        }
        
        self.fetchUsers(onPage: self.currentPage+1)
    }
    
    private func fetchUsers(onPage page: Int) {
        self.currentPage = page
        self.isRequestInProgress = true
        UserService().getRepositories(page: page) { (usersResult) in
            self.isRequestInProgress = false
            self.usersResult = usersResult
            if self.usersArray == nil {
                self.usersArray = usersResult.users
            } else if let usersArray = usersResult.users {
                self.usersArray?.append(contentsOf: usersArray)
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return self.usersArray?.count ?? 0
    }
    
    func getUser(onIndex index: Int) -> User? {
        guard let users = usersArray, users.count > index else {
            return nil
        }
        return users[index]
    }
}
