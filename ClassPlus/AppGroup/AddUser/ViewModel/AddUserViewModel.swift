//
//  AddUserViewModel.swift
//  ClassPlus
//
//  Created by Soumya on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation

class AddUserViewModel {
    private var user: User
    var isNewUser: Bool
    var index: Int
    private var sections: [Sections]
    var updateSaveButton: ((_ isEnabled: Bool) -> Void)?
    init(user: User, isNewUser: Bool, index: Int) {
        self.user = user
        self.sections = [.firstName, .lastName, .email, .phone]
        self.isNewUser = isNewUser
        self.index = index
    }

    func getNumberOfRows() -> Int {
        return self.sections.count
    }
    
    func getUserObject() -> User {
        return self.user
    }

    func updateText(for section: Sections, text: String) {
        switch section {
        case .firstName:
            self.user.firstName = text
        case .lastName:
            self.user.lastName = text
        case .email:
            self.user.email = text
        case .phone:
            self.user.mobile = text
        }
        self.validateAndUpdateSaveButton()
    }

    private func validateAndUpdateSaveButton() {
        self.updateSaveButton?(self.user.validateUserToAdd())
    }

    func getSectionType(for index: Int) -> Sections {
        return self.sections[index]
    }

    func getUserTextFor(index: Int) -> (String, String) {
        return self.getUserTextAndPlaceholder(for: self.sections[index])
    }

    private func getUserTextAndPlaceholder(for section: Sections) -> (String, String) {
        switch section {
        case .firstName:
            return (self.user.getFirstName(), Text.firstName)
        case .lastName:
            return (self.user.getLastName(), Text.lastName)
        case .email:
            return (self.user.getEmail(), Text.email)
        case .phone:
            return (self.user.getMobile(), Text.mobileNo)
        }
    }
}
