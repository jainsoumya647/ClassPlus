//
//  AddUserViewController.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

protocol AddUserVCDelegate: class {
    func addUser(user: User)
    func updateUser(on index: Int, user: User)
}

class AddUserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    private var viewModel: AddUserViewModel!
    weak var delegate: AddUserVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.addObserverEvents()
    }

    private func addObserverEvents() {
        self.viewModel.updateSaveButton = { [weak self] (isEnabled) in
            self?.saveButton.isEnabled = isEnabled
        }
    }

    private func initializeData(user: User?, index: Int?) {
        self.viewModel = AddUserViewModel(user: user ?? User(), isNewUser: user == nil, index: index ?? 0)
    }

    private func configureViews() {
        self.saveButton.isEnabled = false
        self.configureTableView()
    }

    private func configureTableView() {
        self.register(table: self.tableView)
        AddUserCell.registerWithTable(self.tableView)
    }

    @IBAction func saveAction(_ sender: Any) {
        print(self.viewModel.getUserObject())
        if self.viewModel.isNewUser {
            self.delegate?.addUser(user: self.viewModel.getUserObject())
        } else {
            self.delegate?.updateUser(on: self.viewModel.index, user: self.viewModel.getUserObject())
        }
        
        self.navigationController?.popViewController(animated: true)
    }

    class func getController(user: User?, index: Int?) -> AddUserViewController? {
        let viewController = UIViewController.initalizeMyViewController(identifier: .addUserViewController, storyboard: .main) as? AddUserViewController
        viewController?.initializeData(user: user, index: index)
        return viewController
    }
}

extension AddUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = AddUserCell.getDequeuedCell(for: tableView, indexPath: indexPath) as? AddUserCell else {
            return UITableViewCell()
        }
        let (text, placeholder) = self.viewModel.getUserTextFor(index: indexPath.row)
        let sectionType = self.viewModel.getSectionType(for: indexPath.row)
        cell.configureCell(type: sectionType, text: text, placeholder: placeholder)
        cell.delegate = self
        return cell
    }
}

extension AddUserViewController: AddUserCellDelegate {
    func updateText(on type: Sections, updatedText: String) {
        self.viewModel.updateText(for: type, text: updatedText)
    }
}
