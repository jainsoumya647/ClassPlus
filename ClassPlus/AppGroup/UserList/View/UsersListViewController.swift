//
//  UsersListViewController.swift
//  ClassPlus
//
//  Created by Soumya Jain on 06/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: UsersListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initalizeData()
        self.observeEvents()
        self.configureViews()
    }
    
    private func observeEvents() {
        self.viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func initalizeData() {
        self.viewModel = UsersListViewModel()
    }
    
    private func configureViews() {
        self.configureTableView()
    }
    
    private func configureTableView() {
        self.register(table: self.tableView)
        UsersCell.registerWithTable(self.tableView)
    }
    
    @IBAction func addAction(_ sender: Any) {
    }
    
}

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = UsersCell.getDequeuedCell(for: tableView, indexPath: indexPath) as? UsersCell,
            let user = self.viewModel.getUser(onIndex: indexPath.row) else {
            return UITableViewCell()
        }
        cell.configureCell(user: user, index: indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel.fetchNextPageUsers()
    }
}

extension UsersListViewController: UsersCellDelegate {
    func moreAction(on index: Int) {
        self.presentActionSheet()
    }
    
    func presentActionSheet() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let updateAction = UIAlertAction(title: "Update User", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            
        })

        let deleteAction = UIAlertAction(title: "Delete User", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
            
        })
        
        alertController.addAction(updateAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
