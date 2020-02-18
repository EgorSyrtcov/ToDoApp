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
        
        let doneTasks = defaultTask?.filter({ $0.completed })
        
        let noDoneTasks = defaultTask?.filter({ $0.completed == false
        })
        
        return section == 0 ? (noDoneTasks?.count ?? 0) : (doneTasks?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return section == 0 ? "Невыполненная задача" : "Выполненная задача"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.mainCellId.rawValue)
       
        let doneTasks = defaultTask?.filter({ $0.completed })
        let noDoneTasks = defaultTask?.filter({ $0.completed == false
        })
        
        let task = indexPath.section == 0 ? noDoneTasks?[indexPath.row] : doneTasks?[indexPath.row]
        cell.textLabel?.text = task?.name ?? ""
        cell.imageView?.image = UIImage(named: task?.imageName ?? "Checklist")
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        return presenter.doneCompletedTask(indexPath)
        
        let done = UITableViewRowAction(style: .normal, title: "Done") { [weak self] (action, indexPath) in
            
            guard let selectedItemName = tableView.cellForRow(at: indexPath)?.textLabel?.text,
                let tasks = self?.defaultTask,
                let selectedTask = (tasks.first { $0.name == selectedItemName }) else { return }
            selectedTask.completed = !selectedTask.completed
            // delay about 0.3 sec
            tableView.reloadData()
        }
        return [done]
    }
}
