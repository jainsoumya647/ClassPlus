//
//  AddUserUnitTests.swift
//  ClassPlusTests
//
//  Created by Soumya Jain on 09/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import XCTest
@testable import ClassPlus

class AddUserUnitTests: XCTestCase {

    var newUser = User()
    var viewModel: AddUserViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddUserFlow() {
        let index = 0
        let isNewUser = true
        viewModel = AddUserViewModel(user: self.newUser, isNewUser: isNewUser, index: index)
        
        self.checkNumberOfRows()
        
        let user = self.viewModel.getUserObject()
        self.checkUsersData(user: user)
        
        self.checkSections()
        
        self.checkValuesAndPlaceholders(user: user)
        
        self.checkIndex(index: index)
        self.checkNewUser(isNewUser: isNewUser)
        self.checkUpdateUser(user: user)
        
    }
    
    func testUpdateUserFlow() {
        let index = 0
        let isNewUser = false
        self.newUser = User()
        self.newUser.email = "jainsoumya647@gmail.com"
        self.newUser.firstName = "Soumya"
        self.newUser.lastName = "Jain"
        self.newUser.mobile = "8269813293"
        viewModel = AddUserViewModel(user: self.newUser, isNewUser: isNewUser, index: index)
        
        self.checkNumberOfRows()
        
        let user = self.viewModel.getUserObject()
        self.checkUsersData(user: user)
        
        self.checkSections()
        
        self.checkValuesAndPlaceholders(user: user)
        
        self.checkIndex(index: index)
        self.checkNewUser(isNewUser: isNewUser)
        self.checkUpdateUser(user: user)
        
    }
    
    func checkValuesAndPlaceholders(user: User) {
        var (value, placeholder) = self.viewModel.getUserTextFor(index: 0)
        XCTAssertEqual(value, user.getFirstName())
        XCTAssertEqual(placeholder, Text.firstName)
        
        (value, placeholder) = self.viewModel.getUserTextFor(index: 1)
        XCTAssertEqual(value, user.getLastName())
        XCTAssertEqual(placeholder, Text.lastName)
        
        (value, placeholder) = self.viewModel.getUserTextFor(index: 2)
        XCTAssertEqual(value, user.getEmail())
        XCTAssertEqual(placeholder, Text.email)
        
        (value, placeholder) = self.viewModel.getUserTextFor(index: 3)
        XCTAssertEqual(value, user.getMobile())
        XCTAssertEqual(placeholder, Text.mobileNo)
    }
    
    func checkSections() {
        XCTAssertEqual(self.viewModel.getSectionType(for: 0), Sections.firstName)
        XCTAssertEqual(self.viewModel.getSectionType(for: 1), Sections.lastName)
        XCTAssertEqual(self.viewModel.getSectionType(for: 2), Sections.email)
        XCTAssertEqual(self.viewModel.getSectionType(for: 3), Sections.phone)
    }
    
    func checkUsersData(user: User) {
        XCTAssertEqual(user.avatar, self.newUser.avatar)
        XCTAssertEqual(user.createdDate, self.newUser.createdDate)
        XCTAssertEqual(user.email, self.newUser.email)
        XCTAssertEqual(user.firstName, self.newUser.firstName)
        XCTAssertEqual(user.lastName, self.newUser.lastName)
        XCTAssertEqual(user.mobile, self.newUser.mobile)
    }
    
    func checkNumberOfRows() {
        XCTAssertEqual(self.viewModel.getNumberOfRows(), 4)
    }
    
    func checkIndex(index: Int) {
        XCTAssertEqual(self.viewModel.index, index)
    }
    
    func checkNewUser(isNewUser: Bool) {
        XCTAssertEqual(self.viewModel.isNewUser, isNewUser)
    }
    
    func checkUpdateUser(user: User) {
        let firstName = "Soumya"
        self.viewModel.updateText(for: .firstName, text: firstName)
        var (value, _) = self.viewModel.getUserTextFor(index: 0)
        XCTAssertEqual(firstName, value)
        
        let lastName = "Jain"
        self.viewModel.updateText(for: .lastName, text: lastName)
        (value, _) = self.viewModel.getUserTextFor(index: 1)
        XCTAssertEqual(lastName, value)
        
        
        let email = "jainsoumya647@gmail.com"
        self.viewModel.updateText(for: .email, text: email)
        (value, _) = self.viewModel.getUserTextFor(index: 2)
        XCTAssertEqual(email, value)
        
        
        let phone = "8269813293"
        self.viewModel.updateText(for: .phone, text: phone)
        (value, _) = self.viewModel.getUserTextFor(index: 3)
        XCTAssertEqual(phone, value)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
