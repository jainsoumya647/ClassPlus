//
//  ReusableTableViewCell.swift
//  Blog
//
//  Created by Soumya on 14/01/20.
//  Copyright © 2020 Soumya. All rights reserved.
//

import UIKit

class ReusableTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }

    /// Reuse Identifier String
    public class var reuseIdentifier: String {
        return "\(self.self)"
    }

    /// Registers the Nib with the provided table
    static func registerWithTable(_ table: UITableView) {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier, bundle: bundle)
        table.register(nib, forCellReuseIdentifier: self.reuseIdentifier)
    }

    static func getDequeuedCell(for table: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        return table.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
    }

}
