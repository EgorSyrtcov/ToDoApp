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
    var iconsModel: [Task] = []

    @IBOutlet private weak var tableView: UITableView!
}

extension PickIconViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.pickIconCellId.rawValue)
        let icon = iconsModel[indexPath.row]
        cell.textLabel?.text = icon.imageName
        cell.imageView?.image = UIImage(named: icon.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
    

