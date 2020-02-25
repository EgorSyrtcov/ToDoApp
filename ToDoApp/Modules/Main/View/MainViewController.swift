//
//  MainViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit
import CoreData

enum Properties: String {
    case mainCellId = "MainCellId"
    case pickIconCellId = "PickIconCellId"
}

final class MainViewController: UIViewController {
    
    var presenter: MainPresenter!
   // var defaultTask: [[Task]]? = []

    var fetchResultController: NSFetchedResultsController<Tasks>!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchRequest()
        fetchResultController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction private func addTaskButton(_ sender: UIBarButtonItem) {
        presenter.presentCreateVC()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return defaultTask?.count ?? 0

        return fetchResultController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchResultController.sections?[section]
        
        //return defaultTask?[section].count ?? 0

        return sectionInfo?.numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.mainCellId.rawValue)
        
//        let task = defaultTask?[indexPath.section][indexPath.row]
//        cell.textLabel?.text = task?.name ?? "Ничего нет"
//        cell.imageView?.image = UIImage(named: task?.imageName ?? "Checklist")

        let task = fetchResultController.object(at: indexPath)
        
        cell.textLabel?.text = task.name
        return cell
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        return presenter?.doneCompletedTask(indexPath)
//    }
}

extension MainViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            
            if indexPath != nil {
                tableView.insertRows(at: [indexPath!], with: .automatic)
            }
        default:
            break
        }
    }
}

