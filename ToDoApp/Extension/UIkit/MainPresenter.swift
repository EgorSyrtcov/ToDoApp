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
        let done = UITableViewRowAction(style: .normal, title: "Done") { [weak self] (action, indexPath) in
            
            var isComplited = self?.view.defaultTask?[indexPath.row].completed
            
            isComplited = !isComplited!
        }
        return [done]
    }
}
