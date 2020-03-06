//
//  AddUserViewController.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var viewModel: AddUserViewModel!

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

    private func initializeData(user: User?) {
        self.viewModel = AddUserViewModel(user: user ?? User())
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
        
    }

    class func getController(user: User?) -> AddUserViewController? {
        let viewController = UIViewController.initalizeMyViewController(identifier: .addUserViewController, storyboard: .main) as? AddUserViewController
        viewController?.initializeData(user: user)
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
