//
//  MainPresenter.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class MainPresenter {
    
    private weak var view: MainViewController!
    
    let defaultTasks = DefaultTask.createTask()
    
    init(view: MainViewController) {
        self.view = view
        view.tasksModel = defaultTasks
    }
    
    func presentCreateVC() {
        guard let viewController = UIStoryboard(name: "CreateTaskViewController", bundle: nil).instantiateInitialViewController() as? CreateTaskViewController else { return }
        viewController.presenter = CreatePresenter(view: viewController)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
