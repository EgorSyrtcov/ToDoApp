//
//  MainPresenter.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class MainPresenter {
    
    private weak var view: MainViewController!
    
    let defaultTasks = DataManager.createTask()
    
    init(view: MainViewController) {
        self.view = view
        view.defaultTask = defaultTasks
    }
    
    func presentCreateVC() {
        guard let viewController = UIStoryboard(name: "CreateTaskViewController",
                                                bundle: nil)
        .instantiateInitialViewController() as? CreateTaskViewController else { return }
        viewController.presenter = CreatePresenter(view: viewController)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func doneCompletedTask(_ indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [actionSelectItem(indexPath)]
    }
    
    private func actionSelectItem(_ indexPath: IndexPath) -> UITableViewRowAction {
        let done = UITableViewRowAction(style: .normal, title: "Done") { [weak self] (action, indexPath) in
            
            guard let selectedItemName = self?.view.tableView.cellForRow(at: indexPath)?.textLabel?.text,
                let tasks = self?.view.defaultTask,
                let selectedTask = (tasks.first { $0.name == selectedItemName }) else { return }
            selectedTask.completed = !selectedTask.completed
            
            self?.view.tableView.reloadData()
        }
        return done
    }
}
