//
//  MainViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

enum Properties: String {
    case MainCellId = "MainCellId"
    case PickIconCellId = "PickIconCellId"
}

final class MainViewController: UIViewController {
    
    var presenter: MainPresenter!
    
    var defaultTask: [Task]? = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBAction private func addTaskButton(_ sender: UIBarButtonItem) {
        presenter.presentCreateVC()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultTask?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.MainCellId.rawValue)
        let task = defaultTask?[indexPath.row]
        cell.textLabel?.text = "\(task?.name ?? "")" 
        cell.imageView?.image = UIImage(named: task?.imageName ?? "Checklist")
        return cell
    }
}
