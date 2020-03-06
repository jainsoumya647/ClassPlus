//
//  UsersCell.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

protocol UsersCellDelegate: class {
    func moreAction(on index: Int)
}

class UsersCell: ReusableTableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    weak var delegate:UsersCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(user: User, index: Int) {
        self.profileImageView.downloadImage(from: user.getImageURLString())
        self.nameLabel.text = user.getFullName()
        self.emailLabel.text = user.email
        self.moreButton.tag = index
    }
    
    @IBAction func moreButtonAction(_ sender: UIButton) {
        self.delegate?.moreAction(on: sender.tag)
    }
}
