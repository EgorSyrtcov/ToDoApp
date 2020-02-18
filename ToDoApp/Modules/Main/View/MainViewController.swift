//
//  MainViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum Properties: String {
    case mainCellId = "MainCellId"
    case pickIconCellId = "PickIconCellId"
}

final class MainViewController: UIViewController {
   
    var presenter: MainPresenter!
    
    var defaultTask: [[Task]]? = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction private func addTaskButton(_ sender: UIBarButtonItem) {
        presenter.presentCreateVC()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return defaultTask?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return defaultTask?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return section == 0 ? "Невыполненная задача" : "Выполненная задача"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.mainCellId.rawValue)

        let task = defaultTask?[indexPath.section][indexPath.row]
        cell.textLabel?.text = task?.name ?? "Ничего нет"
        cell.imageView?.image = UIImage(named: task?.imageName ?? "Checklist")
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return presenter?.doneCompletedTask(indexPath)
    }
}
