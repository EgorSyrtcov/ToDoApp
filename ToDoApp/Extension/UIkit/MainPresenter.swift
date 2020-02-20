//
//  MainPresenter.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit
import CoreData

class MainPresenter {
    
    private weak var view: MainViewController!
    
    init(view: MainViewController) {
        self.view = view
    }
    
    func presentCreateVC() {
        guard let viewController = UIStoryboard(name: "CreateTaskViewController",
                                                bundle: nil)
        .instantiateInitialViewController() as? CreateTaskViewController else { return }
        viewController.presenter = CreatePresenter(view: viewController)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func fetchRequest() {
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        view.fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: PersistenceService.shared.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try view.fetchResultController.performFetch()
        } catch let error {
            print(error)
        }
    }
}
