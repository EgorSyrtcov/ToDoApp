//
//  MainViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

private struct Properties {
    static let сellReuseIdentifier = "MainCellId"
}

final class MainViewController: UIViewController, StoryboardInitializable {
    
    var iconsModel: [IconModel]? = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction private func eddTaskButton(_ sender: UIBarButtonItem) {
        let createTaskViewController = CreateTaskViewController.initFromStoryboard()
        createTaskViewController.complition = { [weak self] icon in
            
            guard let icon = icon else {return}
            self?.iconsModel?.append(icon)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        navigationController?.pushViewController(createTaskViewController, animated: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconsModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: Properties.сellReuseIdentifier)
        let icon = iconsModel?[indexPath.row]
        cell.textLabel?.text = icon?.task
        cell.imageView?.image = UIImage(named: icon?.imageName ?? "Checklist")
        return cell
    }
    
    
}
