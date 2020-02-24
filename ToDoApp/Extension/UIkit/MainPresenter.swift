//
//  MainPresenter.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit
import CoreData

class MainPresenter {
    
    private weak var view: MainViewController!
    
    //let defaultTask = DataManager.createTask()
    
    init(view: MainViewController) {
        self.view = view
        
       // filterTasks()
    }
    
//    private func filterTasks() {
//
//        let noDoneTasks = defaultTask.filter({ $0.completed == false})
//        view.defaultTask?.append(noDoneTasks)
//        let doneTasks = defaultTask.filter({ $0.completed })
//        view.defaultTask?.append(doneTasks)
    
    func presentCreateVC() {
        guard let viewController = UIStoryboard(name: "CreateTaskViewController",
                                                bundle: nil)
            .instantiateInitialViewController() as? CreateTaskViewController else { return }
        viewController.presenter = CreatePresenter(view: viewController)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
//    func doneCompletedTask(_ indexPath: IndexPath) -> [UITableViewRowAction]? {
//        return [actionSelectItem(indexPath)]
//    }

    
//    private func actionSelectItem(_ indexPath: IndexPath) -> UITableViewRowAction {
//        let done = UITableViewRowAction(style: .normal, title: "Done") { [weak self] (action, indexPath) in
//
//            guard var _defaultTask = self?.view.defaultTask else { return }
//            self?.view.defaultTask = []
//
//            let completed = _defaultTask[indexPath.section][indexPath.row].completed
//            _defaultTask[indexPath.section][indexPath.row].completed = !completed
//
//            var doneTasks = _defaultTask[0].filter{ $0.completed == false}
//            doneTasks += _defaultTask[1].filter{ $0.completed == false}
//
//            var noDoneTasks = _defaultTask[0].filter{ $0.completed }
//            noDoneTasks += _defaultTask[1].filter{ $0.completed }
//
//            self?.view.defaultTask?.append(doneTasks)
//            self?.view.defaultTask?.append(noDoneTasks)
//
//            self?.view.defaultTask = self?.view.defaultTask
//            self?.view.tableView.reloadData()
//        }
//    }
    
    func fetchRequest() {
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        view.fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: PersistenceService.shared.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try view.fetchResultController.performFetch()
        } catch let error {
            print(error)
        }
    }
}
