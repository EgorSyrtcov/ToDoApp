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
    
    let defaultTasks = DefaultTask.createTask()
    
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
        let done = UITableViewRowAction(style: .normal, title: "Done") { [weak self] (action, indexPath) in
            
            if self?.view.defaultTask?[indexPath.row].completed == true {
                self?.view.defaultTask?[indexPath.row].completed = false
                self?.view.tableView.reloadData()
                return
            } else {
                self?.view.defaultTask?[indexPath.row].completed = true
                self?.view.tableView.reloadData()
            }
           
        }
        return [done]
    }
}
