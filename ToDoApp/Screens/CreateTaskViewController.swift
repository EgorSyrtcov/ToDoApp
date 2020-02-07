//
//  CreateTaskViewController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

final class CreateTaskViewController: UIViewController, StoryboardInitializable {
    
    var icon: IconModel?
    var complition: ((_ icon: IconModel?) -> Void)?
    
    @IBOutlet weak var nameTaskTextView: UITextView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectionIconButton(_ sender: UIButton) {
        let pickIconViewController = PickIconViewController.initFromStoryboard()
        pickIconViewController.complition = { [weak self] icon in
            self?.iconImageView.image = UIImage(named: icon.imageName)
            self?.icon = icon
        }
        navigationController?.pushViewController(pickIconViewController, animated: true)
    }
    
    @IBAction func saveTaskButton(_ sender: UIButton) {
        
        guard let newTask = nameTaskTextView.text, newTask.isEmpty == false else { return}
        let iconNew = IconModel(name: "", imageName: icon?.imageName ?? "Checklist", task: newTask)
        complition?(iconNew)
        navigationController?.popViewController(animated: true)
    }
}
