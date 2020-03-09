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
        UserDefaults.set(true, forKey: .doesNeedsToFetchNextPage)
        let users = DataBaseManger.loadUsersFromDb()
        for user in users {
            print("user: \(user.email ?? "Unknown") => createdDate: \(user.createdDate)")
        }
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
        
        guard UserDefaults.bool(forKey: .doesNeedsToFetchNextPage) else {
            return
        }
        
        self.fetchUsers(onPage: self.currentPage+1)
    }
    
    private func fetchUsers(onPage page: Int) {
        self.currentPage = page
        self.isRequestInProgress = true
        UserService().getRepositories(page: page) { (usersResult) in
            self.isRequestInProgress = false
            let results = self.updateCreatedAt(usersResult: usersResult)
            self.usersResult = results
            UserDefaults.set(results.totalPages > self.currentPage, forKey: .doesNeedsToFetchNextPage)
            if self.usersArray == nil {
                self.usersArray = results.users
            } else if let usersArray = results.users {
                self.usersArray?.append(contentsOf: usersArray)
            }
        }
    }
    
    private func updateCreatedAt(usersResult: UserResults) -> UserResults {
        for index in 0..<(usersResult.users?.count ?? 0) {
            usersResult.users?[index].createdDate = Int64(Date().timeIntervalSince1970) - Int64(index+self.getNumberOfRows()+1)
        }
        return usersResult
    }
    
    func addUserToTop(user: User) {
        self.usersArray?.insert(user, at: 0)
        user.saveUserToDatabase()
    }
    
    func updateUser(on index: Int, user: User) {
        self.usersArray?[index].updateCurrentUser(with: user)
        self.reloadData?()
    }
    
    func removeUser(from index: Int) {
        self.usersArray?[index].deleteUserFromDatabase()
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
