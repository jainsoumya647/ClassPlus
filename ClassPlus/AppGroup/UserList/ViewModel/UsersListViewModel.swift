//
//  UsersListViewModel.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

class UsersListViewModel {
    var reloadData: (() -> Void)?
    private var usersResult: UserResults?
    private var usersArray: [User]? {
        didSet {
            self.reloadData?()
        }
    }
    private var currentPage = 0
    private var isRequestInProgress = false
    private let isFetchedFromDataBase: Bool
    
    init() {
        let users = DataBaseManger.loadUsersFromDb()
        if users.count > 0 {
            print("Fetched from DB with count: \(users.count)")
            self.isFetchedFromDataBase = true
            self.usersArray = users
        } else {
            self.isFetchedFromDataBase = false
            self.fetchNextPageUsers()
        }
    }
    
    func fetchNextPageUsers() {
        
        guard self.isFetchedFromDataBase == false else {
            return
        }
        
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
                if let usersArray = usersResult.users {
                    DataBaseManger.saveUsersToDb(users: usersArray) {}
                }
                self.usersArray = usersResult.users
            } else if let usersArray = usersResult.users {
                DataBaseManger.saveUsersToDb(users: usersArray) {
                    self.usersArray?.append(contentsOf: usersArray)
                }
            }
            
        }
    }
    
    func addUserToTop(user: User) {
        self.usersArray?.insert(user, at: 0)
    }
    
    func updateUser(on index: Int, user: User) {
        self.usersArray?[index] = user
    }
    
    func removeUser(from index: Int) {
        self.usersArray?.remove(at: index)
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
