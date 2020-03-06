//
//  AddUserCell.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

enum Sections {
    case firstName
    case lastName
    case email
}

protocol AddUserCellDelegate: class {
    func updateText(on type: Sections, updatedText: String)
}

class AddUserCell: ReusableTableViewCell {

    @IBOutlet weak var palceholderLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    var type: Sections!
    weak var delegate: AddUserCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

    func setupCell() {
        self.inputTextField.delegate = self
    }
    
    func configureCell(type: Sections) {
        self.type = type
    }
    
}

extension AddUserCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return false }
        self.delegate?.updateText(on: self.type, updatedText: updatedString)
        return true
    }
    
}
