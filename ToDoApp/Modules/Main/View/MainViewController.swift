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
    
    var defaultTask: [Task]? = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction private func addTaskButton(_ sender: UIBarButtonItem) {
        presenter.presentCreateVC()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            let done = defaultTask?.filter { $0.completed == false }
            return done?.count ?? 0
        case 1:
            let done = defaultTask?.filter { $0.completed }
            return done?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Невыполненная задача" : "Выполненная задача"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.mainCellId.rawValue)
        
        let done = defaultTask?.filter { $0.completed == false }
        let noDone = defaultTask?.filter { $0.completed }

        let task = indexPath.section == 0 ? done?[indexPath.row] : noDone?[indexPath.row]
        
        cell.textLabel?.text = task?.name ?? ""
        cell.imageView?.image = UIImage(named: task?.imageName ?? "Checklist")
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return presenter.doneCompletedTask(indexPath)
    }
}
