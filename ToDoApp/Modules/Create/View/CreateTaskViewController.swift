//
//  CreateTaskViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

final class CreateTaskViewController: UIViewController {
    
    var presenter: CreatePresenter!
    
    @IBOutlet weak var nameTaskTextView: UITextView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBAction func selectionIconButton(_ sender: UIButton) {
        presenter.presentPickIconVC()
    }
    
    @IBAction func saveTaskButton(_ sender: UIButton) {
        presenter.saveTask()
    }
}
