//
//  UserListUnitTests.swift
//  ClassPlusTests
//
//  Created by Soumya Jain on 09/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import XCTest
@testable import ClassPlus

class UserListUnitTests: XCTestCase {

    var viewModel = UsersListViewModel()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertEqual(self.viewModel.getNumberOfRows(), DataBaseManger.loadUsersFromDb().count)
        var errorExpectation: XCTestExpectation? = expectation(description: "Response")
        viewModel.reloadData = {
            errorExpectation?.fulfill()
            errorExpectation = nil
        }
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNotNil(self.viewModel.getUser(onIndex: self.viewModel.getNumberOfRows()-1))
            XCTAssertGreaterThan(self.viewModel.getNumberOfRows(), 0)
            self.checkCRUDOnData()
        }
    }
    
    func checkCRUDOnData() {
        
        var user: User? = User() //viewModel.getUser(onIndex: count-1)
        user?.firstName = "Soumya"
        user?.lastName = "Jain"
        user?.email = "jainsoumya647@gmail.com"
        user?.mobile = "8269813293"
        XCTAssertNotNil(user)
        
        //Create
        var count = self.viewModel.getNumberOfRows()
        viewModel.addUserToTop(user: user!)
        XCTAssertEqual(self.viewModel.getNumberOfRows(), count+1)
        //Read to test Create
        user = viewModel.getUser(onIndex: 0)
        XCTAssertNotNil(user)
        XCTAssertEqual(user?.firstName, "Soumya")
        XCTAssertEqual(user?.lastName, "Jain")
        XCTAssertEqual(user?.email, "jainsoumya647@gmail.com")
        XCTAssertEqual(user?.mobile, "8269813293")
        
        //Update
        user = viewModel.getUser(onIndex: 0)
        XCTAssertNotNil(user)
        user?.firstName = "Hail"
        user?.lastName = "Strom"
        viewModel.updateUser(on: 0, user: user!)
        //Read to test Update
        user = viewModel.getUser(onIndex: 0)
        XCTAssertNotNil(user)
        XCTAssertEqual(user?.firstName, "Hail")
        XCTAssertEqual(user?.lastName, "Strom")
        
        //Delete User
        count = self.viewModel.getNumberOfRows()
        viewModel.removeUser(from: 0)
        XCTAssertEqual(self.viewModel.getNumberOfRows(), count-1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
