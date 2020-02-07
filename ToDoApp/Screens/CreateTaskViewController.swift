//
//  CreateTaskViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

typealias block = ((_ task: Task?) -> Void)

final class CreateTaskViewController: UIViewController {
    
    var task: Task?
    var complition: (block)?
    
    @IBOutlet private weak var nameTaskTextView: UITextView!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBAction func selectionIconButton(_ sender: UIButton) {
        let pickIconViewController = PickIconViewController.initFromStoryboard()
        pickIconViewController.complition = { [weak self] task in
            self?.iconImageView.image = UIImage(named: task?.imageName ?? "Checklist")
            self?.task = task
        }
        navigationController?.pushViewController(pickIconViewController, animated: true)
    }
    
    @IBAction func saveTaskButton(_ sender: UIButton) {
        
        guard let newTask = nameTaskTextView.text, newTask.isEmpty == false else { return}
        let taskNew = Task(imageName: task?.imageName ?? "Checklist", name: newTask)
        complition?(taskNew)
        navigationController?.popViewController(animated: true)
    }
}
