//
//  CreatePresenter.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class CreatePresenter {
    
    private weak var view: CreateTaskViewController!
    
    init(view: CreateTaskViewController) {
        self.view = view
    }
    
    func presentPickIconVC() {
        guard let viewController = UIStoryboard(name: "PickIconViewController",
                                                bundle: nil).instantiateInitialViewController() as? PickIconViewController else { return }
        viewController.presenter = PickIconPresenter(view: viewController)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func saveTask() {
        guard let newTask = view.nameTaskTextView.text, newTask.isEmpty == false else { return }
        let task = Tasks(context: PersistenceService.viewContext)
        task.name = newTask
        PersistenceService.saveContext()
        backMainVC()
    }
    
   private func backMainVC() {
        view.navigationController?.popViewController(animated: true)
    }
}
