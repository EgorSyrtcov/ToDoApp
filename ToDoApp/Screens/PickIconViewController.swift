//
//  PickIconViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

private struct Properties {
    static let сellReuseIdentifier = "PickIconCellId"
}

class PickIconViewController: UIViewController, StoryboardInitializable {
    
    let iconsModel = DataManager.createIcon()
    
    var complition: ((_ icon: IconModel) -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension PickIconViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.сellReuseIdentifier)
        let icon = iconsModel[indexPath.row]
        cell.textLabel?.text = icon.name
        cell.imageView?.image = UIImage(named: icon.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let icon = iconsModel[indexPath.row]
        complition?(icon)
        navigationController?.popViewController(animated: true)
    }
}
