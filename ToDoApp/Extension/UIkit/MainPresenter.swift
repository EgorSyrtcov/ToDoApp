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
    
    func editTask(indexPath: IndexPath) -> [UITableViewRowAction?] {
        let editButton = UITableViewRowAction(style: .normal, title: "Edit") { [weak self] (rowAction, indexPath) in
            let task = self?.view.fetchResultController.object(at: indexPath)
            
            let alertController = UIAlertController(title: "Редактирование задачи", message: task?.name, preferredStyle: .alert)
            
            alertController.addTextField { (textField) in
                textField.placeholder = "\(task?.name ?? "new task")"
            }
            
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (_) in
                let task = self?.view.fetchResultController.object(at: indexPath)
                
                guard let newTask = alertController.textFields?[0] else { return }
                task?.name = newTask.text
                
                PersistenceService.shared.saveContext()
                
                self?.view.tableView.reloadData()
            }))
            
            self?.view.present(alertController, animated: true, completion: nil)
        }
        
        let deleteButton = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            let task = self.view.fetchResultController.object(at: indexPath)
            
            PersistenceService.shared.persistentContainer.viewContext.delete(task)
            PersistenceService.shared.saveContext()
        }
        return [deleteButton, editButton]
    }
}

