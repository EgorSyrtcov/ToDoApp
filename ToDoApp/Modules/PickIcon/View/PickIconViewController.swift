//
//  PickIconViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class PickIconViewController: UIViewController {
    
    var presenter: PickIconPresenter!
    var taskModel: [Task] = []

    @IBOutlet private weak var tableView: UITableView!
    
}

extension PickIconViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.pickIconCellId.rawValue)
        let task = taskModel[indexPath.row]
        cell.textLabel?.text = task.imageName
        cell.imageView?.image = UIImage(named: task.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
}
