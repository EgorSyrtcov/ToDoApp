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
    
    let defaultTask = DataManager.createTask()
    
    init(view: MainViewController) {
        self.view = view
        
       filterTasks()
    }
    
    func filterTasks() {
        
        let noDoneTasks = defaultTask.filter({ $0.completed == false})
        view.defaultTask?.append(noDoneTasks)
        let doneTasks = defaultTask.filter({ $0.completed })
        view.defaultTask?.append(doneTasks)
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
            
            guard let task = self?.view.defaultTask?[indexPath.section][indexPath.row] else { return }
            
            task.completed = !task.completed
            
            let doneTasks = self?.view.defaultTask?.reduce([], +).filter { $0.completed }
            
            let noDoneTasks = self?.view.defaultTask?.reduce([], +).filter { !$0.completed }
            
            self?.view.defaultTask = [noDoneTasks ?? [], doneTasks ?? []]
            
            self?.view.tableView.reloadData()
            
        }
        
        return done
        
    }
}
